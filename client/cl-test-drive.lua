       

local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = nil
L1_1 = nil
function L2_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L0_2 = Globals
  L0_2 = L0_2.IsTestDriving
  if L0_2 then
    L0_2 = L1_1
    if L0_2 then
      L0_2 = L0_1
      if L0_2 then
        goto lbl_13
      end
    end
  end
  L0_2 = false
  do return L0_2 end
  ::lbl_13::
  L0_2 = Globals
  L0_2.IsTestDriving = false
  L0_2 = DoScreenFadeOut
  L1_2 = 500
  L0_2(L1_2)
  L0_2 = Wait
  L1_2 = 500
  L0_2(L1_2)
  L0_2 = Framework
  L0_2 = L0_2.Client
  L0_2 = L0_2.GetPlate
  L1_2 = L1_1
  L0_2 = L0_2(L1_2)
  if L0_2 then
    L1_2 = Framework
    L1_2 = L1_2.Client
    L1_2 = L1_2.VehicleRemoveKeys
    L2_2 = L0_2
    L3_2 = L1_1
    L4_2 = "testDrive"
    L1_2(L2_2, L3_2, L4_2)
  end
  L1_2 = nil
  L1_1 = L1_2
  L1_2 = lib
  L1_2 = L1_2.callback
  L1_2 = L1_2.await
  L2_2 = "jg-dealerships:server:finish-test-drive"
  L3_2 = false
  L1_2 = L1_2(L2_2, L3_2)
  L2_2 = TriggerEvent
  L3_2 = "jg-dealerships:client:open-showroom"
  L4_2 = L1_2.dealershipId
  L5_2 = L1_2.vehicleModel
  L6_2 = L1_2.vehicleColour
  L2_2(L3_2, L4_2, L5_2, L6_2)
end
function L3_1()
  local L0_2, L1_2
  L0_2 = CreateThread
  function L1_2()
    local L0_3, L1_3, L2_3, L3_3
    while true do
      L0_3 = Globals
      L0_3 = L0_3.IsTestDriving
      if not L0_3 then
        break
      end
      L0_3 = cache
      L0_3 = L0_3.vehicle
      if not L0_3 then
        L0_3 = L2_1
        L0_3()
      end
      L0_3 = SetPlayerCanDoDriveBy
      L1_3 = cache
      L1_3 = L1_3.ped
      L2_3 = false
      L0_3(L1_3, L2_3)
      L0_3 = DisablePlayerFiring
      L1_3 = cache
      L1_3 = L1_3.ped
      L2_3 = true
      L0_3(L1_3, L2_3)
      L0_3 = DisableControlAction
      L1_3 = 0
      L2_3 = 140
      L3_3 = true
      L0_3(L1_3, L2_3, L3_3)
      L0_3 = Wait
      L1_3 = 0
      L0_3(L1_3)
    end
  end
  L0_2(L1_2)
end
function L4_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2
  L3_2 = Config
  L3_2 = L3_2.DealershipLocations
  L3_2 = L3_2[A0_2]
  L0_1 = L3_2
  L3_2 = L0_1.testDriveSpawn
  L4_2 = L0_1.enableTestDrive
  if not L4_2 then
    L4_2 = false
    return L4_2
  end
  L4_2 = Framework
  L4_2 = L4_2.Client
  L4_2 = L4_2.GetVehicleLabel
  L5_2 = A1_2
  L4_2 = L4_2(L5_2)
  L5_2 = lib
  L5_2 = L5_2.callback
  L5_2 = L5_2.await
  L6_2 = "jg-dealerships:server:vehicle-generate-plate"
  L7_2 = false
  L8_2 = Config
  L8_2 = L8_2.TestDrivePlate
  L9_2 = false
  L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2)
  L6_2 = FindVehicleSpawnCoords
  L7_2 = L0_1.testDriveSpawn
  L6_2 = L6_2(L7_2)
  L3_2 = L6_2
  L6_2 = ExitShowroom
  L6_2()
  L6_2 = nil
  L7_2 = nil
  L8_2 = false
  L9_2 = Config
  L9_2 = L9_2.SpawnVehiclesWithServerSetter
  if not L9_2 then
    L9_2 = {}
    L9_2.plate = L5_2
    L9_2.colour = A2_2
    L10_2 = SpawnVehicleClient
    L11_2 = 0
    L12_2 = A1_2
    L13_2 = L5_2
    L14_2 = L3_2
    L15_2 = true
    L16_2 = L9_2
    L17_2 = "testDrive"
    L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2)
    L6_2 = L10_2
    if not L6_2 then
      L10_2 = false
      return L10_2
    end
    L10_2 = VehToNet
    L11_2 = L6_2
    L10_2 = L10_2(L11_2)
    L7_2 = L10_2
  end
  L9_2 = lib
  L9_2 = L9_2.callback
  L9_2 = L9_2.await
  L10_2 = "jg-dealerships:server:start-test-drive"
  L11_2 = false
  L12_2 = A0_2
  L13_2 = L3_2
  L14_2 = L7_2
  L15_2 = A1_2
  L16_2 = L4_2
  L17_2 = L5_2
  L18_2 = A2_2
  L9_2, L10_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2)
  L7_2 = L10_2
  L8_2 = L9_2
  if L7_2 then
    L9_2 = NetToVeh
    L10_2 = L7_2
    L9_2 = L9_2(L10_2)
    if L9_2 then
      goto lbl_82
      L6_2 = L9_2 or L6_2
    end
  end
  L6_2 = false
  ::lbl_82::
  if not L8_2 then
    if L6_2 then
      L9_2 = JGDeleteVehicle
      L10_2 = L6_2
      L9_2(L10_2)
    end
    L9_2 = false
    return L9_2
  end
  L9_2 = Config
  L9_2 = L9_2.SpawnVehiclesWithServerSetter
  if L9_2 and not L6_2 then
    L9_2 = print
    L10_2 = "^1[ERROR] There was a problem spawning in your vehicle"
    L9_2(L10_2)
    L9_2 = false
    return L9_2
  end
  L9_2 = Globals
  L10_2 = true
  L1_1 = L6_2
  L9_2.IsTestDriving = L10_2
  L9_2 = SetNuiFocus
  L10_2 = false
  L11_2 = false
  L9_2(L10_2, L11_2)
  L9_2 = SendNUIMessage
  L10_2 = {}
  L10_2.type = "testDriveHud"
  L11_2 = Config
  L11_2 = L11_2.TestDriveTimeSeconds
  if not L11_2 then
    L11_2 = 60
  end
  L10_2.time = L11_2
  L11_2 = Locale
  L10_2.locale = L11_2
  L11_2 = Config
  L10_2.config = L11_2
  L9_2(L10_2)
  L9_2 = TriggerEvent
  L10_2 = "jg-dealerships:client:start-test-drive:config"
  L11_2 = L6_2
  L12_2 = Framework
  L12_2 = L12_2.Client
  L12_2 = L12_2.GetPlate
  L13_2 = L6_2
  L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2 = L12_2(L13_2)
  L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2)
  L9_2 = DoScreenFadeIn
  L10_2 = 500
  L9_2(L10_2)
  L9_2 = CreateThread
  function L10_2()
    local L0_3, L1_3
    L0_3 = Wait
    L1_3 = 2500
    L0_3(L1_3)
    L0_3 = L3_1
    L0_3()
  end
  L9_2(L10_2)
  L9_2 = true
  return L9_2
end
L5_1 = RegisterNUICallback
L6_1 = "finish-test-drive"
function L7_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = L2_1
  L2_2()
  L2_2 = A1_2
  L3_2 = true
  L2_2(L3_2)
end
L5_1(L6_1, L7_1)
L5_1 = RegisterNUICallback
L6_1 = "test-drive"
function L7_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = DoScreenFadeOut
  L3_2 = 500
  L2_2(L3_2)
  L2_2 = Wait
  L3_2 = 500
  L2_2(L3_2)
  L2_2 = L4_1
  L3_2 = A0_2.dealershipId
  L4_2 = A0_2.vehicle
  L5_2 = A0_2.color
  L2_2 = L2_2(L3_2, L4_2, L5_2)
  if not L2_2 then
    L3_2 = DoScreenFadeIn
    L4_2 = 0
    L3_2(L4_2)
    L3_2 = A1_2
    L4_2 = {}
    L4_2.error = true
    return L3_2(L4_2)
  end
  L3_2 = A1_2
  L4_2 = true
  L3_2(L4_2)
end
L5_1(L6_1, L7_1)
L5_1 = AddEventHandler
L6_1 = "onResourceStop"
function L7_1(A0_2)
  local L1_2, L2_2
  L1_2 = GetCurrentResourceName
  L1_2 = L1_2()
  if L1_2 == A0_2 then
    L1_2 = Globals
    L1_2 = L1_2.IsTestDriving
    if L1_2 then
      L1_2 = TriggerServerEvent
      L2_2 = "jg-dealerships:server:exit-bucket"
      L1_2(L2_2)
      L1_2 = cache
      L1_2 = L1_2.vehicle
      if L1_2 then
        L1_2 = DeleteEntity
        L2_2 = cache
        L2_2 = L2_2.vehicle
        L1_2(L2_2)
      end
    end
  end
end
L5_1(L6_1, L7_1)
