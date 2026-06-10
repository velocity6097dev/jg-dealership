local playersInShowroom = {}
local showroomCache = {}

function UpdateDealershipShowroomCache(dealershipId)
    local config = Config.DealershipLocations[dealershipId]
    if not config then return false end
    
    if not config.categories or #config.categories == 0 then
        showroomCache[dealershipId] = {}
        return
    end

    local query = "SELECT vehicle.*, stock.stock as stock, stock.price as price FROM dealership_vehicles vehicle INNER JOIN dealership_stock stock ON vehicle.spawn_code = stock.vehicle INNER JOIN dealership_data dealership ON stock.dealership = dealership.name WHERE vehicle.category IN (?) AND (dealership.name = ?) ORDER BY vehicle.spawn_code ASC;"
    local vehicles = MySQL.query.await(query, {config.categories, dealershipId})
    
    showroomCache[dealershipId] = vehicles
end

function UpdateAllDealershipsShowroomCache()
    for id, _ in pairs(Config.DealershipLocations) do
        UpdateDealershipShowroomCache(id)
    end
end

lib.callback.register("jg-dealerships:server:enter-showroom", function(source, dealershipId, config, originalCoords)
    local identifier = Framework.Server.GetPlayerIdentifier(source)
    if not identifier then
        DebugPrint("jg-dealerships:server:enter-showroom: no identifier found for player " .. tostring(source), "warning")
        return false
    end

    local ped = GetPlayerPed(source)
    local camCoords = config.camera.coords
    local originalBucket = 0

    if Config.ReturnToPreviousRoutingBucket then
        originalBucket = GetPlayerRoutingBucket(source)
    end

    -- Failsafe: If client didn't send coordinates, grab them directly from the server entity
    if not originalCoords then
        originalCoords = GetEntityCoords(ped)
    end

    -- Save player data so we know where to put them when they leave
    playersInShowroom[identifier] = {
        dealership = dealershipId,
        originalBucket = originalBucket,
        originalCoords = originalCoords
    }

    local newBucket = math.random(100, 999)
    SetPlayerRoutingBucket(source, newBucket)
    
    -- Teleport player to the camera coords to load the showroom
    SetEntityCoords(ped, camCoords.x, camCoords.y, camCoords.z, false, false, false, false)
    ClearPedTasksImmediately(ped)
    FreezeEntityPosition(ped, true)

    if not showroomCache[dealershipId] then
        UpdateDealershipShowroomCache(dealershipId)
    end

    local financeQuery = "SELECT COUNT(*) as total FROM " .. Framework.VehiclesTable .. " WHERE financed = 1 AND " .. Framework.PlayerId .. " = ?"
    local financedCount = MySQL.scalar.await(financeQuery, {identifier})
    
    local maxFinanced = Config.MaxFinancedVehiclesPerPlayer or 999999
    local financeAllowed = financedCount < maxFinanced

    return {
        vehicles = showroomCache[dealershipId],
        financeAllowed = financeAllowed
    }
end)

lib.callback.register("jg-dealerships:server:exit-showroom", function(source, dealershipId)
    local identifier = Framework.Server.GetPlayerIdentifier(source)
    if not identifier then
        DebugPrint("jg-dealerships:server:exit-showroom: no identifier found for player " .. tostring(source), "warning")
        return false
    end

    local ped = GetPlayerPed(source)
    local playerData = playersInShowroom[identifier]

    -- Safely return the player to their original position
    if playerData and playerData.originalCoords then
        SetPlayerRoutingBucket(source, playerData.originalBucket)
        local coords = playerData.originalCoords
        SetEntityCoords(ped, coords.x, coords.y, coords.z, false, false, false, false)
    elseif dealershipId then
        -- Failsafe: If memory lost the original coords, teleport to dealership doors
        SetPlayerRoutingBucket(source, 0)
        local config = Config.DealershipLocations[dealershipId]
        if config and config.openShowroom and config.openShowroom.coords then
            local coords = config.openShowroom.coords
            SetEntityCoords(ped, coords.x, coords.y, coords.z, false, false, false, false)
        end
    end

    FreezeEntityPosition(ped, false)
    ClearPedTasksImmediately(ped)
    playersInShowroom[identifier] = nil

    return true
end)

lib.callback.register("jg-dealerships:server:get-showroom-vehicle-data", function(source, dealershipId, spawnCode)
    return MySQL.single.await("SELECT * FROM dealership_stock WHERE vehicle = ? AND dealership = ?", {spawnCode, dealershipId})
end)