local testDriveVehicle = nil

-- FIXED: Added robust fallback to parse configuration spawn elements seamlessly
local function FindVehicleSpawnCoords(spawnPoint)
    if not spawnPoint then return nil end
    if type(spawnPoint) == "vector4" or type(spawnPoint) == "vector3" then
        return spawnPoint
    -- If it's a structural table config map
    elseif type(spawnPoint) == "table" then
        if spawnPoint.x and spawnPoint.y and spawnPoint.z then
            return spawnPoint
        elseif #spawnPoint > 0 then
            -- If it's an array listing multiple points, look for an un-occupied location frame
            for _, coords in ipairs(spawnPoint) do
                local c = (type(coords) == "table" and coords.coords) or coords
                if c and not IsPositionOccupied(c.x, c.y, c.z, 3.0, false, true, true, false, false, 0, false) then
                    return coords
                end
            end
            return spawnPoint[1]
        end
    end
    return spawnPoint
end

local function FinishTestDrive()
    if not Globals.IsTestDriving then return false end
    Globals.IsTestDriving = false

    DoScreenFadeOut(500)
    Wait(500)

    local plate = Framework.Client.GetPlate(testDriveVehicle)
    if plate then
        Framework.Client.VehicleRemoveKeys(plate, testDriveVehicle, "testDrive")
    end

    testDriveVehicle = nil
    
    local data = lib.callback.await("jg-dealerships:server:finish-test-drive", false)
    TriggerEvent("jg-dealerships:client:open-showroom", data.dealershipId, data.vehicleModel, data.vehicleColour)
end

local function TestDriveLoop()
    CreateThread(function()
        while Globals.IsTestDriving do
            if not cache.vehicle then
                FinishTestDrive()
                break
            end

            SetPlayerCanDoDriveBy(cache.ped, false)
            DisablePlayerFiring(cache.ped, true)
            DisableControlAction(0, 140, true)
            
            Wait(0)
        end
    end)
end

local function StartTestDrive(dealershipId, vehicleModel, color)
    local config = Config.DealershipLocations[dealershipId]
    if not config or not config.enableTestDrive then return false end

    local vehicleLabel = Framework.Client.GetVehicleLabel(vehicleModel)
    local plate = lib.callback.await("jg-dealerships:server:vehicle-generate-plate", false, Config.TestDrivePlate, false)
    local spawnCoords = FindVehicleSpawnCoords(config.testDriveSpawn)

    ExitShowroom()
    Wait(1000) -- Increased wait time to let the showroom vehicle fully despawn from memory

    local vehEntity = false
    local netId = nil

    if not Config.SpawnVehiclesWithServerSetter then
        vehEntity = SpawnVehicleClient(0, vehicleModel, plate, spawnCoords, true, {plate = plate, colour = color}, "testDrive")
        
        if not vehEntity or vehEntity == 0 then return false end
        
        -- FIX: Prevent NETWORK_GET_NETWORK_ID_FROM_ENTITY error by ensuring entity is networked
        local timeout = 50
        while not NetworkGetEntityIsNetworked(vehEntity) and timeout > 0 do
            Wait(50)
            timeout = timeout - 1
        end
        
        if not NetworkGetEntityIsNetworked(vehEntity) then
            NetworkRegisterEntityAsNetworked(vehEntity)
            Wait(100) -- Give the engine a tick to register
        end
        
        if NetworkGetEntityIsNetworked(vehEntity) then
            netId = VehToNet(vehEntity)
            SetNetworkIdExistsOnAllMachines(netId, true)
        else
            print("^1[Dealership] Warning: Failed to network test-drive vehicle.^7")
            JGDeleteVehicle(vehEntity)
            return false
        end
    end

    local success, serverNetId = lib.callback.await("jg-dealerships:server:start-test-drive", false, dealershipId, spawnCoords, netId, vehicleModel, config.enableTestDrive, plate, color)

    if serverNetId then
        netId = serverNetId
        
        local timeout = 50
        while timeout > 0 do
            if NetworkDoesNetworkIdExist(netId) then
                local resolvedVeh = NetToVeh(netId)
                if resolvedVeh and resolvedVeh ~= 0 then
                    vehEntity = resolvedVeh
                    break
                end
            end
            Wait(50)
            timeout = timeout - 1
        end
    end

    if not success or not vehEntity or vehEntity == 0 then
        if vehEntity and vehEntity ~= 0 then JGDeleteVehicle(vehEntity) end
        return false
    end

    -- Force the player into the driver's seat
    TaskWarpPedIntoVehicle(cache.ped, vehEntity, -1)

    Globals.IsTestDriving = true
    testDriveVehicle = vehEntity

    -- Release the UI focus
    SetNuiFocus(false, false)
    SendNUIMessage({
        type = "testDriveHud",
        time = Config.TestDriveTimeSeconds or 60,
        locale = Locale,
        config = Config
    })

    local currentPlate = Framework.Client.GetPlate(vehEntity)
    TriggerEvent("jg-dealerships:client:start-test-drive:config", vehEntity, currentPlate)

    DoScreenFadeIn(500)

    CreateThread(function()
        Wait(2500)
        TestDriveLoop()
    end)

    return true
end

RegisterNUICallback("finish-test-drive", function(data, cb)
    FinishTestDrive()
    cb(true)
end)

RegisterNUICallback("test-drive", function(data, cb)
    DoScreenFadeOut(500)
    Wait(500)

    local success = StartTestDrive(data.dealershipId, data.vehicle, data.color)

    if not success then
        -- FIX: Release the NUI focus immediately so the player doesn't get permanently stuck
        SetNuiFocus(false, false)
        DoScreenFadeIn(500)
        cb(false) -- Returns a clean false instead of {error=true} to prevent UI promise rejection spam
        return
    end

    cb(true)
end)

AddEventHandler("onResourceStop", function(resourceName)
    if GetCurrentResourceName() == resourceName then
        if Globals.IsTestDriving then
            TriggerServerEvent("jg-dealerships:server:exit-bucket")
            if cache.vehicle then
                DeleteEntity(cache.vehicle)
            end
        end
    end
end)