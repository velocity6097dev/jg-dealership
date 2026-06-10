local PendingDirectSales = {}

-- Generates a unique tracking ID for the direct sale request
local function CreateDirectSaleRequest(dealershipId, dealerPlayerId, customerId, model, colour, price, finance, noOfPayments, downPayment)
    local uuid = GenerateUuid()
    local attempts = 0
    
    while PendingDirectSales[uuid] and attempts < 10 do
        attempts = attempts + 1
        uuid = GenerateUuid()
    end

    PendingDirectSales[uuid] = {
        dealershipId = dealershipId,
        dealerPlayerId = dealerPlayerId,
        playerId = customerId,
        model = model,
        colour = colour,
        price = price,
        finance = finance,
        noOfPayments = noOfPayments,
        downPayment = downPayment
    }
    
    return uuid
end

-- Removes a pending sale request from memory
local function RemoveDirectSaleRequest(uuid)
    if not PendingDirectSales[uuid] then return end
    PendingDirectSales[uuid] = nil
end

-- Callback: Gets all available vehicles, nearby players, and commission rates for the dealer's tablet
lib.callback.register("jg-dealerships:server:get-direct-sale-data", function(source, dealershipId)
    -- Check if the player is actually an employee allowed to make sales
    if not IsEmployee(source, dealershipId, {"supervisor", "manager", "sales"}, true) then
        Framework.Server.Notify(source, Locale.employeePermissionsError, "error")
        return { error = true }
    end

    local categories = Config.DealershipLocations[dealershipId].categories

    -- Fetch dealership info to get the commission rate
    local dealershipData = MySQL.query.await("SELECT * FROM dealership_data WHERE name = ?", {dealershipId})
    
    -- Fetch all available vehicles in stock for this dealership
    local query = "SELECT vehicle.*, stock.stock as stock, stock.price as price FROM dealership_vehicles vehicle INNER JOIN dealership_stock stock ON vehicle.spawn_code = stock.vehicle INNER JOIN dealership_data dealership ON stock.dealership = dealership.name WHERE vehicle.category IN (?) AND (dealership.name = ?) ORDER BY vehicle.spawn_code ASC;"
    local vehicles = MySQL.query.await(query, {categories, dealershipId})

    -- Calculate commission percentage (default to 10% if not set)
    local commissionRate = (dealershipData[1] and dealershipData[1].employee_commission or 10) / 100

    -- Get players standing nearby the dealer
    local ped = GetPlayerPed(source)
    local coords = GetEntityCoords(ped)
    local nearbyPlayers = GetNearbyPlayers(source, coords, 10.0, false)

    return {
        vehicles = vehicles,
        commission = commissionRate,
        nearbyPlayers = nearbyPlayers
    }
end)

-- Callback: Sends the actual sale contract from the dealer to the customer's screen
lib.callback.register("jg-dealerships:server:send-direct-sale-request", function(source, dealershipId, data)
    if not IsEmployee(source, dealershipId, {"supervisor", "manager", "sales"}, true) then
        Framework.Server.Notify(source, Locale.employeePermissionsError, "error")
        return false
    end

    local dealerInfo = Framework.Server.GetPlayerInfo(source)
    local dealerName = dealerInfo and dealerInfo.name or "Dealer"
    
    local customerId = data.playerId
    local customerIdentifier = Framework.Server.GetPlayerIdentifier(customerId)
    
    local isFinanced = data.finance
    local financePayments = data.financePayments
    local financeDownPayment = data.financeDownPayment

    -- Check if the customer has reached their maximum allowed financed vehicles
    if isFinanced then
        local financeQuery = "SELECT COUNT(*) as total FROM " .. Framework.VehiclesTable .. " WHERE financed = 1 AND " .. Framework.PlayerId .. " = ?"
        local financedCount = MySQL.query.await(financeQuery, {customerIdentifier})
        local maxFinanced = Config.MaxFinancedVehiclesPerPlayer or 999999
        
        if financedCount[1] and financedCount[1].total >= maxFinanced then
            Framework.Server.Notify(source, Locale.playerTooManyFinancedVehicles, "error")
            return false
        end
    end

    -- Get Dealership Name Label
    local dealershipLabel = MySQL.scalar.await("SELECT label FROM dealership_data WHERE name = ?", {dealershipId})
    if not dealershipLabel or dealershipLabel == "" then dealershipLabel = dealershipId end

    -- Verify the exact vehicle pricing and stock
    local vehicleQuery = "SELECT vehicle.*, stock.stock as stock, stock.price as price FROM dealership_vehicles vehicle INNER JOIN dealership_stock stock ON vehicle.spawn_code = stock.vehicle INNER JOIN dealership_data dealership ON stock.dealership = dealership.name WHERE vehicle.spawn_code = ? AND dealership.name = ?"
    local vehicleData = MySQL.single.await(vehicleQuery, {data.model, dealershipId})
    
    if not vehicleData then return false end

    -- Create the pending sale request in server memory
    local uuid = CreateDirectSaleRequest(dealershipId, source, customerId, data.model, data.colour, vehicleData.price, isFinanced, financePayments, financeDownPayment)

    -- Send the contract UI to the customer
    TriggerClientEvent("jg-dealerships:client:show-direct-sale-request", customerId, {
        uuid = uuid,
        dealerPlayerId = source,
        dealerName = dealerName,
        dealershipId = dealershipId,
        dealershipLabel = dealershipLabel,
        vehicle = vehicleData,
        colour = data.colour,
        financed = isFinanced,
        downPayment = financeDownPayment,
        noOfPayments = financePayments
    })

    return true
end)

-- Callback: Triggered when the customer clicks 'Accept'
lib.callback.register("jg-dealerships:server:direct-sale-request-accepted", function(source, uuid)
    local saleData = PendingDirectSales[uuid]
    if not saleData then return false end
    
    -- Ensure the person accepting is the actual customer
    if source ~= saleData.playerId then return false end

    local price = saleData.price

    -- If financed, calculate the total price including interest to base the commission off of
    if saleData.finance then
        local interestMultiplier = 1 + (Config.FinanceInterest or 0)
        price = price * interestMultiplier
    end

    local dealershipId = saleData.dealershipId
    local dealerPlayerId = saleData.dealerPlayerId

    -- Calculate the employee's commission
    local dealershipData = MySQL.query.await("SELECT * FROM dealership_data WHERE name = ?", {dealershipId})
    local commissionRate = (dealershipData[1] and dealershipData[1].employee_commission or 10) / 100
    local commissionAmount = Round(price * commissionRate)

    -- Deduct the commission from the dealership's society account
    MySQL.update.await("UPDATE dealership_data SET balance = balance - ? WHERE name = ?", {commissionAmount, dealershipId})

    -- Pay the employee their commission directly into their bank account
    Framework.Server.PlayerAddMoney(dealerPlayerId, commissionAmount, "bank")
    Framework.Server.Notify(dealerPlayerId, Locale.directSaleAccepted, "success")

    return true
end)

-- Callback: Triggered when the customer clicks 'Decline' or closes the menu
lib.callback.register("jg-dealerships:server:direct-sale-request-denied", function(source, uuid)
    local saleData = PendingDirectSales[uuid]
    if not saleData then return false end
    
    -- Ensure the person declining is the actual customer
    if source ~= saleData.playerId then return false end

    -- Remove the request from memory
    RemoveDirectSaleRequest(uuid)

    -- Notify the dealer that the customer declined
    Framework.Server.Notify(saleData.dealerPlayerId, Locale.directSaleRejected, "error")

    return true
end)