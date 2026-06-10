local spawnRetries = {}
local MAX_DISTANCE = 10.0
local MAX_RETRIES = 5 -- Increased threshold to give server more processing headroom

local function InternalSpawn(source, hash, vehicleType, plate, coords, warpPed, props)
    if spawnRetries[source] and spawnRetries[source] == MAX_RETRIES then
        print("^3[WARNING] Vehicle props failed to set after trying several times. First check if the plate within the vehicle props JSON does not match the plate column. If they match, and you see this message regularly, try setting Config.SpawnVehiclesWithServerSetter = false^7")
        spawnRetries[source] = 0
        return false
    end

    spawnRetries[source] = (spawnRetries[source] or 0) + 1

    -- Spawn entity via server setter
    local vehicle = CreateVehicleServerSetter(hash, vehicleType, coords.x, coords.y, coords.z, coords.w)

    lib.waitFor(function()
        if DoesEntityExist(vehicle) then return true end
    end, "Timed out while trying to spawn in vehicle (server)", 10000)

    lib.waitFor(function()
        local p = GetVehicleNumberPlateText(vehicle)
        if p and p ~= "" then return true end
    end, "Vehicle number plate text is nil", 5000)

    -- Force sync player's exact routing bucket state
    SetEntityRoutingBucket(vehicle, GetPlayerRoutingBucket(source))

    if SetEntityOrphanMode then
        SetEntityOrphanMode(vehicle, 2)
    end

    -- Clear accidental script-spawned ambient drivers
    for i = -1, 6 do
        local pedInSeat = GetPedInVehicleSeat(vehicle, i)
        if pedInSeat ~= 0 then 
            DeleteEntity(pedInSeat) 
        end
    end

    local ped = GetPlayerPed(source)
    if warpPed then
        pcall(function()
            lib.waitFor(function()
                if GetPedInVehicleSeat(vehicle, -1) == ped then return true end
                SetPedIntoVehicle(ped, vehicle, -1)
            end, nil, 1000)
        end)
    end

    lib.waitFor(function()
        if NetworkGetEntityOwner(vehicle) ~= -1 then return true end
    end, "Timed out waiting for server-setter entity to have an owner", 5000)

    -- Broadcast state tracking identifiers to client
    Entity(vehicle).state:set("vehInit", true, true)

    if props and type(props) == "table" then
        Entity(vehicle).state:set("dealershipVehCreatedApplyProps", props, true)
    end

    local success = pcall(function()
        lib.waitFor(function()
            if not Entity(vehicle).state.dealershipVehCreatedApplyProps then
                if plate and plate ~= "" then
                    if Framework.Server.GetPlate(vehicle) ~= plate then
                        return false
                    end
                end
                return true
            end
        end, nil, 3000) -- Increased wait allowance for slower clients
    end)

    if not success then
        if DoesEntityExist(vehicle) then DeleteEntity(vehicle) end
        if JGDeleteVehicle then JGDeleteVehicle(vehicle) end
        return InternalSpawn(source, hash, vehicleType, plate, coords, warpPed, props)
    end

    spawnRetries[source] = 0
    local netId = NetworkGetNetworkIdFromEntity(vehicle)
    return netId, vehicle
end

function SpawnVehicleServer(source, vehicleId, model, plate, coords, warpPed, props, origin)
    local success, hash, vehicleType, hasSeats = lib.callback.await("jg-dealerships:client:req-vehicle-and-get-spawn-details", source, model, plate)
    if not success then return false end

    local ped = GetPlayerPed(source)
    local pedCoords = GetEntityCoords(ped)
    local needsTeleport = false

    if #(pedCoords - coords.xyz) > MAX_DISTANCE then
        SetEntityCoords(ped, coords.x + 3.0, coords.y + 3.0, coords.z, false, false, false, false)
        needsTeleport = true
    end

    local netId, vehicle = InternalSpawn(source, hash, vehicleType, plate, coords, warpPed and hasSeats, props)
    if not netId or not vehicle then return false end

    local clientSuccess = lib.callback.await("jg-dealerships:client:on-server-vehicle-created", source, netId, needsTeleport and pedCoords or false, warpPed and hasSeats, hash, vehicleId, plate, props, origin)

    if not clientSuccess then
        if DoesEntityExist(vehicle) then
            DeleteEntity(vehicle)
            DebugPrint("Failed to create vehicle, deleted entity.", "warning", netId)
        end
        return false
    end

    return netId, vehicle
end