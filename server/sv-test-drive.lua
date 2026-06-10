local activeTestDrives = {}

-- Callback to initiate a test drive session
lib.callback.register("jg-dealerships:server:start-test-drive", function(source, dealershipId, spawnCoords, clientNetId, vehicleModel, enableTestDrive, plate, color)
    local playerPed = GetPlayerPed(source)
    local identifier = Framework.Server.GetPlayerIdentifier(source)
    
    if not identifier then
        DebugPrint("jg-dealerships:server:start-test-drive: No identifier found for player " .. tostring(source), "warning")
        return false
    end

    local vehicleEntity = nil
    local netId = clientNetId

    -- Handle Server-Side Setter Spawning
    if Config.SpawnVehiclesWithServerSetter then
        local spawnInside = not Config.DoNotSpawnInsideVehicle
        local props = { plate = plate, colour = color }
        
        -- Native wrapper call to the script's internal vehicle setter
        local success, spawnedVeh, spawnedNetId = pcall(function()
            return SpawnVehicleServer(source, 0, vehicleModel, plate, spawnCoords, spawnInside, props, "testDrive")
        end)

        if success and spawnedVeh then
            vehicleEntity = spawnedVeh
            netId = spawnedNetId
        end
    else
        -- Handle Client-Side Spawning Verification
        if clientNetId then
            -- FIX: Give the client's network pack time to synchronize the vehicle to the server
            local timeout = 50
            while timeout > 0 do
                vehicleEntity = NetworkGetEntityFromNetworkId(clientNetId)
                if vehicleEntity and vehicleEntity ~= 0 and DoesEntityExist(vehicleEntity) then
                    break
                end
                Wait(50)
                timeout = timeout - 1
            end
        end
    end

    -- Failure protection if the car didn't successfully materialize
    if not vehicleEntity or vehicleEntity == 0 or not netId then
        Framework.Server.Notify(source, "Could not spawn vehicle", "error")
        return false
    end

    -- Handle Virtual Routing Buckets (Instancing protection)
    local originalBucket = 0
    if not Config.TestDriveNotInBucket then
        if Config.ReturnToPreviousRoutingBucket then
            originalBucket = GetPlayerRoutingBucket(source)
        end

        local newBucket = math.random(100, 999)
        SetPlayerRoutingBucket(source, newBucket)
        SetEntityRoutingBucket(vehicleEntity, newBucket)
    end

    -- Save the test drive session metadata in memory
    activeTestDrives[identifier] = {
        dealershipId = dealershipId,
        originalBucket = originalBucket,
        originalCoords = GetEntityCoords(playerPed),
        vehicleNetId = netId,
        vehicleModel = vehicleModel,
        vehicleColour = color
    }

    -- Discord Logger Integration
    if Webhooks and Webhooks.TestDrive then
        SendWebhook(source, Webhooks.TestDrive, "New Test Drive", "success", {
            { key = "Vehicle", value = vehicleModel },
            { key = "Dealership", value = dealershipId },
            { key = "Plate", value = plate }
        })
    end

    return true, netId
end)

-- Callback to end a test drive session and clean up the environment
lib.callback.register("jg-dealerships:server:finish-test-drive", function(source)
    local identifier = Framework.Server.GetPlayerIdentifier(source)
    if not identifier then
        DebugPrint("jg-dealerships:server:finish-test-drive: No identifier found for player " .. tostring(source), "warning")
        return false
    end

    local session = activeTestDrives[identifier]
    if not session then
        DebugPrint("jg-dealerships:server:finish-test-drive: No active test drive session found for player " .. tostring(source), "warning")
        return false
    end

    -- Securely resolve the entity through its network mapping ID
    local vehicle = NetworkGetEntityFromNetworkId(session.vehicleNetId)
    if vehicle and DoesEntityExist(vehicle) then
        SetEntityVelocity(vehicle, 0.0, 0.0, 0.0)

        -- Safely warp out all occupants inside the car frame
        for seat = -1, 5 do
            local pedInSeat = GetPedInVehicleSeat(vehicle, seat)
            if pedInSeat and pedInSeat ~= 0 then
                TaskLeaveVehicle(pedInSeat, vehicle, 0)
            end
        end

        SetVehicleDoorsLocked(vehicle, 2)
        JGDeleteVehicle(vehicle)
    end

    -- Return player back to their showroom position
    local playerPed = GetPlayerPed(source)
    local config = Config.DealershipLocations[session.dealershipId]
    if config and config.openShowroom and config.openShowroom.coords then
        local coords = config.openShowroom.coords
        SetEntityCoords(playerPed, coords.x, coords.y, coords.z, false, false, false, false)
    end

    Wait(500)

    -- Collapse the player back into their original routing bucket dimension
    if not Config.TestDriveNotInBucket then
        SetPlayerRoutingBucket(source, session.originalBucket or 0)
    end

    -- Structure response dataset exactly how the client data wrapper expects it
    local savedData = {
        dealershipId = session.dealershipId,
        vehicleModel = session.vehicleModel,
        vehicleColour = session.vehicleColour
    }

    -- Purge cache pointer allocation
    activeTestDrives[identifier] = nil
    return savedData
end)