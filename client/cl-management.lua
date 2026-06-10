         

local L0_1, L1_1, L2_1
L0_1 = RegisterNetEvent
L1_1 = "jg-dealerships:client:open-management"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L2_2 = Config
  L2_2 = L2_2.DealershipLocations
  L2_2 = L2_2[A0_2]
  L3_2 = lib
  L3_2 = L3_2.callback
  L3_2 = L3_2.await
  L4_2 = "jg-dealerships:server:get-dealership-data"
  L5_2 = false
  L6_2 = A0_2
  L3_2 = L3_2(L4_2, L5_2, L6_2)
  L4_2 = SetNuiFocus
  L5_2 = true
  L6_2 = true
  L4_2(L5_2, L6_2)
  L4_2 = SendNUIMessage
  L5_2 = {}
  L5_2.type = "showAdmin"
  L6_2 = L2_2.type
  L5_2.shopType = L6_2
  L5_2.dealershipId = A0_2
  L6_2 = L3_2.ownerId
  L5_2.ownerId = L6_2
  L6_2 = L3_2.name
  L5_2.name = L6_2
  L6_2 = L3_2.balance
  if not L6_2 then
    L6_2 = 0
  end
  L5_2.balance = L6_2
  L6_2 = L3_2.commission
  if not L6_2 then
    L6_2 = 10
  end
  L5_2.commission = L6_2
  L6_2 = L3_2.playerName
  L5_2.playerName = L6_2
  L6_2 = L3_2.employeeRole
  L5_2.employeeRole = L6_2
  L6_2 = L3_2.stats
  L5_2.stats = L6_2
  L6_2 = A1_2 or L6_2
  if not A1_2 then
    L6_2 = false
  end
  L5_2.fromAdmin = L6_2
  L6_2 = L3_2.nearbyPlayers
  L5_2.nearbyPlayers = L6_2
  L6_2 = {}
  L7_2 = Framework
  L7_2 = L7_2.Client
  L7_2 = L7_2.GetBalance
  L8_2 = "bank"
  L7_2 = L7_2(L8_2)
  L6_2.bank = L7_2
  L7_2 = Framework
  L7_2 = L7_2.Client
  L7_2 = L7_2.GetBalance
  L8_2 = "cash"
  L7_2 = L7_2(L8_2)
  L6_2.cash = L7_2
  L5_2.playerBalance = L6_2
  L6_2 = {}
  L7_2 = "CEO"
  L8_2 = "Owner"
  L9_2 = "Employee"
  L6_2[1] = L7_2
  L6_2[2] = L8_2
  L6_2[3] = L9_2
  L5_2.roles = L6_2
  L6_2 = Locale
  L5_2.locale = L6_2
  L6_2 = Config
  L5_2.config = L6_2
  L4_2(L5_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "open-dealership-management"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = TriggerEvent
  L3_2 = "jg-dealerships:client:open-management"
  L4_2 = A0_2.id
  L5_2 = A0_2.fromAdmin
  L2_2(L3_2, L4_2, L5_2)
  L2_2 = A1_2
  L3_2 = true
  L2_2(L3_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "get-dealership-balance"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = A1_2
  L3_2 = lib
  L3_2 = L3_2.callback
  L3_2 = L3_2.await
  L4_2 = "jg-dealerships:server:get-dealership-balance"
  L5_2 = false
  L6_2 = A0_2.dealership
  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2, L5_2, L6_2)
  L2_2(L3_2, L4_2, L5_2, L6_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "get-dealership-vehicles"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = A1_2
  L3_2 = lib
  L3_2 = L3_2.callback
  L3_2 = L3_2.await
  L4_2 = "jg-dealerships:server:get-dealership-vehicles"
  L5_2 = false
  L6_2 = A0_2
  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2, L5_2, L6_2)
  L2_2(L3_2, L4_2, L5_2, L6_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "get-dealership-display-vehicles"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = A1_2
  L3_2 = lib
  L3_2 = L3_2.callback
  L3_2 = L3_2.await
  L4_2 = "jg-dealerships:server:get-dealership-display-vehicles"
  L5_2 = false
  L6_2 = A0_2
  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2, L5_2, L6_2)
  L2_2(L3_2, L4_2, L5_2, L6_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "get-dealership-orders"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = A1_2
  L3_2 = lib
  L3_2 = L3_2.callback
  L3_2 = L3_2.await
  L4_2 = "jg-dealerships:server:get-dealership-orders"
  L5_2 = false
  L6_2 = A0_2
  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2, L5_2, L6_2)
  L2_2(L3_2, L4_2, L5_2, L6_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "get-dealership-sales"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = A1_2
  L3_2 = lib
  L3_2 = L3_2.callback
  L3_2 = L3_2.await
  L4_2 = "jg-dealerships:server:get-dealership-sales"
  L5_2 = false
  L6_2 = A0_2
  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2, L5_2, L6_2)
  L2_2(L3_2, L4_2, L5_2, L6_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "get-dealership-employees"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = A1_2
  L3_2 = lib
  L3_2 = L3_2.callback
  L3_2 = L3_2.await
  L4_2 = "jg-dealerships:server:get-dealership-employees"
  L5_2 = false
  L6_2 = A0_2
  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2, L5_2, L6_2)
  L2_2(L3_2, L4_2, L5_2, L6_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "order-vehicle"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L2_2 = A1_2
  L3_2 = lib
  L3_2 = L3_2.callback
  L3_2 = L3_2.await
  L4_2 = "jg-dealerships:server:order-vehicle"
  L5_2 = false
  L6_2 = A0_2.dealership
  L7_2 = A0_2.spawnCode
  L8_2 = A0_2.quantity
  L3_2, L4_2, L5_2, L6_2, L7_2, L8_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2)
  L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "cancel-vehicle-order"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = A1_2
  L3_2 = lib
  L3_2 = L3_2.callback
  L3_2 = L3_2.await
  L4_2 = "jg-dealerships:server:cancel-vehicle-order"
  L5_2 = false
  L6_2 = A0_2.orderId
  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2, L5_2, L6_2)
  L2_2(L3_2, L4_2, L5_2, L6_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "update-dealership-balance"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L2_2 = A0_2.action
  if "deposit" == L2_2 then
    L2_2 = A1_2
    L3_2 = lib
    L3_2 = L3_2.callback
    L3_2 = L3_2.await
    L4_2 = "jg-dealerships:server:dealership-deposit"
    L5_2 = false
    L6_2 = A0_2.dealership
    L7_2 = A0_2.source
    L8_2 = A0_2.amount
    L3_2, L4_2, L5_2, L6_2, L7_2, L8_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2)
    L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2)
  else
    L2_2 = A0_2.action
    if "withdraw" == L2_2 then
      L2_2 = A1_2
      L3_2 = lib
      L3_2 = L3_2.callback
      L3_2 = L3_2.await
      L4_2 = "jg-dealerships:server:dealership-withdraw"
      L5_2 = false
      L6_2 = A0_2.dealership
      L7_2 = A0_2.amount
      L3_2, L4_2, L5_2, L6_2, L7_2, L8_2 = L3_2(L4_2, L5_2, L6_2, L7_2)
      L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2)
    end
  end
  L2_2 = A1_2
  L3_2 = {}
  L3_2.error = true
  return L2_2(L3_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "update-vehicle-price"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L2_2 = A0_2.vehicle
  L3_2 = A0_2.dealership
  L4_2 = A0_2.newPrice
  L5_2 = TriggerServerEvent
  L6_2 = "jg-dealerships:server:update-vehicle-price"
  L7_2 = L3_2
  L8_2 = L2_2
  L9_2 = L4_2
  L5_2(L6_2, L7_2, L8_2, L9_2)
  L5_2 = A1_2
  L6_2 = true
  L5_2(L6_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "update-dealership-settings"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = A0_2.dealership
  L3_2 = TriggerServerEvent
  L4_2 = "jg-dealerships:server:update-dealership-settings"
  L5_2 = L2_2
  L6_2 = A0_2
  L3_2(L4_2, L5_2, L6_2)
  L3_2 = A1_2
  L4_2 = true
  L3_2(L4_2)
end
L0_1(L1_1, L2_1)
