-- local showroomCamera = nil
-- local showroomVehicle = nil
-- local showroomHeading = 120.0
-- local camPositionIndex = 1
-- local isSwitchingVehicle = false

-- Globals.CurrentDealership = nil

-- function IsShowroomAccessAllowed(dealershipId)
--     local config = Config.DealershipLocations[dealershipId]
--     if not config then return false end

--     -- If no whitelists exist, anyone can access
--     if not next(config.showroomJobWhitelist or {}) and not next(config.showroomGangWhitelist or {}) then
--         return true
--     end

--     -- Check Job Whitelist
--     if config.showroomJobWhitelist and next(config.showroomJobWhitelist) then
--         local playerJob = Framework.Client.GetPlayerJob()
--         if not playerJob then
--             DebugPrint("Framework.Client.GetPlayerJob() returned nil", "warning")
--             return false
--         end

--         local allowedGrades = config.showroomJobWhitelist[playerJob.name]
--         if allowedGrades and IsItemInList(allowedGrades, tonumber(playerJob.grade) or 0) then
--             return true
--         end
--     end

--     -- Check Gang Whitelist (QBCore/Qbox only)
--     if (Config.Framework == "QBCore" or Config.Framework == "Qbox") and config.showroomGangWhitelist and next(config.showroomGangWhitelist) then
--         local playerGang = Framework.Client.GetPlayerGang()
--         if not playerGang then
--             DebugPrint("Framework.Client.GetPlayerGang() returned nil", "warning")
--             return false
--         end

--         local allowedGrades = config.showroomGangWhitelist[playerGang.name]
--         if allowedGrades and IsItemInList(allowedGrades, tonumber(playerGang.grade) or 0) then
--             return true
--         end
--     end

--     return false
-- end

-- function GetPlayerBalances(dealershipId)
--     local balances = {}
--     local config = Config.DealershipLocations[dealershipId]

--     if config.societyPurchaseJobWhitelist then
--         local playerJob = Framework.Client.GetPlayerJob()
--         if playerJob then
--             local allowedGrades = config.societyPurchaseJobWhitelist[playerJob.name]
--             if allowedGrades and IsItemInList(allowedGrades, tonumber(playerJob.grade) or 0) then
--                 local balance = Framework.Client.GetSocietyBalance(playerJob.name, "job")
--                 balances[#balances + 1] = {
--                     name = playerJob.name,
--                     label = playerJob.label,
--                     balance = balance,
--                     type = "job"
--                 }
--             end
--         end
--     end

--     if (Config.Framework == "QBCore" or Config.Framework == "Qbox") and config.societyPurchaseGangWhitelist then
--         local playerGang = Framework.Client.GetPlayerGang()
--         if playerGang then
--             local allowedGrades = config.societyPurchaseGangWhitelist[playerGang.name]
--             if allowedGrades and IsItemInList(allowedGrades, tonumber(playerGang.grade) or 0) then
--                 local balance = Framework.Client.GetSocietyBalance(playerGang.name, "gang")
--                 balances[#balances + 1] = {
--                     name = playerGang.name,
--                     label = playerGang.label,
--                     balance = balance,
--                     type = "gang"
--                 }
--             end
--         end
--     end

--     return balances
-- end

-- RegisterNetEvent("jg-dealerships:client:open-showroom", function(dealershipId, defaultVehicle, defaultColor)
--     if Globals.CurrentDealership or Globals.IsTestDriving then return end

--     Globals.CurrentDealership = dealershipId
--     local ped = cache.ped

--     if IsPedInAnyVehicle(ped, true) then
--         Globals.CurrentDealership = nil
--         return Framework.Client.Notify(Locale.errorExitVehicle, "error")
--     end

--     if not IsShowroomAccessAllowed(dealershipId) then
--         DebugPrint("jg-dealerships:client:showroom-pre-check failed", "debug")
--         Globals.CurrentDealership = nil
--         return
--     end

--     local config = Config.DealershipLocations[dealershipId]
--     if not config.camera or not config.camera.coords or config.camera.coords == "" then
--         Globals.CurrentDealership = nil
--         DebugPrint("You are missing camera coords in your config.lua for " .. dealershipId, "warning")
--         Framework.Client.Notify("You are missing camera coords in your config.lua for " .. dealershipId, "error")
--         return
--     end

--     CreateThread(function()
--         DoScreenFadeOut(500)
--         Wait(500)

--         local serverData = lib.callback.await("jg-dealerships:server:enter-showroom", false, dealershipId, config)
--         if not serverData then
--             Globals.CurrentDealership = nil
--             return DoScreenFadeIn(0)
--         end

--         local formattedVehicles = {}
--         for _, veh in ipairs(serverData.vehicles) do
--             formattedVehicles[#formattedVehicles + 1] = {
--                 id = veh.id,
--                 spawn_code = veh.spawn_code,
--                 brand = veh.brand,
--                 model = veh.model,
--                 price = veh.price,
--                 stock = veh.stock,
--                 category = veh.category
--             }
--         end

--         local camCoords = config.camera.coords
--         local camPositions = config.camera.positions

--         lib.waitFor(function()
--             if not IsEntityWaitingForWorldCollision(ped) and HasCollisionLoadedAroundEntity(ped) then
--                 return true
--             end
--         end, nil, 5000)

--         local rad = math.rad(camCoords.w)
--         local sin = camPositions[1] * math.sin(rad)
--         local cos = camPositions[1] * math.cos(rad)
--         showroomHeading = camCoords.w + 215.0

--         showroomCamera = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", camCoords.x + sin, camCoords.y - cos, camCoords.z + 1.5, 0.0, 0.0, camCoords.w, 60.0, false, 0)
--         SetCamActive(showroomCamera, true)
--         RenderScriptCams(true, true, 1, true, true)

--         SetEntityVisible(ped, false, false)
--         Framework.Client.ToggleHud(false)
--         DoScreenFadeIn(500)
--         SetNuiFocus(true, true)

--         SendNUIMessage({
--             type = "showShowroom",
--             shopType = config.type,
--             vehicles = formattedVehicles,
--             defaultVehicle = defaultVehicle,
--             defaultColor = defaultColor,
--             categories = config.categories,
--             dealershipId = dealershipId,
--             playerBalances = GetPlayerBalances(dealershipId),
--             societies = GetPlayerBalances(dealershipId),
--             jgGaragesRunning = (GetResourceState("jg-advancedgarages") == "started"),
--             enablePurchase = not config.disableShowroomPurchase,
--             enableTestDrive = config.enableTestDrive,
--             financeEnabled = config.enableFinance and serverData.financeAllowed,
--             locale = Locale,
--             config = Config
--         })
--     end)
-- end)

-- function ExitShowroom()
--     if not Globals.CurrentDealership then return end

--     local success = lib.callback.await("jg-dealerships:server:exit-showroom", false, Globals.CurrentDealership)
--     if not success then
--         DebugPrint("jg-dealerships:server:exit-showroom failed", "warning")
--         return
--     end

--     SetEntityVisible(cache.ped, true, false)
--     Framework.Client.ToggleHud(true)
--     SetNuiFocus(false, false)

--     if showroomVehicle then
--         DeleteEntity(showroomVehicle)
--         showroomVehicle = nil
--     end

--     if showroomCamera and IsCamActive(showroomCamera) then
--         RenderScriptCams(false, false, 0, true, false)
--         DestroyCam(showroomCamera, true)
--     end

--     showroomCamera = nil
--     showroomHeading = 120.0
--     camPositionIndex = 1
--     Globals.CurrentDealership = nil
-- end

-- RegisterNUICallback("change-color", function(data, cb)
--     if showroomVehicle then
--         SetVehicleColour(showroomVehicle, data.color)
--     end
--     cb(true)
-- end)

-- RegisterNUICallback("switch-vehicle", function(data, cb)
--     if not Globals.CurrentDealership or not showroomCamera then return cb({error = true}) end
--     if isSwitchingVehicle then return cb({error = true}) end

--     local config = Config.DealershipLocations[Globals.CurrentDealership]

--     CreateThread(function()
--         isSwitchingVehicle = true
--         local camCoords = config.camera.coords
--         local spawnCode = data.spawnCode

--         if showroomVehicle then DeleteEntity(showroomVehicle) end

--         local hash = ConvertModelToHash(spawnCode)
--         if not IsModelValid(hash) then
--             DebugPrint("Vehicle does not exist. Please contact an admin! Vehicle: " .. tostring(spawnCode), "warning")
--             Framework.Client.Notify("Vehicle does not exist. Please contact an admin!", "error")
--             isSwitchingVehicle = false
--             return cb({error = true})
--         end

--         lib.requestModel(hash, 60000)
--         showroomVehicle = CreateVehicle(hash, camCoords.x, camCoords.y, camCoords.z, showroomHeading, false, false)
--         SetModelAsNoLongerNeeded(hash)
        
--         SetEntityHeading(showroomVehicle, showroomHeading)
--         FreezeEntityPosition(showroomVehicle, true)
--         SetEntityCollision(showroomVehicle, false, true)
        
--         if data.color then SetVehicleColour(showroomVehicle, data.color) end

--         local vehCoords = GetEntityCoords(showroomVehicle)
--         PointCamAtCoord(showroomCamera, vehCoords.x, vehCoords.y, vehCoords.z)
--         RenderScriptCams(true, true, 1, true, true)

--         isSwitchingVehicle = false
--         cb(true)
--     end)
-- end)

-- RegisterNUICallback("exit-showroom", function(data, cb)
--     DoScreenFadeOut(500)
--     Wait(500)
--     ExitShowroom()
--     DoScreenFadeIn(500)
--     cb(true)
-- end)

-- RegisterNUICallback("veh-left", function(data, cb)
--     if not showroomVehicle then return cb(false) end
--     showroomHeading = GetEntityHeading(showroomVehicle) - 10.0
--     SetEntityHeading(showroomVehicle, showroomHeading)
--     cb(true)
-- end)

-- RegisterNUICallback("veh-right", function(data, cb)
--     if not showroomVehicle then return cb(false) end
--     showroomHeading = GetEntityHeading(showroomVehicle) + 10.0
--     SetEntityHeading(showroomVehicle, showroomHeading)
--     cb(true)
-- end)

-- RegisterNUICallback("change-cam-view", function(data, cb)
--     if not Globals.CurrentDealership or not showroomCamera then return cb(false) end

--     local config = Config.DealershipLocations[Globals.CurrentDealership]
--     local camPositions = config.camera.positions
--     local camCoords = config.camera.coords

--     camPositionIndex = camPositionIndex + 1
--     if camPositionIndex > #camPositions then camPositionIndex = 1 end

--     local pos = camPositions[camPositionIndex]
--     local rad = math.rad(camCoords.w)
--     local sin = pos * math.sin(rad)
--     local cos = pos * math.cos(rad)

--     SetCamCoord(showroomCamera, camCoords.x + sin, camCoords.y - cos, camCoords.z + 1.0 + (pos / 10))
--     cb(true)
-- end)

-- RegisterNUICallback("get-model-stats", function(data, cb)
--     if Config.HideVehicleStats then return cb({}) end
--     local stats = Framework.Client.GetVehicleStats(data.vehicle)
--     cb(stats)
-- end)

-- AddEventHandler("onResourceStop", function(resourceName)
--     if GetCurrentResourceName() == resourceName then
--         if Globals.CurrentDealership then
--             local config = Config.DealershipLocations[Globals.CurrentDealership]
--             TriggerServerEvent("jg-dealerships:server:exit-bucket")
--             SetEntityVisible(cache.ped, true, false)
            
--             if config and config.openShowroom and config.openShowroom.coords then
--                 local coords = config.openShowroom.coords
--                 SetEntityCoords(cache.ped, coords.x, coords.y, coords.z, false, false, false, false)
--             end
            
--             FreezeEntityPosition(cache.ped, false)
--             if showroomVehicle then DeleteEntity(showroomVehicle) end
--             Framework.Client.ToggleHud(true)
--             SetNuiFocus(false, false)
--         end
--     end
-- end)

local showroomCamera = nil
local showroomVehicle = nil
local showroomHeading = 120.0
local camPositionIndex = 1
local isSwitchingVehicle = false

Globals.CurrentDealership = nil

-- NEW HELPER FUNCTION TO FIX COLOR MISMATCHES
local function ApplyVehicleColor(vehicle, colorData)
    if not vehicle or not DoesEntityExist(vehicle) or not colorData then return end

    if type(colorData) == "table" then
        -- Handle RGB Colors
        local r = math.floor(colorData.r or colorData[1] or 255)
        local g = math.floor(colorData.g or colorData[2] or 255)
        local b = math.floor(colorData.b or colorData[3] or 255)
        SetVehicleCustomPrimaryColour(vehicle, r, g, b)
        SetVehicleCustomSecondaryColour(vehicle, r, g, b)
    elseif type(colorData) == "number" or tonumber(colorData) then
        -- Handle standard GTA Color IDs
        local colorId = tonumber(colorData)
        SetVehicleColours(vehicle, colorId, colorId)
    elseif type(colorData) == "string" and string.match(colorData, "^#") then
        -- Handle Hex Colors
        local hex = colorData:gsub("#","")
        local r = tonumber("0x"..hex:sub(1,2)) or 255
        local g = tonumber("0x"..hex:sub(3,4)) or 255
        local b = tonumber("0x"..hex:sub(5,6)) or 255
        SetVehicleCustomPrimaryColour(vehicle, r, g, b)
        SetVehicleCustomSecondaryColour(vehicle, r, g, b)
    end
end

function IsShowroomAccessAllowed(dealershipId)
    local config = Config.DealershipLocations[dealershipId]
    if not config then return false end

    if not next(config.showroomJobWhitelist or {}) and not next(config.showroomGangWhitelist or {}) then
        return true
    end

    if config.showroomJobWhitelist and next(config.showroomJobWhitelist) then
        local playerJob = Framework.Client.GetPlayerJob()
        if not playerJob then
            DebugPrint("Framework.Client.GetPlayerJob() returned nil", "warning")
            return false
        end

        local allowedGrades = config.showroomJobWhitelist[playerJob.name]
        if allowedGrades and IsItemInList(allowedGrades, tonumber(playerJob.grade) or 0) then
            return true
        end
    end

    if (Config.Framework == "QBCore" or Config.Framework == "Qbox") and config.showroomGangWhitelist and next(config.showroomGangWhitelist) then
        local playerGang = Framework.Client.GetPlayerGang()
        if not playerGang then
            DebugPrint("Framework.Client.GetPlayerGang() returned nil", "warning")
            return false
        end

        local allowedGrades = config.showroomGangWhitelist[playerGang.name]
        if allowedGrades and IsItemInList(allowedGrades, tonumber(playerGang.grade) or 0) then
            return true
        end
    end

    return false
end

function GetPlayerBalances(dealershipId)
    local balances = {}
    local config = Config.DealershipLocations[dealershipId]

    if config.societyPurchaseJobWhitelist then
        local playerJob = Framework.Client.GetPlayerJob()
        if playerJob then
            local allowedGrades = config.societyPurchaseJobWhitelist[playerJob.name]
            if allowedGrades and IsItemInList(allowedGrades, tonumber(playerJob.grade) or 0) then
                local balance = Framework.Client.GetSocietyBalance(playerJob.name, "job")
                balances[#balances + 1] = {
                    name = playerJob.name,
                    label = playerJob.label,
                    balance = balance,
                    type = "job"
                }
            end
        end
    end

    if (Config.Framework == "QBCore" or Config.Framework == "Qbox") and config.societyPurchaseGangWhitelist then
        local playerGang = Framework.Client.GetPlayerGang()
        if playerGang then
            local allowedGrades = config.societyPurchaseGangWhitelist[playerGang.name]
            if allowedGrades and IsItemInList(allowedGrades, tonumber(playerGang.grade) or 0) then
                local balance = Framework.Client.GetSocietyBalance(playerGang.name, "gang")
                balances[#balances + 1] = {
                    name = playerGang.name,
                    label = playerGang.label,
                    balance = balance,
                    type = "gang"
                }
            end
        end
    end

    return balances
end

RegisterNetEvent("jg-dealerships:client:open-showroom", function(dealershipId, defaultVehicle, defaultColor)
    if Globals.CurrentDealership or Globals.IsTestDriving then return end

    Globals.CurrentDealership = dealershipId
    local ped = cache.ped

    if IsPedInAnyVehicle(ped, true) then
        Globals.CurrentDealership = nil
        return Framework.Client.Notify(Locale.errorExitVehicle, "error")
    end

    if not IsShowroomAccessAllowed(dealershipId) then
        DebugPrint("jg-dealerships:client:showroom-pre-check failed", "debug")
        Globals.CurrentDealership = nil
        return
    end

    local config = Config.DealershipLocations[dealershipId]
    if not config.camera or not config.camera.coords or config.camera.coords == "" then
        Globals.CurrentDealership = nil
        DebugPrint("You are missing camera coords in your config.lua for " .. dealershipId, "warning")
        Framework.Client.Notify("You are missing camera coords in your config.lua for " .. dealershipId, "error")
        return
    end

    CreateThread(function()
        DoScreenFadeOut(500)
        Wait(500)

        local serverData = lib.callback.await("jg-dealerships:server:enter-showroom", false, dealershipId, config)
        if not serverData then
            Globals.CurrentDealership = nil
            return DoScreenFadeIn(0)
        end

        local formattedVehicles = {}
        for _, veh in ipairs(serverData.vehicles) do
            formattedVehicles[#formattedVehicles + 1] = {
                id = veh.id,
                spawn_code = veh.spawn_code,
                brand = veh.brand,
                model = veh.model,
                price = veh.price,
                stock = veh.stock,
                category = veh.category
            }
        end

        local camCoords = config.camera.coords
        local camPositions = config.camera.positions

        lib.waitFor(function()
            if not IsEntityWaitingForWorldCollision(ped) and HasCollisionLoadedAroundEntity(ped) then
                return true
            end
        end, nil, 5000)

        local rad = math.rad(camCoords.w)
        local sin = camPositions[1] * math.sin(rad)
        local cos = camPositions[1] * math.cos(rad)
        showroomHeading = camCoords.w + 215.0

        showroomCamera = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", camCoords.x + sin, camCoords.y - cos, camCoords.z + 1.5, 0.0, 0.0, camCoords.w, 60.0, false, 0)
        SetCamActive(showroomCamera, true)
        RenderScriptCams(true, true, 1, true, true)

        SetEntityVisible(ped, false, false)
        Framework.Client.ToggleHud(false)
        DoScreenFadeIn(500)
        SetNuiFocus(true, true)

        SendNUIMessage({
            type = "showShowroom",
            shopType = config.type,
            vehicles = formattedVehicles,
            defaultVehicle = defaultVehicle,
            defaultColor = defaultColor,
            categories = config.categories,
            dealershipId = dealershipId,
            playerBalances = GetPlayerBalances(dealershipId),
            societies = GetPlayerBalances(dealershipId),
            jgGaragesRunning = (GetResourceState("jg-advancedgarages") == "started"),
            enablePurchase = not config.disableShowroomPurchase,
            enableTestDrive = config.enableTestDrive,
            financeEnabled = config.enableFinance and serverData.financeAllowed,
            locale = Locale,
            config = Config
        })
    end)
end)

function ExitShowroom()
    if not Globals.CurrentDealership then return end

    local success = lib.callback.await("jg-dealerships:server:exit-showroom", false, Globals.CurrentDealership)
    if not success then
        DebugPrint("jg-dealerships:server:exit-showroom failed", "warning")
        return
    end

    SetEntityVisible(cache.ped, true, false)
    Framework.Client.ToggleHud(true)
    SetNuiFocus(false, false)

    if showroomVehicle then
        DeleteEntity(showroomVehicle)
        showroomVehicle = nil
    end

    if showroomCamera and IsCamActive(showroomCamera) then
        RenderScriptCams(false, false, 0, true, false)
        DestroyCam(showroomCamera, true)
    end

    showroomCamera = nil
    showroomHeading = 120.0
    camPositionIndex = 1
    Globals.CurrentDealership = nil
end

RegisterNUICallback("change-color", function(data, cb)
    if showroomVehicle then
        ApplyVehicleColor(showroomVehicle, data.color)
    end
    cb(true)
end)

RegisterNUICallback("switch-vehicle", function(data, cb)
    if not Globals.CurrentDealership or not showroomCamera then return cb({error = true}) end
    if isSwitchingVehicle then return cb({error = true}) end

    local config = Config.DealershipLocations[Globals.CurrentDealership]

    CreateThread(function()
        isSwitchingVehicle = true
        local camCoords = config.camera.coords
        local spawnCode = data.spawnCode

        if showroomVehicle then DeleteEntity(showroomVehicle) end

        local hash = ConvertModelToHash(spawnCode)
        if not IsModelValid(hash) then
            DebugPrint("Vehicle does not exist. Please contact an admin! Vehicle: " .. tostring(spawnCode), "warning")
            Framework.Client.Notify("Vehicle does not exist. Please contact an admin!", "error")
            isSwitchingVehicle = false
            return cb({error = true})
        end

        lib.requestModel(hash, 60000)
        showroomVehicle = CreateVehicle(hash, camCoords.x, camCoords.y, camCoords.z, showroomHeading, false, false)
        SetModelAsNoLongerNeeded(hash)
        
        SetEntityHeading(showroomVehicle, showroomHeading)
        FreezeEntityPosition(showroomVehicle, true)
        SetEntityCollision(showroomVehicle, false, true)
        
        if data.color then ApplyVehicleColor(showroomVehicle, data.color) end

        local vehCoords = GetEntityCoords(showroomVehicle)
        PointCamAtCoord(showroomCamera, vehCoords.x, vehCoords.y, vehCoords.z)
        RenderScriptCams(true, true, 1, true, true)

        isSwitchingVehicle = false
        cb(true)
    end)
end)

RegisterNUICallback("exit-showroom", function(data, cb)
    DoScreenFadeOut(500)
    Wait(500)
    ExitShowroom()
    DoScreenFadeIn(500)
    cb(true)
end)

RegisterNUICallback("veh-left", function(data, cb)
    if not showroomVehicle then return cb(false) end
    showroomHeading = GetEntityHeading(showroomVehicle) - 10.0
    SetEntityHeading(showroomVehicle, showroomHeading)
    cb(true)
end)

RegisterNUICallback("veh-right", function(data, cb)
    if not showroomVehicle then return cb(false) end
    showroomHeading = GetEntityHeading(showroomVehicle) + 10.0
    SetEntityHeading(showroomVehicle, showroomHeading)
    cb(true)
end)

RegisterNUICallback("change-cam-view", function(data, cb)
    if not Globals.CurrentDealership or not showroomCamera then return cb(false) end

    local config = Config.DealershipLocations[Globals.CurrentDealership]
    local camPositions = config.camera.positions
    local camCoords = config.camera.coords

    camPositionIndex = camPositionIndex + 1
    if camPositionIndex > #camPositions then camPositionIndex = 1 end

    local pos = camPositions[camPositionIndex]
    local rad = math.rad(camCoords.w)
    local sin = pos * math.sin(rad)
    local cos = pos * math.cos(rad)

    SetCamCoord(showroomCamera, camCoords.x + sin, camCoords.y - cos, camCoords.z + 1.0 + (pos / 10))
    cb(true)
end)

RegisterNUICallback("get-model-stats", function(data, cb)
    if Config.HideVehicleStats then return cb({}) end
    local stats = Framework.Client.GetVehicleStats(data.vehicle)
    cb(stats)
end)

AddEventHandler("onResourceStop", function(resourceName)
    if GetCurrentResourceName() == resourceName then
        if Globals.CurrentDealership then
            local config = Config.DealershipLocations[Globals.CurrentDealership]
            TriggerServerEvent("jg-dealerships:server:exit-bucket")
            SetEntityVisible(cache.ped, true, false)
            
            if config and config.openShowroom and config.openShowroom.coords then
                local coords = config.openShowroom.coords
                SetEntityCoords(cache.ped, coords.x, coords.y, coords.z, false, false, false, false)
            end
            
            FreezeEntityPosition(cache.ped, false)
            if showroomVehicle then DeleteEntity(showroomVehicle) end
            Framework.Client.ToggleHud(true)
            SetNuiFocus(false, false)
        end
    end
end)