         

local L0_1, L1_1, L2_1
L0_1 = RegisterNetEvent
L1_1 = "jg-dealerships:client:sell-vehicle"
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L1_2 = cache
  L1_2 = L1_2.vehicle
  if not L1_2 then
    L1_2 = Framework
    L1_2 = L1_2.Client
    L1_2 = L1_2.Notify
    L2_2 = Locale
    L2_2 = L2_2.notInVehicle
    L3_2 = "error"
    return L1_2(L2_2, L3_2)
  end
  L1_2 = Framework
  L1_2 = L1_2.Client
  L1_2 = L1_2.GetPlate
  L2_2 = cache
  L2_2 = L2_2.vehicle
  L1_2 = L1_2(L2_2)
  if not L1_2 then
    return
  end
  L2_2 = GetEntityArchetypeName
  L3_2 = cache
  L3_2 = L3_2.vehicle
  L2_2 = L2_2(L3_2)
  L3_2 = DebugPrint
  L4_2 = "Trying to sell vehicle with plate: "
  L5_2 = L1_2
  L6_2 = " and model: "
  L7_2 = L2_2
  L4_2 = L4_2 .. L5_2 .. L6_2 .. L7_2
  L5_2 = "debug"
  L3_2(L4_2, L5_2)
  L3_2 = lib
  L3_2 = L3_2.callback
  L3_2 = L3_2.await
  L4_2 = "jg-dealerships:server:sell-vehicle-get-value"
  L5_2 = false
  L6_2 = A0_2
  L7_2 = L1_2
  L8_2 = L2_2
  L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2)
  if not L3_2 then
    return
  end
  L4_2 = SetNuiFocus
  L5_2 = true
  L6_2 = true
  L4_2(L5_2, L6_2)
  L4_2 = SendNUIMessage
  L5_2 = {}
  L5_2.type = "sell-vehicle-to-dealer"
  L5_2.dealershipId = A0_2
  L5_2.plate = L1_2
  L5_2.value = L3_2
  L6_2 = Config
  L5_2.config = L6_2
  L6_2 = Locale
  L5_2.locale = L6_2
  L4_2(L5_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "sell-vehicle-price-accepted"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2
  L2_2 = cache
  L2_2 = L2_2.vehicle
  if not L2_2 then
    L2_2 = A1_2
    L3_2 = false
    return L2_2(L3_2)
  end
  L2_2 = cache
  L2_2 = L2_2.vehicle
  L3_2 = Framework
  L3_2 = L3_2.Client
  L3_2 = L3_2.GetPlate
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    L4_2 = A1_2
    L5_2 = false
    return L4_2(L5_2)
  end
  L4_2 = GetEntityArchetypeName
  L5_2 = L2_2
  L4_2 = L4_2(L5_2)
  L5_2 = lib
  L5_2 = L5_2.callback
  L5_2 = L5_2.await
  L6_2 = "jg-dealerships:server:sell-vehicle"
  L7_2 = 2500
  L8_2 = A0_2.dealershipId
  L9_2 = L3_2
  L10_2 = L4_2
  L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2, L10_2)
  if not L5_2 then
    L6_2 = A1_2
    L7_2 = false
    return L6_2(L7_2)
  end
  L6_2 = Config
  L6_2 = L6_2.DealershipLocations
  L7_2 = A0_2.dealershipId
  L6_2 = L6_2[L7_2]
  if L6_2 then
    L6_2 = L6_2.openShowroom
  end
  if L6_2 then
    L6_2 = L6_2.coords
  end
  L7_2 = DoScreenFadeOut
  L8_2 = 500
  L7_2(L8_2)
  L7_2 = Wait
  L8_2 = 500
  L7_2(L8_2)
  L7_2 = -1
  L8_2 = 5
  L9_2 = 1
  for L10_2 = L7_2, L8_2, L9_2 do
    L11_2 = GetPedInVehicleSeat
    L12_2 = L2_2
    L13_2 = L10_2
    L11_2 = L11_2(L12_2, L13_2)
    if L11_2 then
      L12_2 = TaskLeaveVehicle
      L13_2 = L11_2
      L14_2 = L2_2
      L15_2 = 0
      L12_2(L13_2, L14_2, L15_2)
      if L6_2 then
        L12_2 = SetEntityCoords
        L13_2 = L11_2
        L14_2 = L6_2.x
        L15_2 = L6_2.y
        L16_2 = L6_2.z
        L17_2 = true
        L18_2 = false
        L19_2 = false
        L20_2 = false
        L12_2(L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
      end
    end
  end
  L7_2 = Framework
  L7_2 = L7_2.Client
  L7_2 = L7_2.VehicleRemoveKeys
  L8_2 = L3_2
  L9_2 = L2_2
  L10_2 = "vehicleSale"
  L7_2(L8_2, L9_2, L10_2)
  L7_2 = SetVehicleDoorsLocked
  L8_2 = L2_2
  L9_2 = 2
  L7_2(L8_2, L9_2)
  L7_2 = Wait
  L8_2 = 1500
  L7_2(L8_2)
  L7_2 = TriggerEvent
  L8_2 = "jg-dealerships:client:sell-vehicle:config"
  L9_2 = L2_2
  L10_2 = L3_2
  L7_2(L8_2, L9_2, L10_2)
  L7_2 = DoScreenFadeIn
  L8_2 = 500
  L7_2(L8_2)
  L7_2 = A1_2
  L8_2 = true
  L7_2(L8_2)
end
L0_1(L1_1, L2_1)
