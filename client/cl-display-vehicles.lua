-- local activePoints = {}
-- local spawnedDisplayVehicles = {}
-- local isPlacingVehicle = false

-- -- Full keyboard block list to freeze character during fine-tuning phase
-- local placementControls = {30, 31, 32, 33, 34, 35, 38, 44, 51, 73, 201, 27, 173, 174, 175}

-- local function GetDirectionVector(heading)
--     local rad = math.rad(heading)
--     return vector3(-math.sin(rad), math.cos(rad), 0.0)
-- end

-- local function AdjustPlacementPosition(vehicle, direction, speed)
--     local coords = GetEntityCoords(vehicle)
--     local targetCoords = nil
--     local heading = GetEntityHeading(vehicle)
--     local dirVector = GetDirectionVector(heading)

--     if direction == "forward" then
--         targetCoords = coords + (dirVector * speed)
--     elseif direction == "backward" then
--         targetCoords = coords - (dirVector * speed)
--     elseif direction == "left" then
--         local leftVector = vector3(-dirVector.y, dirVector.x, 0.0)
--         targetCoords = coords + (leftVector * speed)
--     elseif direction == "right" then
--         local leftVector = vector3(-dirVector.y, dirVector.x, 0.0)
--         targetCoords = coords - (leftVector * speed)
--     end

--     if targetCoords and #(GetEntityCoords(cache.ped or PlayerPedId()) - targetCoords) <= 15.0 then
--         SetEntityCoordsNoOffset(vehicle, targetCoords.x, targetCoords.y, targetCoords.z, false, false, false)
--     end
-- end

-- function CleanDealershipDisplayPoints(dealershipId)
--     if activePoints[dealershipId] then
--         for _, pt in ipairs(activePoints[dealershipId]) do
--             if pt and pt.remove then pt:remove() end
--         end
--     end
--     activePoints[dealershipId] = {}

--     if spawnedDisplayVehicles[dealershipId] then
--         for _, vehData in ipairs(spawnedDisplayVehicles[dealershipId]) do
--             if DoesEntityExist(vehData.entity) then DeleteEntity(vehData.entity) end
--         end
--     end
--     spawnedDisplayVehicles[dealershipId] = {}
-- end

-- function LoadDealershipDisplayVehicles(dealershipId)
--     CleanDealershipDisplayPoints(dealershipId)
    
--     local serverData = lib.callback.await("jg-dealerships:server:get-display-vehicles", false, dealershipId)
--     if not serverData or not serverData.vehicles then return end

--     local trackingList = {}
--     spawnedDisplayVehicles[dealershipId] = {}

--     for _, vehData in ipairs(serverData.vehicles) do
--         if vehData.vehicle and vehData.vehicle ~= "" then
--             local coordsData = type(vehData.coords) == "string" and json.decode(vehData.coords) or vehData.coords

--             if coordsData and coordsData.x then
--                 local hash = ConvertModelToHash(vehData.vehicle)
--                 if IsModelValid(hash) then
--                     lib.requestModel(hash, 30000)
--                     local vehicle = CreateVehicle(hash, coordsData.x, coordsData.y, coordsData.z, coordsData.w or 0.0, false, false)
                    
--                     SetEntityHeading(vehicle, coordsData.w or 0.0)
--                     FreezeEntityPosition(vehicle, true)
--                     SetEntityCollision(vehicle, true, true)
--                     SetVehicleDoorsLocked(vehicle, 2)
--                     if vehData.color then SetVehicleColours(vehicle, tonumber(vehData.color) or 0, tonumber(vehData.color) or 0) end
--                     SetVehicleNumberPlateText(vehicle, "DISPLAY")
--                     SetModelAsNoLongerNeeded(hash)

--                     Entity(vehicle).state:set("isDisplayVehicle", true, true)
                    
--                     table.insert(trackingList, {
--                         entity = vehicle,
--                         spin = coordsData.spin or "none"
--                     })
--                 end
--             end
--         end
--     end
--     spawnedDisplayVehicles[dealershipId] = trackingList
-- end

-- -- TWO-PHASE PLACEMENT HANDLER
-- local function StartTwoPhasePlacement(dealershipId, slotId, spawnCode, color)
--     local playerPed = cache.ped or PlayerPedId()
--     color = tonumber(color) or 0

--     Framework.Client.HideTextUI()
--     SetNuiFocus(false, false) 

--     SendNUIMessage({
--         type = "displayVehicleHud",
--         vehiclePlaced = true,
--         locale = Locale,
--         config = Config
--     })

--     isPlacingVehicle = true
--     lib.requestModel(spawnCode, 20000)

--     local playerCoords = GetEntityCoords(playerPed)
--     local playerHeading = GetEntityHeading(playerPed)
--     local ghostVehicle = CreateVehicle(spawnCode, playerCoords.x, playerCoords.y, playerCoords.z + 0.5, playerHeading, false, false)
    
--     SetEntityAlpha(ghostVehicle, 160, false)
--     SetEntityCollision(ghostVehicle, false, false)
--     SetVehicleColours(ghostVehicle, color, color)
--     FreezeEntityPosition(ghostVehicle, true)
--     SetVehicleOnGroundProperly(ghostVehicle)

--     local placementPhase = 1 
--     local spinDir = "none" 

--     while isPlacingVehicle do
--         Wait(0)

--         SetEntityDrawOutlineColor(106, 226, 119, 255)
--         SetEntityDrawOutlineShader(1)
--         SetEntityDrawOutline(ghostVehicle, true)

--         -- PHASE 1: FREE ROAM (Vehicle Follows You)
--         if placementPhase == 1 then
--             local offsetCoords = GetOffsetFromEntityInWorldCoords(playerPed, 0.0, 4.0, 0.0)
--             local currentHeading = GetEntityHeading(playerPed)
            
--             SetEntityCoordsNoOffset(ghostVehicle, offsetCoords.x, offsetCoords.y, offsetCoords.z, false, false, false)
--             SetEntityHeading(ghostVehicle, currentHeading)
--             SetVehicleOnGroundProperly(ghostVehicle)

--             if IsControlJustPressed(0, 201) then -- ENTER
--                 placementPhase = 2
--                 FreezeEntityPosition(playerPed, true) 
--                 Wait(300) 
--             end

--             if IsControlJustPressed(0, 73) then -- X
--                 DeleteEntity(ghostVehicle)
--                 isPlacingVehicle = false
--                 SendNUIMessage({ type = "hide" })
--                 TriggerEvent("jg-dealerships:client:open-management", dealershipId)
--                 return
--             end

--         -- PHASE 2: FINE TUNING
--         elseif placementPhase == 2 then
--             for _, control in ipairs(placementControls) do
--                 DisableControlAction(0, control, true)
--             end

--             local ghostHeading = GetEntityHeading(ghostVehicle)

--             -- Apply continuous preview rotation
--             if spinDir == "left" then
--                 SetEntityHeading(ghostVehicle, ghostHeading + 0.8)
--             elseif spinDir == "right" then
--                 SetEntityHeading(ghostVehicle, ghostHeading - 0.8)
--             end

--             -- Detect continuous rotation triggers: [Q] (44) and [E] (51)
--             if IsDisabledControlPressed(0, 44) then -- Q
--                 spinDir = "left"
--             elseif IsDisabledControlPressed(0, 51) then -- E
--                 spinDir = "right"
--             end

--             -- Detect manual rotation nudges: [A] (34) and [D] (35)
--             if IsDisabledControlPressed(0, 34) then -- A
--                 spinDir = "none" -- Stops spinning so you can manually adjust
--                 SetEntityHeading(ghostVehicle, ghostHeading + 1.5)
--             elseif IsDisabledControlPressed(0, 35) then -- D
--                 spinDir = "none" -- Stops spinning so you can manually adjust
--                 SetEntityHeading(ghostVehicle, ghostHeading - 1.5)
--             end

--             -- Precision positioning overrides
--             if IsDisabledControlPressed(0, 27) then -- Arrow Up
--                 AdjustPlacementPosition(ghostVehicle, "forward", 0.015)
--             elseif IsDisabledControlPressed(0, 173) then -- Arrow Down
--                 AdjustPlacementPosition(ghostVehicle, "backward", 0.015)
--             elseif IsDisabledControlPressed(0, 174) then -- Arrow Left
--                 AdjustPlacementPosition(ghostVehicle, "left", 0.015)
--             elseif IsDisabledControlPressed(0, 175) then -- Arrow Right
--                 AdjustPlacementPosition(ghostVehicle, "right", 0.015)
--             end

--             if IsDisabledControlJustPressed(0, 73) then -- X
--                 DeleteEntity(ghostVehicle)
--                 isPlacingVehicle = false
--                 FreezeEntityPosition(playerPed, false)
--                 SendNUIMessage({ type = "hide" })
--                 TriggerEvent("jg-dealerships:client:open-management", dealershipId)
--                 return
--             end

--             if IsDisabledControlJustPressed(0, 201) then -- ENTER
--                 local finalCoords = GetEntityCoords(ghostVehicle)
--                 local finalHeading = GetEntityHeading(ghostVehicle)
                
--                 local coordsTable = {
--                     x = finalCoords.x,
--                     y = finalCoords.y,
--                     z = finalCoords.z,
--                     w = finalHeading,
--                     spin = spinDir -- Saves your custom rotation choice permanently
--                 }

--                 DeleteEntity(ghostVehicle)
--                 isPlacingVehicle = false
--                 FreezeEntityPosition(playerPed, false)
--                 SendNUIMessage({ type = "hide" })

--                 lib.callback.await("jg-dealerships:server:create-display-vehicle", false, dealershipId, slotId, spawnCode, color, coordsTable)
--                 TriggerEvent("jg-dealerships:client:open-management", dealershipId)
--                 return
--             end
            
--             local currentCoords = GetEntityCoords(ghostVehicle)
--             SetEntityCoordsNoOffset(ghostVehicle, currentCoords.x, currentCoords.y, currentCoords.z, false, false, false)
--         end
--     end
-- end

-- RegisterNUICallback("create-display-vehicle", function(data, cb)
--     StartTwoPhasePlacement(data.dealershipId, data.id, data.spawnCode, data.color)
--     cb(true)
-- end)

-- RegisterNUICallback("edit-display-vehicle", function(data, cb)
--     lib.callback.await("jg-dealerships:server:edit-display-vehicle", false, data.dealershipId, data.id, data.spawnCode, data.color)
--     cb(true)
-- end)

-- RegisterNUICallback("delete-display-vehicle", function(data, cb)
--     lib.callback.await("jg-dealerships:server:delete-display-vehicle", false, data.dealershipId, data.id)
--     cb(true)
-- end)

-- -- The RESTORE SHOWROOM callback execution
-- RegisterNUICallback("reset-display-vehicles", function(data, cb)
--     lib.callback.await("jg-dealerships:server:reset-display-vehicles", false, data.dealershipId)
--     cb(true)
-- end)

-- -- BULLETPROOF INSTANT UPDATE RECEIVER
-- RegisterNetEvent("jg-dealerships:client:spawn-display-vehicles")
-- AddEventHandler("jg-dealerships:client:spawn-display-vehicles", function(dealershipId)
--     if dealershipId then
--         LoadDealershipDisplayVehicles(dealershipId)
--     end
-- end)

-- -- SMOOTH POST-PLACEMENT AMBIENT FLOOR ROTATION ENGINE
-- CreateThread(function()
--     while true do
--         local sleep = 1000
--         local holdsEntities = false
        
--         for _, vehicles in pairs(spawnedDisplayVehicles) do
--             if #vehicles > 0 then holdsEntities = true break end
--         end

--         if holdsEntities then
--             sleep = 5 
--             for _, vehicles in pairs(spawnedDisplayVehicles) do
--                 for _, vehicleData in ipairs(vehicles) do
--                     if DoesEntityExist(vehicleData.entity) then
--                         local heading = GetEntityHeading(vehicleData.entity)
--                         if vehicleData.spin == "left" then
--                             SetEntityHeading(vehicleData.entity, heading + 0.15)
--                         elseif vehicleData.spin == "right" then
--                             SetEntityHeading(vehicleData.entity, heading - 0.15)
--                         end
--                     end
--                 end
--             end
--         end
--         Wait(sleep)
--     end
-- end)

-- CreateThread(function()
--     while true do
--         local sleep = 3000
--         for id, _ in pairs(Config.DealershipLocations) do
--             if not spawnedDisplayVehicles[id] or #spawnedDisplayVehicles[id] == 0 then
--                 LoadDealershipDisplayVehicles(id)
--             end
--         end
--         Wait(sleep)
--     end
-- end)

-- AddEventHandler("onResourceStop", function(resourceName)
--     if GetCurrentResourceName() == resourceName then
--         for id, _ in pairs(Config.DealershipLocations) do
--             CleanDealershipDisplayPoints(id)
--         end
--     end
-- end)

local activePoints = {}
local spawnedDisplayVehicles = {}
local isPlacingVehicle = false

-- Full keyboard block list to freeze character during fine-tuning phase
local placementControls = {30, 31, 32, 33, 34, 35, 38, 44, 51, 73, 201, 27, 173, 174, 175}

local function GetDirectionVector(heading)
    local rad = math.rad(heading)
    return vector3(-math.sin(rad), math.cos(rad), 0.0)
end

local function AdjustPlacementPosition(vehicle, direction, speed)
    local coords = GetEntityCoords(vehicle)
    local targetCoords = nil
    local heading = GetEntityHeading(vehicle)
    local dirVector = GetDirectionVector(heading)

    if direction == "forward" then
        targetCoords = coords + (dirVector * speed)
    elseif direction == "backward" then
        targetCoords = coords - (dirVector * speed)
    elseif direction == "left" then
        local leftVector = vector3(-dirVector.y, dirVector.x, 0.0)
        targetCoords = coords + (leftVector * speed)
    elseif direction == "right" then
        local leftVector = vector3(-dirVector.y, dirVector.x, 0.0)
        targetCoords = coords - (leftVector * speed)
    end

    if targetCoords and #(GetEntityCoords(cache.ped or PlayerPedId()) - targetCoords) <= 15.0 then
        SetEntityCoordsNoOffset(vehicle, targetCoords.x, targetCoords.y, targetCoords.z, false, false, false)
    end
end

function CleanDealershipDisplayPoints(dealershipId)
    if activePoints[dealershipId] then
        for _, pt in ipairs(activePoints[dealershipId]) do
            if pt and pt.remove then pt:remove() end
        end
    end
    activePoints[dealershipId] = {}

    if spawnedDisplayVehicles[dealershipId] then
        for _, vehData in ipairs(spawnedDisplayVehicles[dealershipId]) do
            if DoesEntityExist(vehData.entity) then DeleteEntity(vehData.entity) end
        end
    end
    spawnedDisplayVehicles[dealershipId] = {}
end

function LoadDealershipDisplayVehicles(dealershipId)
    CleanDealershipDisplayPoints(dealershipId)
    
    local serverData = lib.callback.await("jg-dealerships:server:get-display-vehicles", false, dealershipId)
    if not serverData or not serverData.vehicles then return end

    local trackingList = {}
    spawnedDisplayVehicles[dealershipId] = {}

    for _, vehData in ipairs(serverData.vehicles) do
        if vehData.vehicle and vehData.vehicle ~= "" then
            local coordsData = type(vehData.coords) == "string" and json.decode(vehData.coords) or vehData.coords

            if coordsData and coordsData.x then
                local hash = ConvertModelToHash(vehData.vehicle)
                if IsModelValid(hash) then
                    lib.requestModel(hash, 30000)
                    local vehicle = CreateVehicle(hash, coordsData.x, coordsData.y, coordsData.z, coordsData.w or 0.0, false, false)
                    
                    SetEntityHeading(vehicle, coordsData.w or 0.0)
                    FreezeEntityPosition(vehicle, true)
                    SetEntityCollision(vehicle, true, true)
                    SetVehicleDoorsLocked(vehicle, 2)
                    if vehData.color then SetVehicleColours(vehicle, tonumber(vehData.color) or 0, tonumber(vehData.color) or 0) end
                    SetVehicleNumberPlateText(vehicle, "DISPLAY")
                    SetModelAsNoLongerNeeded(hash)

                    Entity(vehicle).state:set("isDisplayVehicle", true, true)
                    
                    table.insert(trackingList, {
                        entity = vehicle
                    })
                end
            end
        end
    end
    spawnedDisplayVehicles[dealershipId] = trackingList
end

-- TWO-PHASE PLACEMENT HANDLER (MANUAL ROTATION AND POSITIONING)
local function StartTwoPhasePlacement(dealershipId, slotId, spawnCode, color)
    local playerPed = cache.ped or PlayerPedId()
    color = tonumber(color) or 0

    Framework.Client.HideTextUI()
    SetNuiFocus(false, false) 

    SendNUIMessage({
        type = "displayVehicleHud",
        vehiclePlaced = true,
        locale = Locale,
        config = Config
    })

    isPlacingVehicle = true
    lib.requestModel(spawnCode, 20000)

    local playerCoords = GetEntityCoords(playerPed)
    local playerHeading = GetEntityHeading(playerPed)
    local ghostVehicle = CreateVehicle(spawnCode, playerCoords.x, playerCoords.y, playerCoords.z + 0.5, playerHeading, false, false)
    
    SetEntityAlpha(ghostVehicle, 160, false)
    SetEntityCollision(ghostVehicle, false, false)
    SetVehicleColours(ghostVehicle, color, color)
    FreezeEntityPosition(ghostVehicle, true)
    SetVehicleOnGroundProperly(ghostVehicle)

    local placementPhase = 1 

    Framework.Client.Notify("Phase 1: Walk around to find a spot. Press [ENTER] to anchor, [X] to cancel.", "info")

    while isPlacingVehicle do
        Wait(0)

        SetEntityDrawOutlineColor(106, 226, 119, 255)
        SetEntityDrawOutlineShader(1)
        SetEntityDrawOutline(ghostVehicle, true)

        -- PHASE 1: FREE ROAM (Vehicle Follows You)
        if placementPhase == 1 then
            local offsetCoords = GetOffsetFromEntityInWorldCoords(playerPed, 0.0, 4.0, 0.0)
            local currentHeading = GetEntityHeading(playerPed)
            
            SetEntityCoordsNoOffset(ghostVehicle, offsetCoords.x, offsetCoords.y, offsetCoords.z, false, false, false)
            SetEntityHeading(ghostVehicle, currentHeading)
            SetVehicleOnGroundProperly(ghostVehicle)

            if IsControlJustPressed(0, 201) then -- ENTER
                placementPhase = 2
                FreezeEntityPosition(playerPed, true) 
                Framework.Client.Notify("Phase 2: Fine-Tuning! W/A/S/D to move, Q/E to rotate. [ENTER] to save, [X] to cancel.", "success")
                Wait(300) 
            end

            if IsControlJustPressed(0, 73) then -- X
                DeleteEntity(ghostVehicle)
                isPlacingVehicle = false
                SendNUIMessage({ type = "hide" })
                TriggerEvent("jg-dealerships:client:open-management", dealershipId)
                return
            end

        -- PHASE 2: FINE TUNING (Manual Nudges and Rotations)
        elseif placementPhase == 2 then
            for _, control in ipairs(placementControls) do
                DisableControlAction(0, control, true)
            end

            local ghostHeading = GetEntityHeading(ghostVehicle)

            -- Manual Rotation Nudges: [Q] (44) and [E] (38/51)
            if IsDisabledControlPressed(0, 44) then -- Q (Rotate Left)
                SetEntityHeading(ghostVehicle, ghostHeading + 1.0)
            elseif IsDisabledControlPressed(0, 51) or IsDisabledControlPressed(0, 38) then -- E (Rotate Right)
                SetEntityHeading(ghostVehicle, ghostHeading - 1.0)
            end

            -- Manual Positioning: W/A/S/D or Arrow Keys
            if IsDisabledControlPressed(0, 27) or IsDisabledControlPressed(0, 32) then -- Arrow Up / W
                AdjustPlacementPosition(ghostVehicle, "forward", 0.015)
            elseif IsDisabledControlPressed(0, 173) or IsDisabledControlPressed(0, 33) then -- Arrow Down / S
                AdjustPlacementPosition(ghostVehicle, "backward", 0.015)
            elseif IsDisabledControlPressed(0, 174) or IsDisabledControlPressed(0, 34) then -- Arrow Left / A
                AdjustPlacementPosition(ghostVehicle, "left", 0.015)
            elseif IsDisabledControlPressed(0, 175) or IsDisabledControlPressed(0, 35) then -- Arrow Right / D
                AdjustPlacementPosition(ghostVehicle, "right", 0.015)
            end

            if IsDisabledControlJustPressed(0, 73) then -- X
                DeleteEntity(ghostVehicle)
                isPlacingVehicle = false
                FreezeEntityPosition(playerPed, false)
                SendNUIMessage({ type = "hide" })
                TriggerEvent("jg-dealerships:client:open-management", dealershipId)
                return
            end

            if IsDisabledControlJustPressed(0, 201) then -- ENTER
                local finalCoords = GetEntityCoords(ghostVehicle)
                local finalHeading = GetEntityHeading(ghostVehicle)
                
                local coordsTable = {
                    x = finalCoords.x,
                    y = finalCoords.y,
                    z = finalCoords.z,
                    w = finalHeading
                }

                DeleteEntity(ghostVehicle)
                isPlacingVehicle = false
                FreezeEntityPosition(playerPed, false)
                SendNUIMessage({ type = "hide" })

                lib.callback.await("jg-dealerships:server:create-display-vehicle", false, dealershipId, slotId, spawnCode, color, coordsTable)
                TriggerEvent("jg-dealerships:client:open-management", dealershipId)
                return
            end
            
            local currentCoords = GetEntityCoords(ghostVehicle)
            SetEntityCoordsNoOffset(ghostVehicle, currentCoords.x, currentCoords.y, currentCoords.z, false, false, false)
        end
    end
end

RegisterNUICallback("create-display-vehicle", function(data, cb)
    StartTwoPhasePlacement(data.dealershipId, data.id, data.spawnCode, data.color)
    cb(true)
end)

RegisterNUICallback("edit-display-vehicle", function(data, cb)
    lib.callback.await("jg-dealerships:server:edit-display-vehicle", false, data.dealershipId, data.id, data.spawnCode, data.color)
    cb(true)
end)

RegisterNUICallback("delete-display-vehicle", function(data, cb)
    lib.callback.await("jg-dealerships:server:delete-display-vehicle", false, data.dealershipId, data.id)
    cb(true)
end)

RegisterNUICallback("reset-display-vehicles", function(data, cb)
    lib.callback.await("jg-dealerships:server:reset-display-vehicles", false, data.dealershipId)
    cb(true)
end)

RegisterNetEvent("jg-dealerships:client:spawn-display-vehicles")
AddEventHandler("jg-dealerships:client:spawn-display-vehicles", function(dealershipId)
    if dealershipId then
        LoadDealershipDisplayVehicles(dealershipId)
    end
end)

CreateThread(function()
    while true do
        local sleep = 3000
        for id, _ in pairs(Config.DealershipLocations) do
            if not spawnedDisplayVehicles[id] or #spawnedDisplayVehicles[id] == 0 then
                LoadDealershipDisplayVehicles(id)
            end
        end
        Wait(sleep)
    end
end)

AddEventHandler("onResourceStop", function(resourceName)
    if GetCurrentResourceName() == resourceName then
        for id, _ in pairs(Config.DealershipLocations) do
            CleanDealershipDisplayPoints(id)
        end
    end
end)