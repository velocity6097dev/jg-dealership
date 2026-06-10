local L0_1, L1_1, L2_1
L0_1 = RegisterNetEvent
L1_1 = "jg-dealerships:client:open-admin"
function L2_1()
  local L0_2, L1_2, L2_2, L3_2
  L0_2 = lib
  L0_2 = L0_2.callback
  L0_2 = L0_2.await
  L1_2 = "jg-dealerships:server:get-admin-data"
  L2_2 = false
  L0_2 = L0_2(L1_2, L2_2)
  L1_2 = SetNuiFocus
  L2_2 = true
  L3_2 = true
  L1_2(L2_2, L3_2)
  L1_2 = SendNUIMessage
  L2_2 = {}
  L2_2.type = "vehiclesAdmin"
  L3_2 = L0_2.dealerships
  L2_2.dealers = L3_2
  L3_2 = L0_2.vehicles
  L2_2.vehicles = L3_2
  L3_2 = L0_2.nearbyPlayers
  L2_2.nearbyPlayers = L3_2
  L3_2 = Config
  L2_2.config = L3_2
  L3_2 = Locale
  L2_2.locale = L3_2
  L1_2(L2_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "open-admin"
function L2_1()
  local L0_2, L1_2
  L0_2 = TriggerEvent
  L1_2 = "jg-dealerships:client:open-admin"
  L0_2(L1_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "add-vehicle"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  L2_2 = A0_2.spawn_code
  L3_2 = A0_2.brand
  L4_2 = A0_2.model
  L5_2 = A0_2.category
  L6_2 = A0_2.price
  L7_2 = A0_2.dealerships
  L8_2 = lib
  L8_2 = L8_2.callback
  L8_2 = L8_2.await
  L9_2 = "jg-dealerships:server:add-vehicle"
  L10_2 = false
  L11_2 = L2_2
  L12_2 = L3_2
  L13_2 = L4_2
  L14_2 = L5_2
  L15_2 = L6_2
  L16_2 = L7_2
  L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
  L8_2 = A1_2
  L9_2 = true
  L8_2(L9_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "update-vehicle"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2
  L2_2 = A0_2.spawn_code
  L3_2 = A0_2.brand
  L4_2 = A0_2.model
  L5_2 = A0_2.category
  L6_2 = A0_2.price
  L7_2 = A0_2.dealerships
  L8_2 = A0_2.updateDealerPrices
  L9_2 = lib
  L9_2 = L9_2.callback
  L9_2 = L9_2.await
  L10_2 = "jg-dealerships:server:update-vehicle"
  L11_2 = false
  L12_2 = L2_2
  L13_2 = L3_2
  L14_2 = L4_2
  L15_2 = L5_2
  L16_2 = L6_2
  L17_2 = L7_2
  L18_2 = L8_2 or L18_2
  if not L8_2 then
    L18_2 = false
  end
  L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2)
  L9_2 = A1_2
  L10_2 = true
  L9_2(L10_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "delete-vehicle"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = A0_2.spawn_code
  L3_2 = lib
  L3_2 = L3_2.callback
  L3_2 = L3_2.await
  L4_2 = "jg-dealerships:server:delete-vehicle"
  L5_2 = false
  L6_2 = L2_2
  L3_2(L4_2, L5_2, L6_2)
  L3_2 = A1_2
  L4_2 = true
  L3_2(L4_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "delete-dealership-data"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = A0_2.dealershipId
  L3_2 = lib
  L3_2 = L3_2.callback
  L3_2 = L3_2.await
  L4_2 = "jg-dealerships:server:delete-dealership-data"
  L5_2 = false
  L6_2 = L2_2
  L3_2 = L3_2(L4_2, L5_2, L6_2)
  L4_2 = TriggerEvent
  L5_2 = "jg-dealerships:client:open-admin"
  L4_2(L5_2)
  L4_2 = A1_2
  L5_2 = L3_2
  L4_2(L5_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "set-dealership-owner"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L2_2 = A0_2.dealershipId
  L3_2 = A0_2.player
  L4_2 = lib
  L4_2 = L4_2.callback
  L4_2 = L4_2.await
  L5_2 = "jg-dealerships:server:set-dealership-owner"
  L6_2 = false
  L7_2 = L2_2
  L8_2 = L3_2
  L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
  L5_2 = TriggerEvent
  L6_2 = "jg-dealerships:client:open-admin"
  L5_2(L6_2)
  L5_2 = A1_2
  L6_2 = L4_2
  L5_2(L6_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "import-vehicles-data"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L2_2 = A0_2.location
  L3_2 = A0_2.behaviour
  L4_2 = lib
  L4_2 = L4_2.callback
  L4_2 = L4_2.await
  L5_2 = "jg-dealerships:server:import-vehicles-data"
  L6_2 = false
  L7_2 = L2_2
  L8_2 = L3_2
  L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
  L5_2 = TriggerEvent
  L6_2 = "jg-dealerships:client:open-admin"
  L5_2(L6_2)
  L5_2 = A1_2
  L6_2 = L4_2
  L5_2(L6_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "verify-spawn-code"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L2_2 = A0_2.spawnCode
  if not L2_2 then
    L3_2 = A1_2
    L4_2 = false
    return L3_2(L4_2)
  end
  L3_2 = GetHashKey
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  L4_2 = A1_2
  L5_2 = {}
  L6_2 = IsModelValid
  L7_2 = L3_2
  L6_2 = L6_2(L7_2)
  if L6_2 then
    L6_2 = true
    if L6_2 then
      goto lbl_23
    end
  end
  L6_2 = false
  ::lbl_23::
  L5_2.valid = L6_2
  L4_2(L5_2)
end
L0_1(L1_1, L2_1)
