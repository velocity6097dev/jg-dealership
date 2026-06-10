local L0_1, L1_1, L2_1, L3_1
L0_1 = RegisterNetEvent
L1_1 = "jg-dealerships:client:direct-sale"
function L2_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L0_2 = lib
  L0_2 = L0_2.callback
  L0_2 = L0_2.await
  L1_2 = "jg-dealerships:server:employee-nearest-dealership"
  L2_2 = false
  L0_2 = L0_2(L1_2, L2_2)
  if L0_2 then
    L1_2 = L0_2.error
    if L1_2 then
      return
    end
  end
  L1_2 = Config
  L1_2 = L1_2.DealershipLocations
  L1_2 = L1_2[L0_2]
  L2_2 = L1_2.categories
  L3_2 = lib
  L3_2 = L3_2.callback
  L3_2 = L3_2.await
  L4_2 = "jg-dealerships:server:get-direct-sale-data"
  L5_2 = false
  L6_2 = L0_2
  L3_2 = L3_2(L4_2, L5_2, L6_2)
  L4_2 = PlayTabletAnim
  L4_2()
  L4_2 = SetNuiFocus
  L5_2 = true
  L6_2 = true
  L4_2(L5_2, L6_2)
  L4_2 = SendNUIMessage
  L5_2 = {}
  L5_2.type = "showDSSellVehicle"
  L6_2 = L3_2.vehicles
  L5_2.vehicles = L6_2
  L6_2 = L3_2.nearbyPlayers
  L5_2.nearbyPlayers = L6_2
  L5_2.categories = L2_2
  L6_2 = L3_2.commission
  L5_2.commission = L6_2
  L6_2 = L1_2.enableFinance
  L5_2.enableFinance = L6_2
  L6_2 = Config
  L5_2.config = L6_2
  L6_2 = Locale
  L5_2.locale = L6_2
  L4_2(L5_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNetEvent
L1_1 = "jg-dealerships:client:show-direct-sale-request"
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = Globals
  L1_2 = L1_2.CurrentDealership
  if L1_2 then
    L1_2 = TriggerServerEvent
    L2_2 = "jg-dealerships:server:notify-other-player"
    L3_2 = A0_2.dealerPlayerId
    L4_2 = "Customer is in the showroom! Wait for them to come back, and try again"
    L5_2 = "error"
    L1_2(L2_2, L3_2, L4_2, L5_2)
    return
  end
  L1_2 = SetNuiFocus
  L2_2 = true
  L3_2 = true
  L1_2(L2_2, L3_2)
  L1_2 = SendNUIMessage
  L2_2 = {}
  L2_2.type = "show-direct-sale-request"
  L3_2 = A0_2.uuid
  L2_2.uuid = L3_2
  L3_2 = A0_2.dealerPlayerId
  L2_2.dealerPlayerId = L3_2
  L3_2 = A0_2.dealerName
  L2_2.dealerName = L3_2
  L3_2 = A0_2.dealershipId
  L2_2.dealershipId = L3_2
  L3_2 = A0_2.dealershipLabel
  L2_2.dealershipLabel = L3_2
  L3_2 = GetPlayerBalances
  L4_2 = A0_2.dealershipId
  L3_2 = L3_2(L4_2)
  L2_2.playerBalances = L3_2
  L3_2 = A0_2.vehicle
  L3_2 = L3_2.brand
  if not L3_2 then
    L3_2 = ""
  end
  L4_2 = " "
  L5_2 = A0_2.vehicle
  L5_2 = L5_2.model
  if not L5_2 then
    L5_2 = ""
  end
  L3_2 = L3_2 .. L4_2 .. L5_2
  L2_2.vehicleLabel = L3_2
  L3_2 = A0_2.vehicle
  L3_2 = L3_2.spawn_code
  L2_2.vehicleSpawnCode = L3_2
  L3_2 = A0_2.vehicle
  L3_2 = L3_2.price
  L2_2.vehiclePrice = L3_2
  L3_2 = A0_2.colour
  L2_2.color = L3_2
  L3_2 = A0_2.financed
  L2_2.financed = L3_2
  L3_2 = A0_2.downPayment
  L2_2.downPayment = L3_2
  L3_2 = A0_2.noOfPayments
  L2_2.noOfPayments = L3_2
  L3_2 = Config
  L2_2.config = L3_2
  L3_2 = Locale
  L2_2.locale = L3_2
  L1_2(L2_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "send-direct-sale-request"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L2_2 = lib
  L2_2 = L2_2.callback
  L2_2 = L2_2.await
  L3_2 = "jg-dealerships:server:employee-nearest-dealership"
  L4_2 = false
  L2_2 = L2_2(L3_2, L4_2)
  if L2_2 then
    L3_2 = L2_2.error
    if L3_2 then
      L3_2 = A1_2
      L4_2 = {}
      L4_2.error = true
      return L3_2(L4_2)
    end
  end
  L3_2 = lib
  L3_2 = L3_2.callback
  L3_2 = L3_2.await
  L4_2 = "jg-dealerships:server:send-direct-sale-request"
  L5_2 = false
  L6_2 = L2_2
  L7_2 = A0_2
  L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2)
  if not L3_2 then
    L3_2 = A1_2
    L4_2 = {}
    L4_2.error = true
    return L3_2(L4_2)
  end
  L3_2 = A1_2
  L4_2 = true
  L3_2(L4_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "accept-direct-sale-request"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = SetNuiFocus
  L3_2 = false
  L4_2 = false
  L2_2(L3_2, L4_2)
  L2_2 = lib
  L2_2 = L2_2.callback
  L2_2 = L2_2.await
  L3_2 = "jg-dealerships:server:direct-sale-request-accepted"
  L4_2 = false
  L5_2 = A0_2
  L2_2 = L2_2(L3_2, L4_2, L5_2)
  if not L2_2 then
    L2_2 = A1_2
    L3_2 = {}
    L3_2.error = true
    return L2_2(L3_2)
  end
  L2_2 = A1_2
  L3_2 = true
  L2_2(L3_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "deny-direct-sale-request"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = SetNuiFocus
  L3_2 = false
  L4_2 = false
  L2_2(L3_2, L4_2)
  L2_2 = lib
  L2_2 = L2_2.callback
  L2_2 = L2_2.await
  L3_2 = "jg-dealerships:server:direct-sale-request-denied"
  L4_2 = false
  L5_2 = A0_2
  L2_2 = L2_2(L3_2, L4_2, L5_2)
  if not L2_2 then
    L2_2 = A1_2
    L3_2 = {}
    L3_2.error = true
    return L2_2(L3_2)
  end
  L2_2 = A1_2
  L3_2 = true
  L2_2(L3_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterCommand
L1_1 = Config
L1_1 = L1_1.DirectSaleCommand
if not L1_1 then
  L1_1 = "directsale"
end
function L2_1()
  local L0_2, L1_2
  L0_2 = TriggerEvent
  L1_2 = "jg-dealerships:client:direct-sale"
  L0_2(L1_2)
end
L3_1 = false
L0_1(L1_1, L2_1, L3_1)
