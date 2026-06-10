local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1
L0_1 = {}
L1_1 = {}
L2_1 = true
L3_1 = false
L4_1 = false
L5_1 = {}
L6_1 = 30
L7_1 = 31
L8_1 = 44
L9_1 = 22
L10_1 = 200
L5_1[1] = L6_1
L5_1[2] = L7_1
L5_1[3] = L8_1
L5_1[4] = L9_1
L5_1[5] = L10_1
function L6_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2, L36_2
  L1_2 = GetEntityCoords
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  L2_2 = GetEntityRotation
  L3_2 = A0_2
  L4_2 = 2
  L2_2 = L2_2(L3_2, L4_2)
  L3_2 = math
  L3_2 = L3_2.rad
  L4_2 = L2_2.z
  L3_2 = L3_2(L4_2)
  L4_2 = GetModelDimensions
  L5_2 = GetEntityModel
  L6_2 = A0_2
  L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2, L36_2 = L5_2(L6_2)
  L4_2, L5_2 = L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2, L36_2)
  L6_2 = L5_2.x
  L7_2 = L4_2.x
  L6_2 = L6_2 - L7_2
  L7_2 = L5_2.y
  L8_2 = L4_2.y
  L7_2 = L7_2 - L8_2
  L8_2 = L5_2.z
  L9_2 = L4_2.z
  L8_2 = L8_2 - L9_2
  L8_2 = L8_2 / 2
  L9_2 = {}
  L10_2 = {}
  L11_2 = L6_2 / 2
  L12_2 = 0
  L10_2[1] = L11_2
  L10_2[2] = L12_2
  L11_2 = {}
  L12_2 = 0
  L13_2 = L7_2 / 2
  L11_2[1] = L12_2
  L11_2[2] = L13_2
  L12_2 = {}
  L13_2 = L6_2 / 2
  L13_2 = -L13_2
  L14_2 = 0
  L12_2[1] = L13_2
  L12_2[2] = L14_2
  L13_2 = {}
  L14_2 = 0
  L15_2 = L7_2 / 2
  L15_2 = -L15_2
  L13_2[1] = L14_2
  L13_2[2] = L15_2
  L9_2[1] = L10_2
  L9_2[2] = L11_2
  L9_2[3] = L12_2
  L9_2[4] = L13_2
  L10_2 = ipairs
  L11_2 = L9_2
  L10_2, L11_2, L12_2, L13_2 = L10_2(L11_2)
  for L14_2, L15_2 in L10_2, L11_2, L12_2, L13_2 do
    L16_2 = L15_2[1]
    L17_2 = math
    L17_2 = L17_2.cos
    L18_2 = L3_2
    L17_2 = L17_2(L18_2)
    L16_2 = L16_2 * L17_2
    L17_2 = L15_2[2]
    L18_2 = math
    L18_2 = L18_2.sin
    L19_2 = L3_2
    L18_2 = L18_2(L19_2)
    L17_2 = L17_2 * L18_2
    L16_2 = L16_2 - L17_2
    L17_2 = L15_2[1]
    L18_2 = math
    L18_2 = L18_2.sin
    L19_2 = L3_2
    L18_2 = L18_2(L19_2)
    L17_2 = L17_2 * L18_2
    L18_2 = L15_2[2]
    L19_2 = math
    L19_2 = L19_2.cos
    L20_2 = L3_2
    L19_2 = L19_2(L20_2)
    L18_2 = L18_2 * L19_2
    L17_2 = L17_2 + L18_2
    L18_2 = vector3
    L19_2 = L1_2.x
    L20_2 = L1_2.y
    L21_2 = L1_2.z
    L21_2 = L21_2 + L8_2
    L18_2 = L18_2(L19_2, L20_2, L21_2)
    L19_2 = vector3
    L20_2 = L1_2.x
    L20_2 = L20_2 + L16_2
    L21_2 = L1_2.y
    L21_2 = L21_2 + L17_2
    L22_2 = L1_2.z
    L22_2 = L22_2 + L8_2
    L19_2 = L19_2(L20_2, L21_2, L22_2)
    L20_2 = StartShapeTestRay
    L21_2 = L18_2.x
    L22_2 = L18_2.y
    L23_2 = L18_2.z
    L24_2 = L19_2.x
    L25_2 = L19_2.y
    L26_2 = L19_2.z
    L27_2 = -1
    L28_2 = A0_2
    L29_2 = 0
    L20_2 = L20_2(L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2)
    L21_2 = GetShapeTestResult
    L22_2 = L20_2
    L21_2, L22_2, L23_2, L24_2, L25_2 = L21_2(L22_2)
    L26_2 = Config
    L26_2 = L26_2.Debug
    if L26_2 then
      L26_2 = DrawLine
      L27_2 = L18_2.x
      L28_2 = L18_2.y
      L29_2 = L18_2.z
      L30_2 = L19_2.x
      L31_2 = L19_2.y
      L32_2 = L19_2.z
      L33_2 = 255
      L34_2 = 0
      L35_2 = 0
      L36_2 = 255
      L26_2(L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2, L36_2)
    end
    if 1 == L22_2 then
      L26_2 = cache
      L26_2 = L26_2.ped
      if L25_2 ~= L26_2 then
        L26_2 = true
        return L26_2
      end
    end
  end
  L10_2 = false
  return L10_2
end
function L7_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L2_2 = GetEntityRotation
  L3_2 = A0_2
  L4_2 = 2
  L2_2 = L2_2(L3_2, L4_2)
  L3_2 = L2_2.z
  L3_2 = L3_2 + A1_2
  L4_2 = SetEntityRotation
  L5_2 = A0_2
  L6_2 = L2_2.x
  L7_2 = L2_2.y
  L8_2 = L3_2
  L9_2 = 2
  L10_2 = true
  L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
end
function L8_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = math
  L1_2 = L1_2.rad
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  L2_2 = vector3
  L3_2 = math
  L3_2 = L3_2.sin
  L4_2 = L1_2
  L3_2 = L3_2(L4_2)
  L3_2 = -L3_2
  L4_2 = math
  L4_2 = L4_2.cos
  L5_2 = L1_2
  L4_2 = L4_2(L5_2)
  L5_2 = 0
  return L2_2(L3_2, L4_2, L5_2)
end
function L9_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L3_2 = GetEntityCoords
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  L4_2 = GetEntityCoords
  L5_2 = cache
  L5_2 = L5_2.ped
  L4_2 = L4_2(L5_2)
  L5_2 = GetEntityHeading
  L6_2 = A0_2
  L5_2 = L5_2(L6_2)
  L6_2 = L8_1
  L7_2 = L5_2
  L6_2 = L6_2(L7_2)
  L7_2 = nil
  if "forward" == A1_2 then
    L8_2 = L6_2 * A2_2
    L7_2 = L3_2 + L8_2
  elseif "backward" == A1_2 then
    L8_2 = L6_2 * A2_2
    L7_2 = L3_2 - L8_2
  elseif "left" == A1_2 then
    L8_2 = vector3
    L9_2 = L6_2.y
    L9_2 = -L9_2
    L10_2 = L6_2.x
    L11_2 = 0
    L8_2 = L8_2(L9_2, L10_2, L11_2)
    L9_2 = L8_2 * A2_2
    L7_2 = L3_2 + L9_2
  elseif "right" == A1_2 then
    L8_2 = vector3
    L9_2 = L6_2.y
    L10_2 = L6_2.x
    L10_2 = -L10_2
    L11_2 = 0
    L8_2 = L8_2(L9_2, L10_2, L11_2)
    L9_2 = L8_2 * A2_2
    L7_2 = L3_2 + L9_2
  end
  L8_2 = L4_2 - L7_2
  L8_2 = #L8_2
  if L8_2 <= 10.0 then
    L8_2 = SetEntityCoordsNoOffset
    L9_2 = A0_2
    L10_2 = L7_2.x
    L11_2 = L7_2.y
    L12_2 = L7_2.z
    L13_2 = false
    L14_2 = false
    L15_2 = false
    L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
  end
end
function L10_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2
  L5_2 = lib
  L5_2 = L5_2.points
  L5_2 = L5_2.new
  L6_2 = {}
  L6_2.coords = A0_2
  L6_2.distance = A1_2
  L5_2 = L5_2(L6_2)
  function L6_2(A0_3)
    local L1_3
    L1_3 = A2_2
    L1_3()
  end
  L5_2.onEnter = L6_2
  function L6_2(A0_3)
    local L1_3
    L1_3 = A3_2
    L1_3()
  end
  L5_2.onExit = L6_2
  if A4_2 then
    function L6_2(A0_3)
      local L1_3
      L1_3 = A4_2
      L1_3()
    end
    L5_2.nearby = L6_2
  end
  return L5_2
end
function L11_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L1_2 = L0_1
  L1_2 = L1_2[A0_2]
  if L1_2 then
    L1_2 = L0_1
    L1_2 = L1_2[A0_2]
    L1_2 = #L1_2
    if L1_2 > 0 then
      L1_2 = ipairs
      L2_2 = L0_1
      L2_2 = L2_2[A0_2]
      L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
      for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
        L8_2 = L6_2
        L7_2 = L6_2.remove
        L7_2(L8_2)
      end
    end
  end
  L1_2 = json
  L1_2 = L1_2.decode
  L2_2 = LocalPlayer
  L2_2 = L2_2.state
  L3_2 = "displayVehicles:%s"
  L3_2 = L3_2.format
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  L2_2 = L2_2[L3_2]
  if not L2_2 then
    L2_2 = "{}"
  end
  L1_2 = L1_2(L2_2)
  if L1_2 then
    L2_2 = #L1_2
    if L2_2 > 0 then
      L2_2 = ipairs
      L3_2 = L1_2
      L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
      for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
        L8_2 = DeleteEntity
        L9_2 = L7_2.entity
        L8_2(L9_2)
      end
    end
  end
end
function L12_1(A0_2)
  local L1_2, L2_2
  L1_2 = L1_1
  L1_2 = L1_2[A0_2]
  if L1_2 then
    return
  end
  L1_2 = L1_1
  L1_2[A0_2] = true
  L1_2 = CreateThread
  function L2_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3
    L0_3 = L11_1
    L1_3 = A0_2
    L0_3(L1_3)
    L0_3 = lib
    L0_3 = L0_3.callback
    L0_3 = L0_3.await
    L1_3 = "jg-dealerships:server:get-display-vehicles"
    L2_3 = false
    L3_3 = A0_2
    L0_3 = L0_3(L1_3, L2_3, L3_3)
    if not L0_3 then
      L2_3 = A0_2
      L1_3 = L1_1
      L1_3[L2_3] = false
      return
    end
    L1_3 = {}
    L2_3 = L0_3.isManager
    L3_3 = L0_3.vehicles
    L4_3 = Config
    L4_3 = L4_3.DealershipLocations
    L5_3 = A0_2
    L4_3 = L4_3[L5_3]
    L5_3 = ipairs
    L6_3 = L3_3
    L5_3, L6_3, L7_3, L8_3 = L5_3(L6_3)
    for L9_3, L10_3 in L5_3, L6_3, L7_3, L8_3 do
      L11_3 = L10_3.vehicle
      L12_3 = json
      L12_3 = L12_3.decode
      L13_3 = L10_3.coords
      L12_3 = L12_3(L13_3)
      L13_3 = ConvertModelToHash
      L14_3 = L11_3
      L13_3 = L13_3(L14_3)
      L11_3 = L13_3
      L13_3 = lib
      L13_3 = L13_3.requestModel
      L14_3 = L11_3
      L15_3 = 60000
      L13_3(L14_3, L15_3)
      L13_3 = CreateVehicle
      L14_3 = L11_3
      L15_3 = L12_3.x
      L16_3 = L12_3.y
      L17_3 = L12_3.z
      L18_3 = L12_3.w
      L19_3 = false
      L20_3 = false
      L13_3 = L13_3(L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3)
      L14_3 = SetEntityHeading
      L15_3 = L13_3
      L16_3 = L12_3.w
      L14_3(L15_3, L16_3)
      L14_3 = SetVehicleColour
      L15_3 = L13_3
      L16_3 = L10_3.color
      L14_3(L15_3, L16_3)
      L14_3 = SetVehicleDoorsLocked
      L15_3 = L13_3
      L16_3 = 2
      L14_3(L15_3, L16_3)
      L14_3 = SetVehicleNumberPlateText
      L15_3 = L13_3
      L16_3 = Config
      L16_3 = L16_3.DisplayVehiclesPlate
      L14_3(L15_3, L16_3)
      L14_3 = SetEntityInvincible
      L15_3 = L13_3
      L16_3 = true
      L14_3(L15_3, L16_3)
      L14_3 = SetModelAsNoLongerNeeded
      L15_3 = L11_3
      L14_3(L15_3)
      L14_3 = lib
      L14_3 = L14_3.waitFor
      function L15_3()
        local L0_4, L1_4
        L0_4 = DoesEntityExist
        L1_4 = L13_3
        L0_4 = L0_4(L1_4)
        if L0_4 then
          L0_4 = true
          if L0_4 then
            goto lbl_10
          end
        end
        L0_4 = nil
        ::lbl_10::
        return L0_4
      end
      L16_3 = nil
      L17_3 = 5000
      L14_3(L15_3, L16_3, L17_3)
      L14_3 = Entity
      L15_3 = L13_3
      L14_3 = L14_3(L15_3)
      L14_3 = L14_3.state
      L15_3 = L14_3
      L14_3 = L14_3.set
      L16_3 = "isDisplayVehicle"
      L17_3 = true
      L18_3 = false
      L14_3(L15_3, L16_3, L17_3, L18_3)
      L14_3 = GetModelDimensions
      L15_3 = GetEntityModel
      L16_3 = L13_3
      L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3 = L15_3(L16_3)
      L14_3, L15_3 = L14_3(L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3)
      L16_3 = L14_3.x
      L17_3 = 0
      L16_3 = L17_3 - L16_3
      L17_3 = L15_3.x
      L16_3 = L16_3 + L17_3
      L16_3 = L16_3 + 1.0
      L17_3 = Config
      L17_3 = L17_3.ViewInShowroomPrompt
      L18_3 = Config
      L18_3 = L18_3.DrawText
      if "auto" == L18_3 then
        L18_3 = GetResourceState
        L19_3 = "jg-textui"
        L18_3 = L18_3(L19_3)
        if "started" == L18_3 then
          goto lbl_120
        end
      end
      L18_3 = Config
      L18_3 = L18_3.DrawText
      ::lbl_120::
      if "jg-textui" == L18_3 then
        L18_3 = "<h4 style='margin-bottom:5px'>"
        L19_3 = L10_3.brand
        if not L19_3 then
          L19_3 = ""
        end
        L20_3 = " "
        L21_3 = L10_3.model
        if not L21_3 then
          L21_3 = ""
        end
        L22_3 = "</h4><p>"
        L23_3 = Config
        L23_3 = L23_3.ViewInShowroomPrompt
        L24_3 = "</p>"
        L18_3 = L18_3 .. L19_3 .. L20_3 .. L21_3 .. L22_3 .. L23_3 .. L24_3
        L17_3 = L18_3
      end
      L18_3 = Config
      L18_3 = L18_3.DisplayVehiclesHidePurchasePrompt
      if not L18_3 then
        L18_3 = IsShowroomAccessAllowed
        L19_3 = A0_2
        L18_3 = L18_3(L19_3)
        if not L18_3 then
          L18_3 = L4_3.type
          if not ("owned" == L18_3 and L2_3) then
            goto lbl_171
          end
        end
        L18_3 = L3_1
        if not L18_3 then
          L18_3 = L0_1
          L18_3 = #L18_3
          L19_3 = L18_3 + 1
          L18_3 = L0_1
          L20_3 = L10_1
          L21_3 = vector4
          L22_3 = L12_3.x
          L23_3 = L12_3.y
          L24_3 = L12_3.z
          L25_3 = L12_3.w
          L21_3 = L21_3(L22_3, L23_3, L24_3, L25_3)
          L22_3 = L16_3
          function L23_3()
            local L0_4, L1_4
            L0_4 = Framework
            L0_4 = L0_4.Client
            L0_4 = L0_4.ShowTextUI
            L1_4 = L17_3
            L0_4(L1_4)
          end
          function L24_3()
            local L0_4, L1_4
            L0_4 = Framework
            L0_4 = L0_4.Client
            L0_4 = L0_4.HideTextUI
            L0_4()
          end
          function L25_3()
            local L0_4, L1_4, L2_4, L3_4, L4_4
            L0_4 = IsControlJustPressed
            L1_4 = 0
            L2_4 = Config
            L2_4 = L2_4.ViewInShowroomKeyBind
            L0_4 = L0_4(L1_4, L2_4)
            if L0_4 then
              L0_4 = L3_1
              if not L0_4 then
                L0_4 = TriggerEvent
                L1_4 = "jg-dealerships:client:open-showroom"
                L2_4 = A0_2
                L3_4 = L10_3.vehicle
                L4_4 = L10_3.color
                L0_4(L1_4, L2_4, L3_4, L4_4)
              end
            end
          end
          L20_3 = L20_3(L21_3, L22_3, L23_3, L24_3, L25_3)
          L18_3[L19_3] = L20_3
        end
      end
      ::lbl_171::
      L18_3 = #L1_3
      L18_3 = L18_3 + 1
      L1_3[L18_3] = L10_3
      L19_3 = L1_3[L18_3]
      L19_3.entity = L13_3
    end
    L5_3 = LocalPlayer
    L5_3 = L5_3.state
    L6_3 = L5_3
    L5_3 = L5_3.set
    L7_3 = "displayVehicles:%s"
    L7_3 = L7_3.format
    L8_3 = A0_2
    L7_3 = L7_3(L8_3)
    L8_3 = json
    L8_3 = L8_3.encode
    L9_3 = L1_3
    L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3 = L8_3(L9_3)
    L5_3(L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3)
    L6_3 = A0_2
    L5_3 = L0_1
    L7_3 = L0_1
    L5_3[L6_3] = L7_3
    L6_3 = A0_2
    L5_3 = L1_1
    L5_3[L6_3] = false
  end
  L1_2(L2_2)
end
function L13_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L0_2 = pairs
  L1_2 = Config
  L1_2 = L1_2.DealershipLocations
  L0_2, L1_2, L2_2, L3_2 = L0_2(L1_2)
  for L4_2 in L0_2, L1_2, L2_2, L3_2 do
    L5_2 = L12_1
    L6_2 = L4_2
    L5_2(L6_2)
  end
end
SpawnAllDealershipDisplayVehicles = L13_1
L13_1 = RegisterNetEvent
L14_1 = "jg-dealerships:client:spawn-display-vehicles"
function L15_1(A0_2)
  local L1_2, L2_2
  L1_2 = L12_1
  L2_2 = A0_2
  L1_2(L2_2)
end
L13_1(L14_1, L15_1)
L13_1 = RegisterNUICallback
L14_1 = "create-display-vehicle"
function L15_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2
  L2_2 = L4_1
  if L2_2 then
    L2_2 = A1_2
    L3_2 = false
    return L2_2(L3_2)
  end
  L2_2 = Framework
  L2_2 = L2_2.Client
  L2_2 = L2_2.HideTextUI
  L2_2()
  L2_2 = true
  L3_1 = L2_2
  L2_2 = A0_2.dealershipId
  L3_2 = A0_2.color
  L4_2 = A0_2.spawnCode
  L5_2 = 44
  L6_2 = 38
  L7_2 = 32
  L8_2 = 33
  L9_2 = 34
  L10_2 = 35
  L11_2 = 73
  L12_2 = 201
  L13_2 = SetNuiFocus
  L14_2 = false
  L15_2 = false
  L13_2(L14_2, L15_2)
  L13_2 = SendNUIMessage
  L14_2 = {}
  L14_2.type = "displayVehicleHud"
  L14_2.vehiclePlaced = false
  L15_2 = Locale
  L14_2.locale = L15_2
  L15_2 = Config
  L14_2.config = L15_2
  L13_2(L14_2)
  while true do
    L13_2 = IsControlJustPressed
    L14_2 = 0
    L15_2 = L12_2
    L13_2 = L13_2(L14_2, L15_2)
    if L13_2 then
      break
    end
    L13_2 = Wait
    L14_2 = 0
    L13_2(L14_2)
  end
  L13_2 = SendNUIMessage
  L14_2 = {}
  L14_2.type = "displayVehicleHud"
  L14_2.vehiclePlaced = true
  L15_2 = Locale
  L14_2.locale = L15_2
  L15_2 = Config
  L14_2.config = L15_2
  L13_2(L14_2)
  L13_2 = true
  L4_1 = L13_2
  L13_2 = lib
  L13_2 = L13_2.requestModel
  L14_2 = L4_2
  L13_2(L14_2)
  L13_2 = GetEntityHeading
  L14_2 = cache
  L14_2 = L14_2.ped
  L13_2 = L13_2(L14_2)
  L14_2 = GetOffsetFromEntityInWorldCoords
  L15_2 = cache
  L15_2 = L15_2.ped
  L16_2 = 0.0
  L17_2 = 3.0
  L18_2 = 0.0
  L14_2 = L14_2(L15_2, L16_2, L17_2, L18_2)
  L15_2 = CreateVehicle
  L16_2 = L4_2
  L17_2 = L14_2.x
  L18_2 = L14_2.y
  L19_2 = L14_2.z
  L19_2 = L19_2 - 1.0
  L20_2 = 0.0
  L21_2 = false
  L22_2 = false
  L15_2 = L15_2(L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
  L16_2 = FreezeEntityPosition
  L17_2 = cache
  L17_2 = L17_2.ped
  L18_2 = true
  L16_2(L17_2, L18_2)
  L16_2 = SetEntityRotation
  L17_2 = L15_2
  L18_2 = 0.0
  L19_2 = 0.0
  L20_2 = L13_2
  L21_2 = 2
  L22_2 = true
  L16_2(L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
  L16_2 = SetEntityAlpha
  L17_2 = L15_2
  L18_2 = 200
  L19_2 = false
  L16_2(L17_2, L18_2, L19_2)
  L16_2 = SetEntityCollision
  L17_2 = L15_2
  L18_2 = false
  L19_2 = false
  L16_2(L17_2, L18_2, L19_2)
  L16_2 = SetVehicleColour
  L17_2 = L15_2
  L18_2 = L3_2
  L16_2(L17_2, L18_2)
  L16_2 = SetEntityCanBeDamaged
  L17_2 = L15_2
  L18_2 = false
  L16_2(L17_2, L18_2)
  L16_2 = FreezeEntityPosition
  L17_2 = L15_2
  L18_2 = true
  L16_2(L17_2, L18_2)
  L16_2 = SetEntityInvincible
  L17_2 = L15_2
  L18_2 = true
  L16_2(L17_2, L18_2)
  L16_2 = SetVehicleGravity
  L17_2 = L15_2
  L18_2 = false
  L16_2(L17_2, L18_2)
  L16_2 = SetEntityDynamic
  L17_2 = L15_2
  L18_2 = false
  L16_2(L17_2, L18_2)
  L16_2 = DisableVehicleWorldCollision
  L17_2 = L15_2
  L16_2(L17_2)
  L16_2 = SetVehicleOnGroundProperly
  L17_2 = L15_2
  L16_2(L17_2)
  L16_2 = SetModelAsNoLongerNeeded
  L17_2 = L4_2
  L16_2(L17_2)
  while true do
    L16_2 = L4_1
    if not L16_2 then
      break
    end
    L16_2 = Wait
    L17_2 = 0
    L16_2(L17_2)
    L16_2 = false
    L17_2 = L2_1
    if L17_2 then
      L17_2 = L6_1
      L18_2 = L15_2
      L17_2 = L17_2(L18_2)
      L16_2 = L17_2
    end
    L17_2 = ipairs
    L18_2 = L5_1
    L17_2, L18_2, L19_2, L20_2 = L17_2(L18_2)
    for L21_2, L22_2 in L17_2, L18_2, L19_2, L20_2 do
      L23_2 = DisableControlAction
      L24_2 = 0
      L25_2 = L22_2
      L26_2 = true
      L23_2(L24_2, L25_2, L26_2)
    end
    if L16_2 then
      L17_2 = SetEntityDrawOutlineColor
      L18_2 = 254
      L19_2 = 77
      L20_2 = 77
      L21_2 = 255
      L17_2(L18_2, L19_2, L20_2, L21_2)
    else
      L17_2 = SetEntityDrawOutlineColor
      L18_2 = 106
      L19_2 = 226
      L20_2 = 119
      L21_2 = 255
      L17_2(L18_2, L19_2, L20_2, L21_2)
    end
    L17_2 = SetEntityDrawOutlineShader
    L18_2 = 1
    L17_2(L18_2)
    L17_2 = SetEntityDrawOutline
    L18_2 = L15_2
    L19_2 = true
    L17_2(L18_2, L19_2)
    L17_2 = IsDisabledControlPressed
    L18_2 = 0
    L19_2 = L5_2
    L17_2 = L17_2(L18_2, L19_2)
    if L17_2 then
      L17_2 = L7_1
      L18_2 = L15_2
      L19_2 = -0.5
      L17_2(L18_2, L19_2)
    else
      L17_2 = IsControlPressed
      L18_2 = 0
      L19_2 = L6_2
      L17_2 = L17_2(L18_2, L19_2)
      if L17_2 then
        L17_2 = L7_1
        L18_2 = L15_2
        L19_2 = 0.5
        L17_2(L18_2, L19_2)
      end
    end
    L17_2 = IsControlPressed
    L18_2 = 0
    L19_2 = L7_2
    L17_2 = L17_2(L18_2, L19_2)
    if L17_2 then
      L17_2 = L9_1
      L18_2 = L15_2
      L19_2 = "forward"
      L20_2 = 0.025
      L17_2(L18_2, L19_2, L20_2)
    else
      L17_2 = IsControlPressed
      L18_2 = 0
      L19_2 = L8_2
      L17_2 = L17_2(L18_2, L19_2)
      if L17_2 then
        L17_2 = L9_1
        L18_2 = L15_2
        L19_2 = "backward"
        L20_2 = 0.025
        L17_2(L18_2, L19_2, L20_2)
      else
        L17_2 = IsControlPressed
        L18_2 = 0
        L19_2 = L9_2
        L17_2 = L17_2(L18_2, L19_2)
        if L17_2 then
          L17_2 = L9_1
          L18_2 = L15_2
          L19_2 = "left"
          L20_2 = 0.025
          L17_2(L18_2, L19_2, L20_2)
        else
          L17_2 = IsControlPressed
          L18_2 = 0
          L19_2 = L10_2
          L17_2 = L17_2(L18_2, L19_2)
          if L17_2 then
            L17_2 = L9_1
            L18_2 = L15_2
            L19_2 = "right"
            L20_2 = 0.025
            L17_2(L18_2, L19_2, L20_2)
          end
        end
      end
    end
    L17_2 = IsControlJustPressed
    L18_2 = 0
    L19_2 = L11_2
    L17_2 = L17_2(L18_2, L19_2)
    if L17_2 then
      L17_2 = DeleteEntity
      L18_2 = L15_2
      L17_2(L18_2)
      L17_2 = false
      L4_1 = L17_2
      L17_2 = FreezeEntityPosition
      L18_2 = cache
      L18_2 = L18_2.ped
      L19_2 = false
      L17_2(L18_2, L19_2)
      L17_2 = SetEntityDrawOutline
      L18_2 = L15_2
      L19_2 = false
      L17_2(L18_2, L19_2)
      L17_2 = SendNUIMessage
      L18_2 = {}
      L18_2.type = "hide"
      L17_2(L18_2)
      L17_2 = ClearPedTasks
      L18_2 = cache
      L18_2 = L18_2.ped
      L17_2(L18_2)
      L17_2 = TriggerEvent
      L18_2 = "jg-dealerships:client:open-management"
      L19_2 = L2_2
      L17_2(L18_2, L19_2)
      L17_2 = A1_2
      L18_2 = true
      return L17_2(L18_2)
    end
    L17_2 = IsDisabledControlJustPressed
    L18_2 = 0
    L19_2 = L12_2
    L17_2 = L17_2(L18_2, L19_2)
    if L17_2 then
      L17_2 = L6_1
      L18_2 = L15_2
      L17_2 = L17_2(L18_2)
      if not L17_2 then
        L17_2 = GetEntityCoords
        L18_2 = L15_2
        L17_2 = L17_2(L18_2)
        L18_2 = vector4
        L19_2 = L17_2.x
        L20_2 = L17_2.y
        L21_2 = L17_2.z
        L22_2 = GetEntityHeading
        L23_2 = L15_2
        L22_2, L23_2, L24_2, L25_2, L26_2 = L22_2(L23_2)
        L18_2 = L18_2(L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2)
        L19_2 = DeleteEntity
        L20_2 = L15_2
        L19_2(L20_2)
        L19_2 = false
        L4_1 = L19_2
        L19_2 = FreezeEntityPosition
        L20_2 = cache
        L20_2 = L20_2.ped
        L21_2 = false
        L19_2(L20_2, L21_2)
        L19_2 = SetEntityDrawOutline
        L20_2 = L15_2
        L21_2 = false
        L19_2(L20_2, L21_2)
        L19_2 = SendNUIMessage
        L20_2 = {}
        L20_2.type = "hide"
        L19_2(L20_2)
        L19_2 = ClearPedTasks
        L20_2 = cache
        L20_2 = L20_2.ped
        L19_2(L20_2)
        L19_2 = lib
        L19_2 = L19_2.callback
        L19_2 = L19_2.await
        L20_2 = "jg-dealerships:server:create-display-vehicle"
        L21_2 = false
        L22_2 = L2_2
        L23_2 = L4_2
        L24_2 = L3_2
        L25_2 = L18_2
        L19_2(L20_2, L21_2, L22_2, L23_2, L24_2, L25_2)
        L19_2 = TriggerEvent
        L20_2 = "jg-dealerships:client:open-management"
        L21_2 = L2_2
        L19_2(L20_2, L21_2)
        L19_2 = false
        L3_1 = L19_2
        L19_2 = A1_2
        L20_2 = true
        return L19_2(L20_2)
    end
    else
      L17_2 = IsDisabledControlJustPressed
      L18_2 = 0
      L19_2 = L12_2
      L17_2 = L17_2(L18_2, L19_2)
      if L17_2 then
        L17_2 = L6_1
        L18_2 = L15_2
        L17_2 = L17_2(L18_2)
        if L17_2 then
          L17_2 = Framework
          L17_2 = L17_2.Client
          L17_2 = L17_2.Notify
          L18_2 = Locale
          L18_2 = L18_2.errorPlacementCollision
          if not L18_2 then
            L18_2 = "You can't place the vehicle here"
          end
          L19_2 = "error"
          L17_2(L18_2, L19_2)
        end
      end
    end
    L17_2 = GetEntityCoords
    L18_2 = L15_2
    L17_2 = L17_2(L18_2)
    L18_2 = SetEntityCoordsNoOffset
    L19_2 = L15_2
    L20_2 = L17_2.x
    L21_2 = L17_2.y
    L22_2 = L17_2.z
    L23_2 = false
    L24_2 = false
    L25_2 = false
    L18_2(L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2)
  end
end
L13_1(L14_1, L15_1)
L13_1 = RegisterNUICallback
L14_1 = "edit-display-vehicle"
function L15_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L2_2 = A0_2.id
  L3_2 = A0_2.dealershipId
  L4_2 = A0_2.spawnCode
  L5_2 = A0_2.color
  L6_2 = lib
  L6_2 = L6_2.callback
  L6_2 = L6_2.await
  L7_2 = "jg-dealerships:server:edit-display-vehicle"
  L8_2 = false
  L9_2 = L3_2
  L10_2 = L2_2
  L11_2 = L4_2
  L12_2 = L5_2
  L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
  L6_2 = A1_2
  L7_2 = true
  L6_2(L7_2)
end
L13_1(L14_1, L15_1)
L13_1 = RegisterNUICallback
L14_1 = "delete-display-vehicle"
function L15_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L2_2 = A0_2.id
  L3_2 = A0_2.dealershipId
  L4_2 = lib
  L4_2 = L4_2.callback
  L4_2 = L4_2.await
  L5_2 = "jg-dealerships:server:delete-display-vehicle"
  L6_2 = false
  L7_2 = L3_2
  L8_2 = L2_2
  L4_2(L5_2, L6_2, L7_2, L8_2)
  L4_2 = A1_2
  L5_2 = true
  L4_2(L5_2)
end
L13_1(L14_1, L15_1)
L13_1 = RegisterNUICallback
L14_1 = "reset-display-vehicles"
function L15_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = A0_2.dealershipId
  L3_2 = L12_1
  L4_2 = L2_2
  L3_2(L4_2)
  L3_2 = A1_2
  L4_2 = true
  L3_2(L4_2)
end
L13_1(L14_1, L15_1)
L13_1 = CreateThread
function L14_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L0_2 = Config
  L0_2 = L0_2.RemoveGeneratorsAroundDealership
  if L0_2 then
    L0_2 = Config
    L0_2 = L0_2.RemoveGeneratorsAroundDealership
    if L0_2 > 0 then
      while true do
        L0_2 = pairs
        L1_2 = Config
        L1_2 = L1_2.DealershipLocations
        L0_2, L1_2, L2_2, L3_2 = L0_2(L1_2)
        for L4_2, L5_2 in L0_2, L1_2, L2_2, L3_2 do
          L6_2 = L5_2.openShowroom
          if L6_2 then
            L6_2 = L6_2.coords
          end
          if not L6_2 then
            L6_2 = L5_2.openShowroom
          end
          L7_2 = Config
          L7_2 = L7_2.RemoveGeneratorsAroundDealership
          if not L7_2 then
            L7_2 = 60.0
          end
          L8_2 = RemoveVehiclesFromGeneratorsInArea
          L9_2 = L6_2.x
          L9_2 = L9_2 - L7_2
          L10_2 = L6_2.y
          L10_2 = L10_2 - L7_2
          L11_2 = L6_2.z
          L11_2 = L11_2 - L7_2
          L12_2 = L6_2.x
          L12_2 = L12_2 + L7_2
          L13_2 = L6_2.y
          L13_2 = L13_2 + L7_2
          L14_2 = L6_2.z
          L14_2 = L14_2 + L7_2
          L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
        end
        L0_2 = Wait
        L1_2 = 5000
        L0_2(L1_2)
      end
    end
  end
end
L13_1(L14_1)
L13_1 = lib
L13_1 = L13_1.onCache
L14_1 = "vehicle"
function L15_1(A0_2)
  local L1_2, L2_2, L3_2
  if A0_2 then
    L1_2 = Entity
    L2_2 = A0_2
    L1_2 = L1_2(L2_2)
    L1_2 = L1_2.state
    L1_2 = L1_2.isDisplayVehicle
    if L1_2 then
      L1_2 = Framework
      L1_2 = L1_2.Client
      L1_2 = L1_2.Notify
      L2_2 = "Vehicle security breach detected"
      L3_2 = "warning"
      L1_2(L2_2, L3_2)
      L1_2 = FreezeEntityPosition
      L2_2 = A0_2
      L3_2 = true
      L1_2(L2_2, L3_2)
      L1_2 = SetVehicleAlarm
      L2_2 = A0_2
      L3_2 = true
      L1_2(L2_2, L3_2)
      L1_2 = StartVehicleAlarm
      L2_2 = A0_2
      L1_2(L2_2)
    end
  end
end
L13_1(L14_1, L15_1)
L13_1 = AddEventHandler
L14_1 = "onResourceStop"
function L15_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = GetCurrentResourceName
  L1_2 = L1_2()
  if L1_2 == A0_2 then
    L1_2 = pairs
    L2_2 = Config
    L2_2 = L2_2.DealershipLocations
    L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
    for L5_2 in L1_2, L2_2, L3_2, L4_2 do
      L6_2 = L11_1
      L7_2 = L5_2
      L6_2(L7_2)
    end
  end
end
L13_1(L14_1, L15_1)
