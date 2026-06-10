RegisterNetEvent("jg-dealerships:client:show-confirm-employment", function(data)
    SetNuiFocus(true, true)
    SendNUIMessage({
        type = "showConfirmEmployment",
        data = data,
        config = Config,
        locale = Locale
    })
end)

RegisterNUICallback("accept-hire-request", function(data, cb)
    TriggerServerEvent("jg-dealerships:server:hire-employee", data)
    cb(true)
end)

RegisterNUICallback("deny-hire-request", function(data, cb)
    TriggerServerEvent("jg-dealerships:server:employee-hire-rejected", data.requesterId)
    cb(true)
end)

RegisterNUICallback("request-hire-employee", function(data, cb)
    TriggerServerEvent("jg-dealerships:server:request-hire-employee", data)
    cb(true)
end)

RegisterNUICallback("fire-employee", function(data, cb)
    TriggerServerEvent("jg-dealerships:server:fire-employee", data.identifier, data.dealershipId)
    cb(true)
end)

RegisterNUICallback("update-employee-role", function(data, cb)
    TriggerServerEvent("jg-dealerships:server:update-employee-role", data.identifier, data.dealershipId, data.newRole)
    cb(true)
end)