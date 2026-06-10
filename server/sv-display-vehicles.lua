-- Callback to pull all display vehicle entries from the database
lib.callback.register("jg-dealerships:server:get-display-vehicles", function(source, dealershipId)
    local identifier = Framework.Server.GetPlayerIdentifier(source)
    local isManager = false
    
    local data = MySQL.single.await("SELECT d.*, e.identifier, e.role FROM dealership_data d LEFT JOIN dealership_employees e ON d.name = e.dealership AND e.identifier = ? WHERE d.name = ?", {identifier, dealershipId})
    if data then
        isManager = (data.owner_id == identifier)
    end

    local vehicles = MySQL.query.await("SELECT dispveh.*, vehicle.model, vehicle.brand FROM dealership_dispveh dispveh INNER JOIN dealership_vehicles vehicle ON dispveh.vehicle = vehicle.spawn_code WHERE dealership = ?", {dealershipId})
    
    return {
        isManager = isManager,
        vehicles = vehicles or {}
    }
end)

-- Callback to process placement saves and layout updates
lib.callback.register("jg-dealerships:server:create-display-vehicle", function(source, dealershipId, slotId, spawnCode, colorId, coordsTable)
    local encodedCoords = "{}"
    if coordsTable and type(coordsTable) == "table" then
        encodedCoords = json.encode(coordsTable)
    end

    local exists = MySQL.single.await("SELECT id FROM dealership_dispveh WHERE dealership = ? AND id = ?", {dealershipId, slotId})

    if exists then
        MySQL.query.await("UPDATE dealership_dispveh SET vehicle = ?, color = ?, coords = ? WHERE dealership = ? AND id = ?", {spawnCode, tonumber(colorId) or 0, encodedCoords, dealershipId, slotId})
    else
        MySQL.query.await("INSERT INTO dealership_dispveh (dealership, id, vehicle, color, coords) VALUES (?, ?, ?, ?, ?)", {dealershipId, slotId, spawnCode, tonumber(colorId) or 0, encodedCoords})
    end

    TriggerClientEvent("jg-dealerships:client:spawn-display-vehicles", -1, dealershipId)
    return true
end)

-- Callback to handle switching vehicle models from the UI layout menu frames
lib.callback.register("jg-dealerships:server:edit-display-vehicle", function(source, dealershipId, slotId, spawnCode, colorId)
    MySQL.query.await("UPDATE dealership_dispveh SET vehicle = ?, color = ? WHERE dealership = ? AND id = ?", {spawnCode, tonumber(colorId) or 0, dealershipId, slotId})
    TriggerClientEvent("jg-dealerships:client:spawn-display-vehicles", -1, dealershipId)
    return true
end)

-- Callback to delete a display vehicle slot configuration safely
lib.callback.register("jg-dealerships:server:delete-display-vehicle", function(source, dealershipId, slotId)
    MySQL.query.await("DELETE FROM dealership_dispveh WHERE dealership = ? AND id = ?", {dealershipId, slotId})
    TriggerClientEvent("jg-dealerships:client:spawn-display-vehicles", -1, dealershipId)
    return true
end)

-- "Restore Showroom" Callback (Deletes all vehicles from a specific dealership)
lib.callback.register("jg-dealerships:server:reset-display-vehicles", function(source, dealershipId)
    MySQL.query.await("DELETE FROM dealership_dispveh WHERE dealership = ?", {dealershipId})
    TriggerClientEvent("jg-dealerships:client:spawn-display-vehicles", -1, dealershipId)
    return true
end)