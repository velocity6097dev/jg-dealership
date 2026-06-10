        

local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = nil
L1_1 = nil
L2_1 = 120.0
L3_1 = 1
L4_1 = false
L5_1 = Globals
L5_1.CurrentDealership = nil
function L5_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = Config
  L1_2 = L1_2.DealershipLocations
  L1_2 = L1_2[A0_2]
  if not L1_2 then
    L2_2 = false
    return L2_2
  end
  L2_2 = L1_2.showroomJobWhitelist
  if L2_2 then
    L2_2 = next
    L3_2 = L1_2.showroomJobWhitelist
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_26
    end
  end
  L2_2 = L1_2.showroomGangWhitelist
  if L2_2 then
    L2_2 = next
    L3_2 = L1_2.showroomGangWhitelist
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_26
    end
  end
  L2_2 = true
  do return L2_2 end
  ::lbl_26::
  L2_2 = L1_2.showroomJobWhitelist
  if L2_2 then
    L2_2 = next
    L3_2 = L1_2.showroomJobWhitelist
    L2_2 = L2_2(L3_2)
    if L2_2 then
      L2_2 = Framework
      L2_2 = L2_2.Client
      L2_2 = L2_2.GetPlayerJob
      L2_2 = L2_2()
      if not L2_2 then
        L3_2 = DebugPrint
        L4_2 = "Framework.Client.GetPlayerJob() returned nil"
        L5_2 = "warning"
        L3_2(L4_2, L5_2)
        L3_2 = false
        return L3_2
      end
      L3_2 = DebugPrint
      L4_2 = "Got player job information"
      L5_2 = "debug"
      L6_2 = L2_2
      L3_2(L4_2, L5_2, L6_2)
      L3_2 = L1_2.showroomJobWhitelist
      L4_2 = L2_2.name
      L3_2 = L3_2[L4_2]
      if L3_2 then
        L4_2 = IsItemInList
        L5_2 = L3_2
        L6_2 = tonumber
        L7_2 = L2_2.grade
        L6_2 = L6_2(L7_2)
        if not L6_2 then
          L6_2 = 0
        end
        L4_2 = L4_2(L5_2, L6_2)
        if L4_2 then
          L4_2 = true
          return L4_2
        end
      end
    end
  end
  L2_2 = Config
  L2_2 = L2_2.Framework
  if "QBCore" ~= L2_2 then
    L2_2 = Config
    L2_2 = L2_2.Framework
    if "Qbox" ~= L2_2 then
      goto lbl_120
    end
  end
  L2_2 = L1_2.showroomGangWhitelist
  if L2_2 then
    L2_2 = next
    L3_2 = L1_2.showroomGangWhitelist
    L2_2 = L2_2(L3_2)
    if L2_2 then
      L2_2 = Framework
      L2_2 = L2_2.Client
      L2_2 = L2_2.GetPlayerGang
      L2_2 = L2_2()
      if not L2_2 then
        L3_2 = DebugPrint
        L4_2 = "Framework.Client.GetPlayerGang() returned nil"
        L5_2 = "warning"
        L3_2(L4_2, L5_2)
        L3_2 = false
        return L3_2
      end
      L3_2 = DebugPrint
      L4_2 = "Got player gang information"
      L5_2 = "debug"
      L6_2 = L2_2
      L3_2(L4_2, L5_2, L6_2)
      L3_2 = L1_2.showroomGangWhitelist
      L4_2 = L2_2.name
      L3_2 = L3_2[L4_2]
      if L3_2 then
        L4_2 = IsItemInList
        L5_2 = L3_2
        L6_2 = tonumber
        L7_2 = L2_2.grade
        L6_2 = L6_2(L7_2)
        if not L6_2 then
          L6_2 = 0
        end
        L4_2 = L4_2(L5_2, L6_2)
        if L4_2 then
          L4_2 = true
          return L4_2
        end
      end
    end
  end
  ::lbl_120::
  L2_2 = false
  return L2_2
end
IsShowroomAccessAllowed = L5_1
function L5_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L1_2 = {}
  L2_2 = Config
  L2_2 = L2_2.DealershipLocations
  L2_2 = L2_2[A0_2]
  L3_2 = L2_2.societyPurchaseJobWhitelist
  if L3_2 then
    L3_2 = Framework
    L3_2 = L3_2.Client
    L3_2 = L3_2.GetPlayerJob
    L3_2 = L3_2()
    if not L3_2 then
      L4_2 = DebugPrint
      L5_2 = "Framework.Client.GetPlayerJob() returned nil"
      L6_2 = "warning"
      L4_2(L5_2, L6_2)
      L4_2 = false
      return L4_2
    end
    L4_2 = DebugPrint
    L5_2 = "Got player job information"
    L6_2 = "debug"
    L7_2 = L3_2
    L4_2(L5_2, L6_2, L7_2)
    L4_2 = L2_2.societyPurchaseJobWhitelist
    L5_2 = L3_2.name
    L4_2 = L4_2[L5_2]
    if L4_2 then
      L5_2 = IsItemInList
      L6_2 = L4_2
      L7_2 = tonumber
      L8_2 = L3_2.grade
      L7_2 = L7_2(L8_2)
      if not L7_2 then
        L7_2 = 0
      end
      L5_2 = L5_2(L6_2, L7_2)
      if L5_2 then
        L5_2 = Framework
        L5_2 = L5_2.Client
        L5_2 = L5_2.GetSocietyBalance
        L6_2 = L3_2.name
        L7_2 = "job"
        L5_2 = L5_2(L6_2, L7_2)
        L6_2 = #L1_2
        L6_2 = L6_2 + 1
        L7_2 = {}
        L8_2 = L3_2.name
        L7_2.name = L8_2
        L8_2 = L3_2.label
        L7_2.label = L8_2
        L7_2.balance = L5_2
        L7_2.type = "job"
        L1_2[L6_2] = L7_2
      end
    end
  end
  L3_2 = Config
  L3_2 = L3_2.Framework
  if "QBCore" ~= L3_2 then
    L3_2 = Config
    L3_2 = L3_2.Framework
    if "Qbox" ~= L3_2 then
      goto lbl_122
    end
  end
  L3_2 = L2_2.societyPurchaseGangWhitelist
  if L3_2 then
    L3_2 = Framework
    L3_2 = L3_2.Client
    L3_2 = L3_2.GetPlayerGang
    L3_2 = L3_2()
    if not L3_2 then
      L4_2 = DebugPrint
      L5_2 = "Framework.Client.GetPlayerGang() returned nil"
      L6_2 = "warning"
      L4_2(L5_2, L6_2)
      L4_2 = false
      return L4_2
    end
    L4_2 = DebugPrint
    L5_2 = "Got player gang information"
    L6_2 = "debug"
    L7_2 = L3_2
    L4_2(L5_2, L6_2, L7_2)
    L4_2 = L2_2.societyPurchaseGangWhitelist
    L5_2 = L3_2.name
    L4_2 = L4_2[L5_2]
    if L4_2 then
      L5_2 = IsItemInList
      L6_2 = L4_2
      L7_2 = tonumber
      L8_2 = L3_2.grade
      L7_2 = L7_2(L8_2)
      if not L7_2 then
        L7_2 = 0
      end
      L5_2 = L5_2(L6_2, L7_2)
      if L5_2 then
        L5_2 = Framework
        L5_2 = L5_2.Client
        L5_2 = L5_2.GetSocietyBalance
        L6_2 = L3_2.name
        L7_2 = "gang"
        L5_2 = L5_2(L6_2, L7_2)
        L6_2 = #L1_2
        L6_2 = L6_2 + 1
        L7_2 = {}
        L8_2 = L3_2.name
        L7_2.name = L8_2
        L8_2 = L3_2.label
        L7_2.label = L8_2
        L7_2.balance = L5_2
        L7_2.type = "gang"
        L1_2[L6_2] = L7_2
      end
    end
  end
  ::lbl_122::
  return L1_2
end
L6_1 = RegisterNetEvent
L7_1 = "jg-dealerships:client:open-showroom"
function L8_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L3_2 = Globals
  L3_2 = L3_2.CurrentDealership
  if not L3_2 then
    L3_2 = Globals
    L3_2 = L3_2.IsTestDriving
    if not L3_2 then
      goto lbl_10
    end
  end
  do return end
  ::lbl_10::
  L3_2 = Globals
  L3_2.CurrentDealership = A0_2
  L3_2 = cache
  L3_2 = L3_2.ped
  L4_2 = GetEntityCoords
  L5_2 = L3_2
  L4_2 = L4_2(L5_2)
  L5_2 = IsPedInAnyVehicle
  L6_2 = L3_2
  L7_2 = true
  L5_2 = L5_2(L6_2, L7_2)
  if L5_2 then
    L5_2 = Globals
    L5_2.CurrentDealership = nil
    L5_2 = Framework
    L5_2 = L5_2.Client
    L5_2 = L5_2.Notify
    L6_2 = Locale
    L6_2 = L6_2.errorExitVehicle
    L7_2 = "error"
    return L5_2(L6_2, L7_2)
  end
  L5_2 = ShowroomPreCheck
  L6_2 = A0_2
  L5_2 = L5_2(L6_2)
  if not L5_2 then
    L5_2 = DebugPrint
    L6_2 = "jg-dealerships:client:showroom-pre-check failed"
    L7_2 = "debug"
    L5_2(L6_2, L7_2)
    L5_2 = Globals
    L5_2.CurrentDealership = nil
    return
  end
  L5_2 = Config
  L5_2 = L5_2.DealershipLocations
  L5_2 = L5_2[A0_2]
  L6_2 = L5_2.camera
  if L6_2 then
    L6_2 = L5_2.camera
    L6_2 = L6_2.coords
    if L6_2 then
      L6_2 = L5_2.camera
      L6_2 = L6_2.coords
      if "" ~= L6_2 then
        goto lbl_76
      end
    end
  end
  L6_2 = Globals
  L6_2.CurrentDealership = nil
  L6_2 = DebugPrint
  L7_2 = "You are missing camera coords in your config.lua for "
  L8_2 = A0_2
  L7_2 = L7_2 .. L8_2
  L8_2 = "warning"
  L6_2(L7_2, L8_2)
  L6_2 = Framework
  L6_2 = L6_2.Client
  L6_2 = L6_2.Notify
  L7_2 = "You are missing camera coords in your config.lua for "
  L8_2 = A0_2
  L7_2 = L7_2 .. L8_2
  L8_2 = "error"
  L6_2(L7_2, L8_2)
  do return end
  ::lbl_76::
  L6_2 = CreateThread
  function L7_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3
    L0_3 = DoScreenFadeOut
    L1_3 = 500
    L0_3(L1_3)
    L0_3 = Wait
    L1_3 = 500
    L0_3(L1_3)
    L0_3 = lib
    L0_3 = L0_3.callback
    L0_3 = L0_3.await
    L1_3 = "jg-dealerships:server:enter-showroom"
    L2_3 = false
    L3_3 = A0_2
    L4_3 = L5_2
    L5_3 = L4_2
    L0_3 = L0_3(L1_3, L2_3, L3_3, L4_3, L5_3)
    if not L0_3 then
      L1_3 = Globals
      L1_3.CurrentDealership = nil
      L1_3 = DoScreenFadeIn
      L2_3 = 0
      return L1_3(L2_3)
    end
    L1_3 = {}
    L2_3 = ipairs
    L3_3 = L0_3.vehicles
    L2_3, L3_3, L4_3, L5_3 = L2_3(L3_3)
    for L6_3, L7_3 in L2_3, L3_3, L4_3, L5_3 do
      L8_3 = #L1_3
      L8_3 = L8_3 + 1
      L9_3 = {}
      L10_3 = L7_3.id
      L9_3.id = L10_3
      L10_3 = L7_3.spawn_code
      L9_3.spawn_code = L10_3
      L10_3 = L7_3.brand
      L9_3.brand = L10_3
      L10_3 = L7_3.model
      L9_3.model = L10_3
      L10_3 = L7_3.price
      L9_3.price = L10_3
      L10_3 = L7_3.stock
      L9_3.stock = L10_3
      L10_3 = L7_3.category
      L9_3.category = L10_3
      L1_3[L8_3] = L9_3
    end
    L2_3 = L5_2.camera
    L2_3 = L2_3.coords
    L3_3 = L5_2.camera
    L3_3 = L3_3.positions
    L4_3 = L5_1
    L5_3 = A0_2
    L4_3 = L4_3(L5_3)
    L5_3 = lib
    L5_3 = L5_3.waitFor
    function L6_3()
      local L0_4, L1_4
      L0_4 = IsEntityWaitingForWorldCollision
      L1_4 = L3_2
      L0_4 = L0_4(L1_4)
      if not L0_4 then
        L0_4 = HasCollisionLoadedAroundEntity
        L1_4 = L3_2
        L0_4 = L0_4(L1_4)
        if L0_4 then
          L0_4 = true
          if L0_4 then
            goto lbl_15
          end
        end
      end
      L0_4 = nil
      ::lbl_15::
      return L0_4
    end
    L7_3 = nil
    L8_3 = 5000
    L5_3(L6_3, L7_3, L8_3)
    L5_3 = math
    L5_3 = L5_3.rad
    L6_3 = L2_3.w
    L5_3 = L5_3(L6_3)
    L6_3 = L3_3[1]
    L7_3 = math
    L7_3 = L7_3.sin
    L8_3 = L5_3
    L7_3 = L7_3(L8_3)
    L6_3 = L6_3 * L7_3
    L7_3 = L3_3[1]
    L8_3 = math
    L8_3 = L8_3.cos
    L9_3 = L5_3
    L8_3 = L8_3(L9_3)
    L7_3 = L7_3 * L8_3
    L8_3 = L2_3.w
    L8_3 = L8_3 + 215.0
    L2_1 = L8_3
    L8_3 = CreateCamWithParams
    L9_3 = "DEFAULT_SCRIPTED_CAMERA"
    L10_3 = L2_3.x
    L10_3 = L10_3 + L6_3
    L11_3 = L2_3.y
    L11_3 = L11_3 - L7_3
    L12_3 = L2_3.z
    L12_3 = L12_3 + 1.5
    L13_3 = 0.0
    L14_3 = 0.0
    L15_3 = L2_3.w
    L16_3 = 0.0
    L17_3 = false
    L18_3 = 0
    L8_3 = L8_3(L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3)
    L0_1 = L8_3
    L8_3 = SetCamActive
    L9_3 = L0_1
    L10_3 = true
    L8_3(L9_3, L10_3)
    L8_3 = SetCamFov
    L9_3 = L0_1
    L10_3 = 60.0
    L8_3(L9_3, L10_3)
    L8_3 = RenderScriptCams
    L9_3 = true
    L10_3 = true
    L11_3 = 1
    L12_3 = true
    L13_3 = true
    L8_3(L9_3, L10_3, L11_3, L12_3, L13_3)
    L8_3 = SetEntityVisible
    L9_3 = L3_2
    L10_3 = false
    L11_3 = false
    L8_3(L9_3, L10_3, L11_3)
    L8_3 = Framework
    L8_3 = L8_3.Client
    L8_3 = L8_3.ToggleHud
    L9_3 = false
    L8_3(L9_3)
    L8_3 = DoScreenFadeIn
    L9_3 = 500
    L8_3(L9_3)
    L8_3 = SetNuiFocus
    L9_3 = true
    L10_3 = true
    L8_3(L9_3, L10_3)
    L8_3 = SendNUIMessage
    L9_3 = {}
    L9_3.type = "showShowroom"
    L10_3 = L5_2.type
    L9_3.shopType = L10_3
    L9_3.vehicles = L1_3
    L10_3 = A1_2
    L9_3.defaultVehicle = L10_3
    L10_3 = A2_2
    L9_3.defaultColor = L10_3
    L10_3 = L5_2.categories
    L9_3.categories = L10_3
    L10_3 = A0_2
    L9_3.dealershipId = L10_3
    L10_3 = GetPlayerBalances
    L11_3 = A0_2
    L10_3 = L10_3(L11_3)
    L9_3.playerBalances = L10_3
    L9_3.societies = L4_3
    L10_3 = GetResourceState
    L11_3 = "jg-advancedgarages"
    L10_3 = L10_3(L11_3)
    L10_3 = "started" == L10_3
    L9_3.jgGaragesRunning = L10_3
    L10_3 = L5_2.disableShowroomPurchase
    L10_3 = not L10_3
    L9_3.enablePurchase = L10_3
    L10_3 = L5_2.enableTestDrive
    L9_3.enableTestDrive = L10_3
    L10_3 = L5_2.enableFinance
    if L10_3 then
      L10_3 = L0_3.financeAllowed
    end
    L9_3.financeEnabled = L10_3
    L10_3 = Locale
    L9_3.locale = L10_3
    L10_3 = Config
    L9_3.config = L10_3
    L8_3(L9_3)
  end
  L6_2(L7_2)
end
L6_1(L7_1, L8_1)
function L6_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L0_2 = Globals
  L0_2 = L0_2.CurrentDealership
  if not L0_2 then
    return
  end
  L0_2 = lib
  L0_2 = L0_2.callback
  L0_2 = L0_2.await
  L1_2 = "jg-dealerships:server:exit-showroom"
  L2_2 = false
  L3_2 = Globals
  L3_2 = L3_2.CurrentDealership
  L0_2 = L0_2(L1_2, L2_2, L3_2)
  if not L0_2 then
    L1_2 = DebugPrint
    L2_2 = "jg-dealerships:server:exit-showroom failed"
    L3_2 = "warning"
    L1_2(L2_2, L3_2)
    return
  end
  L1_2 = SetEntityVisible
  L2_2 = cache
  L2_2 = L2_2.ped
  L3_2 = true
  L4_2 = false
  L1_2(L2_2, L3_2, L4_2)
  L1_2 = Framework
  L1_2 = L1_2.Client
  L1_2 = L1_2.ToggleHud
  L2_2 = true
  L1_2(L2_2)
  L1_2 = L1_1
  if L1_2 then
    L1_2 = DeleteEntity
    L2_2 = L1_1
    L1_2(L2_2)
    L1_2 = nil
    L1_1 = L1_2
  end
  L1_2 = L0_1
  if L1_2 then
    L1_2 = IsCamActive
    L2_2 = L0_1
    L1_2 = L1_2(L2_2)
    if L1_2 then
      L1_2 = RenderScriptCams
      L2_2 = false
      L3_2 = false
      L4_2 = 0
      L5_2 = true
      L6_2 = false
      L1_2(L2_2, L3_2, L4_2, L5_2, L6_2)
      L1_2 = DestroyCam
      L2_2 = L0_1
      L3_2 = true
      L1_2(L2_2, L3_2)
    end
  end
  L1_2 = nil
  L0_1 = L1_2
  L1_2 = 120.0
  L2_1 = L1_2
  L1_2 = 1
  L3_1 = L1_2
  L1_2 = Globals
  L1_2.CurrentDealership = nil
end
ExitShowroom = L6_1
L6_1 = RegisterNUICallback
L7_1 = "change-color"
function L8_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = L1_1
  if L2_2 then
    L2_2 = A0_2.color
    L3_1 = L2_2
    L2_2 = SetVehicleColour
    L3_2 = L1_1
    L4_2 = A0_2.color
    L2_2(L3_2, L4_2)
  end
  L2_2 = A1_2
  L3_2 = true
  L2_2(L3_2)
end
L6_1(L7_1, L8_1)
L6_1 = RegisterNUICallback
L7_1 = "switch-vehicle"
function L8_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = Globals
  L2_2 = L2_2.CurrentDealership
  if L2_2 then
    L2_2 = L0_1
    if L2_2 then
      goto lbl_14
    end
  end
  L2_2 = A1_2
  L3_2 = {}
  L3_2.error = true
  do return L2_2(L3_2) end
  ::lbl_14::
  L2_2 = L4_1
  if L2_2 then
    L2_2 = A1_2
    L3_2 = {}
    L3_2.error = true
    return L2_2(L3_2)
  end
  L2_2 = Config
  L2_2 = L2_2.DealershipLocations
  L3_2 = Globals
  L3_2 = L3_2.CurrentDealership
  L2_2 = L2_2[L3_2]
  L3_2 = CreateThread
  function L4_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3
    L0_3 = true
    L4_1 = L0_3
    L0_3 = L2_2.camera
    L0_3 = L0_3.coords
    L1_3 = A0_2.spawnCode
    L2_3 = L1_1
    if L2_3 then
      L2_3 = DeleteEntity
      L3_3 = L1_1
      L2_3(L3_3)
    end
    L2_3 = ConvertModelToHash
    L3_3 = L1_3
    L2_3 = L2_3(L3_3)
    L1_3 = L2_3
    L2_3 = IsModelValid
    L3_3 = L1_3
    L2_3 = L2_3(L3_3)
    if not L2_3 then
      L2_3 = DebugPrint
      L3_3 = "Vehicle does not exist. Please contact an admin! Vehicle: "
      L4_3 = L1_3
      L5_3 = " returned false with IsModelValid"
      L3_3 = L3_3 .. L4_3 .. L5_3
      L4_3 = "warning"
      L2_3(L3_3, L4_3)
      L2_3 = Framework
      L2_3 = L2_3.Client
      L2_3 = L2_3.Notify
      L3_3 = "Vehicle does not exist. Please contact an admin!"
      L4_3 = "error"
      L2_3(L3_3, L4_3)
      L2_3 = false
      L4_1 = L2_3
      L2_3 = A1_2
      L3_3 = {}
      L3_3.error = true
      return L2_3(L3_3)
    end
    L2_3 = lib
    L2_3 = L2_3.requestModel
    L3_3 = L1_3
    L4_3 = 60000
    L2_3(L3_3, L4_3)
    L2_3 = CreateVehicle
    L3_3 = L1_3
    L4_3 = L0_3.x
    L5_3 = L0_3.y
    L6_3 = L0_3.z
    L7_3 = L2_1
    L8_3 = false
    L9_3 = false
    L2_3 = L2_3(L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3)
    L1_1 = L2_3
    L2_3 = SetModelAsNoLongerNeeded
    L3_3 = L1_3
    L2_3(L3_3)
    L2_3 = SetEntityHeading
    L3_3 = L1_1
    L4_3 = L2_1
    L2_3(L3_3, L4_3)
    L2_3 = FreezeEntityPosition
    L3_3 = L1_1
    L4_3 = true
    L2_3(L3_3, L4_3)
    L2_3 = SetEntityCollision
    L3_3 = L1_1
    L4_3 = false
    L5_3 = true
    L2_3(L3_3, L4_3, L5_3)
    L2_3 = SetVehicleColour
    L3_3 = L1_1
    L4_3 = L3_1
    L2_3(L3_3, L4_3)
    L2_3 = GetEntityCoords
    L3_3 = L1_1
    L2_3 = L2_3(L3_3)
    L3_3 = PointCamAtCoord
    L4_3 = L0_1
    L5_3 = L2_3.x
    L6_3 = L2_3.y
    L7_3 = L2_3.z
    L3_3(L4_3, L5_3, L6_3, L7_3)
    L3_3 = RenderScriptCams
    L4_3 = true
    L5_3 = true
    L6_3 = 1
    L7_3 = true
    L8_3 = true
    L3_3(L4_3, L5_3, L6_3, L7_3, L8_3)
    L3_3 = false
    L4_1 = L3_3
    L3_3 = A1_2
    L4_3 = true
    L3_3(L4_3)
  end
  L3_2(L4_2)
end
L6_1(L7_1, L8_1)
L6_1 = RegisterNUICallback
L7_1 = "exit-showroom"
function L8_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = DoScreenFadeOut
  L3_2 = 500
  L2_2(L3_2)
  L2_2 = Wait
  L3_2 = 500
  L2_2(L3_2)
  L2_2 = ExitShowroom
  L2_2()
  L2_2 = DoScreenFadeIn
  L3_2 = 500
  L2_2(L3_2)
  L2_2 = A1_2
  L3_2 = true
  L2_2(L3_2)
end
L6_1(L7_1, L8_1)
L6_1 = RegisterNUICallback
L7_1 = "veh-left"
function L8_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = L1_1
  if not L2_2 then
    L2_2 = A1_2
    L3_2 = false
    return L2_2(L3_2)
  end
  L2_2 = GetEntityHeading
  L3_2 = L1_1
  L2_2 = L2_2(L3_2)
  L2_2 = L2_2 - 10
  L2_1 = L2_2
  L2_2 = SetEntityHeading
  L3_2 = L1_1
  L4_2 = L2_1
  L2_2(L3_2, L4_2)
  L2_2 = A1_2
  L3_2 = true
  L2_2(L3_2)
end
L6_1(L7_1, L8_1)
L6_1 = RegisterNUICallback
L7_1 = "veh-right"
function L8_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = L1_1
  if not L2_2 then
    L2_2 = A1_2
    L3_2 = false
    return L2_2(L3_2)
  end
  L2_2 = GetEntityHeading
  L3_2 = L1_1
  L2_2 = L2_2(L3_2)
  L2_2 = L2_2 + 10
  L2_1 = L2_2
  L2_2 = SetEntityHeading
  L3_2 = L1_1
  L4_2 = L2_1
  L2_2(L3_2, L4_2)
  L2_2 = A1_2
  L3_2 = true
  L2_2(L3_2)
end
L6_1(L7_1, L8_1)
L6_1 = 1
L7_1 = RegisterNUICallback
L8_1 = "change-cam-view"
function L9_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L2_2 = Globals
  L2_2 = L2_2.CurrentDealership
  if L2_2 then
    L2_2 = L0_1
    if L2_2 then
      goto lbl_12
    end
  end
  L2_2 = A1_2
  L3_2 = false
  do return L2_2(L3_2) end
  ::lbl_12::
  L2_2 = Config
  L2_2 = L2_2.DealershipLocations
  L3_2 = Globals
  L3_2 = L3_2.CurrentDealership
  L2_2 = L2_2[L3_2]
  L3_2 = L2_2.camera
  L3_2 = L3_2.positions
  L4_2 = L2_2.camera
  L4_2 = L4_2.coords
  L5_2 = L6_1
  L5_2 = L5_2 + 1
  L6_1 = L5_2
  L5_2 = L6_1
  if L5_2 > 4 then
    L5_2 = 1
    L6_1 = L5_2
  end
  L5_2 = L6_1
  L5_2 = L3_2[L5_2]
  L6_2 = math
  L6_2 = L6_2.rad
  L7_2 = L4_2.w
  L6_2 = L6_2(L7_2)
  L7_2 = math
  L7_2 = L7_2.sin
  L8_2 = L6_2
  L7_2 = L7_2(L8_2)
  L7_2 = L5_2 * L7_2
  L8_2 = math
  L8_2 = L8_2.cos
  L9_2 = L6_2
  L8_2 = L8_2(L9_2)
  L8_2 = L5_2 * L8_2
  L9_2 = SetCamCoord
  L10_2 = L0_1
  L11_2 = L4_2.x
  L11_2 = L11_2 + L7_2
  L12_2 = L4_2.y
  L12_2 = L12_2 - L8_2
  L13_2 = L4_2.z
  L14_2 = L6_1
  L14_2 = L3_2[L14_2]
  L14_2 = L14_2 / 10
  L14_2 = 1 + L14_2
  L13_2 = L13_2 + L14_2
  L9_2(L10_2, L11_2, L12_2, L13_2)
  L9_2 = A1_2
  L10_2 = true
  L9_2(L10_2)
end
L7_1(L8_1, L9_1)
L7_1 = RegisterNUICallback
L8_1 = "get-model-stats"
function L9_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = Config
  L2_2 = L2_2.HideVehicleStats
  if L2_2 then
    L2_2 = A1_2
    L3_2 = {}
    return L2_2(L3_2)
  end
  L2_2 = A1_2
  L3_2 = Framework
  L3_2 = L3_2.Client
  L3_2 = L3_2.GetVehicleStats
  L4_2 = A0_2.vehicle
  L3_2, L4_2 = L3_2(L4_2)
  L2_2(L3_2, L4_2)
end
L7_1(L8_1, L9_1)
L7_1 = AddEventHandler
L8_1 = "onResourceStop"
function L9_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L1_2 = GetCurrentResourceName
  L1_2 = L1_2()
  if L1_2 == A0_2 then
    L1_2 = Globals
    L1_2 = L1_2.CurrentDealership
    if L1_2 then
      L1_2 = Config
      L1_2 = L1_2.DealershipLocations
      L2_2 = Globals
      L2_2 = L2_2.CurrentDealership
      L1_2 = L1_2[L2_2]
      L2_2 = TriggerServerEvent
      L3_2 = "jg-dealerships:server:exit-bucket"
      L2_2(L3_2)
      L2_2 = SetEntityVisible
      L3_2 = cache
      L3_2 = L3_2.ped
      L4_2 = true
      L5_2 = false
      L2_2(L3_2, L4_2, L5_2)
      L2_2 = SetEntityCoords
      L3_2 = cache
      L3_2 = L3_2.ped
      L4_2 = L1_2.openShowroom
      L4_2 = L4_2.coords
      L4_2 = L4_2.x
      L5_2 = L1_2.openShowroom
      L5_2 = L5_2.coords
      L5_2 = L5_2.y
      L6_2 = L1_2.openShowroom
      L6_2 = L6_2.coords
      L6_2 = L6_2.z
      L7_2 = false
      L8_2 = false
      L9_2 = false
      L10_2 = false
      L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
      L2_2 = FreezeEntityPosition
      L3_2 = cache
      L3_2 = L3_2.ped
      L4_2 = false
      L2_2(L3_2, L4_2)
      L2_2 = L1_1
      if L2_2 then
        L2_2 = DeleteEntity
        L3_2 = L1_1
        L2_2(L3_2)
      end
      L2_2 = Framework
      L2_2 = L2_2.Client
      L2_2 = L2_2.ToggleHud
      L3_2 = true
      L2_2(L3_2)
    end
  end
end
L7_1(L8_1, L9_1)
