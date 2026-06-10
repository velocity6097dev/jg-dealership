RegisterNetEvent("jg-dealerships:client:open-admin", function()
    local data = lib.callback.await("jg-dealerships:server:get-admin-data", false)
    
    SetNuiFocus(true, true)
    SendNUIMessage({
        type = "vehiclesAdmin",
        dealers = data.dealerships,
        vehicles = data.vehicles,
        nearbyPlayers = data.nearbyPlayers,
        config = Config,
        locale = Locale
    })
end)

RegisterNUICallback("open-admin", function()
    TriggerEvent("jg-dealerships:client:open-admin")
end)

RegisterNUICallback("add-vehicle", function(data, cb)
    lib.callback.await("jg-dealerships:server:add-vehicle", false, data.spawn_code, data.brand, data.model, data.category, data.price, data.dealerships)
    cb(true)
end)

RegisterNUICallback("update-vehicle", function(data, cb)
    lib.callback.await("jg-dealerships:server:update-vehicle", false, data.spawn_code, data.brand, data.model, data.category, data.price, data.dealerships, data.updateDealerPrices or false)
    cb(true)
end)

RegisterNUICallback("delete-vehicle", function(data, cb)
    lib.callback.await("jg-dealerships:server:delete-vehicle", false, data.spawn_code)
    cb(true)
end)

RegisterNUICallback("delete-dealership-data", function(data, cb)
    local success = lib.callback.await("jg-dealerships:server:delete-dealership-data", false, data.dealershipId)
    TriggerEvent("jg-dealerships:client:open-admin")
    cb(success)
end)

RegisterNUICallback("set-dealership-owner", function(data, cb)
    local success = lib.callback.await("jg-dealerships:server:set-dealership-owner", false, data.dealershipId, data.player)
    TriggerEvent("jg-dealerships:client:open-admin")
    cb(success)
end)

RegisterNUICallback("import-vehicles-data", function(data, cb)
    local success = lib.callback.await("jg-dealerships:server:import-vehicles-data", false, data.location, data.behaviour)
    TriggerEvent("jg-dealerships:client:open-admin")
    cb(success)
end)

RegisterNUICallback("verify-spawn-code", function(data, cb)
    if not data.spawnCode then return cb(false) end
    local hash = GetHashKey(data.spawnCode)
    cb({ valid = IsModelValid(hash) })
end)

RegisterNUICallback("close", function(data, cb)
    SetNuiFocus(false, false)
    cb("ok")
end)