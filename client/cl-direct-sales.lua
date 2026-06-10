local tabletProp = nil

-- Generates the tablet animation and spawns the prop in the player's hand
local function PlayTabletAnim()
    local ped = cache.ped or PlayerPedId()
    local animDict = "amb@code_human_in_bus_passenger_idles@female@tablet@base"
    local animName = "base"
    local propModel = `prop_cs_tablet`

    lib.requestAnimDict(animDict, 5000)
    TaskPlayAnim(ped, animDict, animName, 8.0, -8.0, -1, 49, 0, false, false, false)
    
    lib.requestModel(propModel, 5000)
    local coords = GetEntityCoords(ped)
    tabletProp = CreateObject(propModel, coords.x, coords.y, coords.z, true, true, false)
    
    -- Attach tablet to the right hand bone
    AttachEntityToEntity(tabletProp, ped, GetPedBoneIndex(ped, 28422), 0.0, -0.03, 0.0, 20.0, -90.0, 0.0, true, true, false, true, 1, true)
    
    SetModelAsNoLongerNeeded(propModel)
    RemoveAnimDict(animDict)

    -- Auto-cleanup: If the player walks away or cancels the anim, delete the tablet from their hand
    CreateThread(function()
        while tabletProp and DoesEntityExist(tabletProp) do
            Wait(1000)
            local currentPed = cache.ped or PlayerPedId()
            if not IsEntityPlayingAnim(currentPed, animDict, animName, 3) then
                DeleteEntity(tabletProp)
                tabletProp = nil
            end
        end
    end)
end

-- Safely clears the animation and deletes the prop
local function StopTabletAnim()
    local ped = cache.ped or PlayerPedId()
    ClearPedTasks(ped)
    if tabletProp and DoesEntityExist(tabletProp) then
        DeleteEntity(tabletProp)
        tabletProp = nil
    end
end

-- Event to open the Direct Sale tablet UI for the Dealership Employee
RegisterNetEvent("jg-dealerships:client:direct-sale", function()
    local dealershipId = lib.callback.await("jg-dealerships:server:employee-nearest-dealership", false)
    if dealershipId and dealershipId.error then return end

    local config = Config.DealershipLocations[dealershipId]
    if not config then return end

    local data = lib.callback.await("jg-dealerships:server:get-direct-sale-data", false, dealershipId)
    if not data then return end

    PlayTabletAnim()
    SetNuiFocus(true, true)
    
    SendNUIMessage({
        type = "showDSSellVehicle",
        vehicles = data.vehicles,
        nearbyPlayers = data.nearbyPlayers,
        categories = config.categories,
        commission = data.commission,
        enableFinance = config.enableFinance,
        config = Config,
        locale = Locale
    })
end)

-- Event to show the Direct Sale request prompt to the Customer
RegisterNetEvent("jg-dealerships:client:show-direct-sale-request", function(data)
    -- Prevent showing the prompt if the customer is currently test driving or in the showroom
    if Globals.CurrentDealership then
        TriggerServerEvent("jg-dealerships:server:notify-other-player", data.dealerPlayerId, "Customer is in the showroom! Wait for them to come back, and try again", "error")
        return
    end

    SetNuiFocus(true, true)
    
    local vehicleLabel = (data.vehicle.brand or "") .. " " .. (data.vehicle.model or "")

    SendNUIMessage({
        type = "show-direct-sale-request",
        uuid = data.uuid,
        dealerPlayerId = data.dealerPlayerId,
        dealerName = data.dealerName,
        dealershipId = data.dealershipId,
        dealershipLabel = data.dealershipLabel,
        playerBalances = GetPlayerBalances(data.dealershipId),
        vehicleLabel = vehicleLabel,
        vehicleSpawnCode = data.vehicle.spawn_code,
        vehiclePrice = data.vehicle.price,
        color = data.colour,
        financed = data.financed,
        downPayment = data.downPayment,
        noOfPayments = data.noOfPayments,
        config = Config,
        locale = Locale
    })
end)

-- NUI Callback: Triggered when the dealer sends the contract to the customer
RegisterNUICallback("send-direct-sale-request", function(data, cb)
    local dealershipId = lib.callback.await("jg-dealerships:server:employee-nearest-dealership", false)
    if dealershipId and dealershipId.error then return cb({error = true}) end

    local success = lib.callback.await("jg-dealerships:server:send-direct-sale-request", false, dealershipId, data)
    if not success then return cb({error = true}) end

    StopTabletAnim()
    cb(true)
end)

-- NUI Callback: Triggered when the customer clicks "Accept"
RegisterNUICallback("accept-direct-sale-request", function(data, cb)
    SetNuiFocus(false, false)
    local success = lib.callback.await("jg-dealerships:server:direct-sale-request-accepted", false, data)
    if not success then return cb({error = true}) end
    cb(true)
end)

-- NUI Callback: Triggered when the customer clicks "Decline" or closes the menu
RegisterNUICallback("deny-direct-sale-request", function(data, cb)
    SetNuiFocus(false, false)
    local success = lib.callback.await("jg-dealerships:server:direct-sale-request-denied", false, data)
    if not success then return cb({error = true}) end
    cb(true)
end)

-- Command to initiate a direct sale (defaults to /directsale)
RegisterCommand(Config.DirectSaleCommand or "directsale", function()
    TriggerEvent("jg-dealerships:client:direct-sale")
end, false)