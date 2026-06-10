           

local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = nil
  L2_2 = GetVehicleClassFromName
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L3_2 = IsThisModelACar
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  if L3_2 then
    L1_2 = "automobile"
  else
    L3_2 = IsThisModelABicycle
    L4_2 = A0_2
    L3_2 = L3_2(L4_2)
    if L3_2 then
      L1_2 = "bike"
    else
      L3_2 = IsThisModelABike
      L4_2 = A0_2
      L3_2 = L3_2(L4_2)
      if L3_2 then
        L1_2 = "bike"
      else
        L3_2 = IsThisModelABoat
        L4_2 = A0_2
        L3_2 = L3_2(L4_2)
        if L3_2 then
          L1_2 = "boat"
        else
          L3_2 = IsThisModelAHeli
          L4_2 = A0_2
          L3_2 = L3_2(L4_2)
          if L3_2 then
            L1_2 = "heli"
          else
            L3_2 = IsThisModelAPlane
            L4_2 = A0_2
            L3_2 = L3_2(L4_2)
            if L3_2 then
              L1_2 = "plane"
            else
              L3_2 = IsThisModelAQuadbike
              L4_2 = A0_2
              L3_2 = L3_2(L4_2)
              if L3_2 then
                L1_2 = "automobile"
              else
                L3_2 = IsThisModelATrain
                L4_2 = A0_2
                L3_2 = L3_2(L4_2)
                if L3_2 then
                  L1_2 = "train"
                elseif 5 == L2_2 then
                  L1_2 = "automobile"
                elseif 14 == L2_2 then
                  L1_2 = "submarine"
                elseif 16 == L2_2 then
                  L1_2 = "heli"
                else
                  L1_2 = "trailer"
                end
              end
            end
          end
        end
      end
    end
  end
  return L1_2
end
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  if A1_2 then
    L2_2 = type
    L3_2 = A1_2
    L2_2 = L2_2(L3_2)
    if "table" == L2_2 then
      L2_2 = SetVehicleColour
      L3_2 = A0_2
      L4_2 = A1_2.colour
      L2_2(L3_2, L4_2)
      L2_2 = SetVehicleNumberPlateText
      L3_2 = A0_2
      L4_2 = A1_2.plate
      L2_2(L3_2, L4_2)
    end
  end
  L2_2 = Framework
  L2_2 = L2_2.Client
  L2_2 = L2_2.VehicleSetFuel
  L3_2 = A0_2
  L4_2 = 100.0
  L2_2(L3_2, L4_2)
  L2_2 = NetworkGetEntityIsNetworked
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L2_2 = not L2_2
  return L2_2
end
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L2_2 = ConvertModelToHash
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L3_2 = L0_1
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  L4_2 = IsModelInCdimage
  L5_2 = L2_2
  L4_2 = L4_2(L5_2)
  if not L4_2 then
    L4_2 = Framework
    L4_2 = L4_2.Client
    L4_2 = L4_2.Notify
    L5_2 = "Vehicle model does not exist - contact an admin"
    L6_2 = "error"
    L4_2(L5_2, L6_2)
    L4_2 = print
    L5_2 = "^1Vehicle model %s does not exist"
    L6_2 = L5_2
    L5_2 = L5_2.format
    L7_2 = A0_2
    L5_2, L6_2, L7_2, L8_2, L9_2 = L5_2(L6_2, L7_2)
    L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
    L4_2 = false
    return L4_2
  end
  L4_2 = GetVehicleModelNumberOfSeats
  L5_2 = L2_2
  L4_2 = L4_2(L5_2)
  L4_2 = L4_2 > 0
  if A1_2 and "" ~= A1_2 then
    L5_2 = IsValidGTAPlate
    L6_2 = A1_2
    L5_2 = L5_2(L6_2)
    if not L5_2 then
      L5_2 = Framework
      L5_2 = L5_2.Client
      L5_2 = L5_2.Notify
      L6_2 = "This vehicle's plate is invalid (hit F8 for more details)"
      L7_2 = "error"
      L5_2(L6_2, L7_2)
      L5_2 = print
      L6_2 = "^1This vehicle is trying to spawn with the plate '%s' which is invalid for a GTA vehicle plate"
      L7_2 = L6_2
      L6_2 = L6_2.format
      L9_2 = A1_2
      L8_2 = A1_2.upper
      L8_2, L9_2 = L8_2(L9_2)
      L6_2, L7_2, L8_2, L9_2 = L6_2(L7_2, L8_2, L9_2)
      L5_2(L6_2, L7_2, L8_2, L9_2)
      L5_2 = print
      L6_2 = "^1Vehicle plates must be 8 characters long maximum, and can contain ONLY numbers, letters and spaces"
      L5_2(L6_2)
      L5_2 = false
      return L5_2
    end
  end
  L5_2 = lib
  L5_2 = L5_2.requestModel
  L6_2 = L2_2
  L7_2 = 60000
  L5_2(L6_2, L7_2)
  L5_2 = IsPedRagdoll
  L6_2 = cache
  L6_2 = L6_2.ped
  L5_2 = L5_2(L6_2)
  if L5_2 then
    L5_2 = Framework
    L5_2 = L5_2.Client
    L5_2 = L5_2.Notify
    L6_2 = "You are currently in a ragdoll state"
    L7_2 = "error"
    L5_2(L6_2, L7_2)
    L5_2 = SetModelAsNoLongerNeeded
    L6_2 = L2_2
    L5_2(L6_2)
    L5_2 = false
    return L5_2
  end
  L5_2 = L2_2
  L6_2 = L3_2
  L7_2 = L4_2
  return L5_2, L6_2, L7_2
end
function L3_1(A0_2, A1_2, A2_2, A3_2, A4_2, A5_2, A6_2)
  local L7_2, L8_2, L9_2, L10_2, L11_2
  if not A0_2 or 0 == A0_2 then
    L7_2 = Framework
    L7_2 = L7_2.Client
    L7_2 = L7_2.Notify
    L8_2 = "Could not spawn vehicle - hit F8 for details"
    L9_2 = "error"
    L7_2(L8_2, L9_2)
    L7_2 = print
    L8_2 = "^1Vehicle does not exist (vehicle = 0)"
    L7_2(L8_2)
    L7_2 = false
    return L7_2
  end
  L7_2 = IsPedRagdoll
  L8_2 = cache
  L8_2 = L8_2.ped
  L7_2 = L7_2(L8_2)
  if L7_2 then
    L7_2 = Framework
    L7_2 = L7_2.Client
    L7_2 = L7_2.Notify
    L8_2 = "You are currently in a ragdoll state"
    L9_2 = "error"
    L7_2(L8_2, L9_2)
    L7_2 = SetModelAsNoLongerNeeded
    L8_2 = A2_2
    L7_2(L8_2)
    L7_2 = false
    return L7_2
  end
  if A3_2 then
    L7_2 = ClearPedTasks
    L8_2 = cache
    L8_2 = L8_2.ped
    L7_2(L8_2)
    L7_2 = pcall
    function L8_2()
      local L0_3, L1_3, L2_3, L3_3
      L0_3 = lib
      L0_3 = L0_3.waitFor
      function L1_3()
        local L0_4, L1_4, L2_4, L3_4
        L0_4 = GetPedInVehicleSeat
        L1_4 = A0_2
        L2_4 = -1
        L0_4 = L0_4(L1_4, L2_4)
        L1_4 = cache
        L1_4 = L1_4.ped
        if L0_4 == L1_4 then
          L0_4 = true
          return L0_4
        end
        L0_4 = TaskWarpPedIntoVehicle
        L1_4 = cache
        L1_4 = L1_4.ped
        L2_4 = A0_2
        L3_4 = -1
        L0_4(L1_4, L2_4, L3_4)
      end
      L2_3 = nil
      L3_3 = 5000
      L0_3(L1_3, L2_3, L3_3)
    end
    L7_2 = L7_2(L8_2)
    if not L7_2 then
      L7_2 = print
      L8_2 = "^1[ERROR] Could not warp you into the vehicle^0"
      L7_2(L8_2)
      L7_2 = false
      return L7_2
    end
  end
  if A4_2 and "" ~= A4_2 then
    L7_2 = SetVehicleNumberPlateText
    L8_2 = A0_2
    L9_2 = A4_2
    L7_2(L8_2, L9_2)
  end
  if A5_2 then
    L7_2 = type
    L8_2 = A5_2
    L7_2 = L7_2(L8_2)
    if "table" == L7_2 then
      L7_2 = L1_1
      L8_2 = A0_2
      L9_2 = A5_2
      L7_2(L8_2, L9_2)
    end
  end
  L7_2 = GetResourceState
  L8_2 = "brazzers-fakeplates"
  L7_2 = L7_2(L8_2)
  if "started" == L7_2 then
    L7_2 = lib
    L7_2 = L7_2.callback
    L7_2 = L7_2.await
    L8_2 = "jg-dealerships:server:brazzers-get-fakeplate-from-plate"
    L9_2 = false
    L10_2 = A4_2
    L7_2 = L7_2(L8_2, L9_2, L10_2)
    if L7_2 then
      A4_2 = L7_2
      L8_2 = SetVehicleNumberPlateText
      L9_2 = A0_2
      L10_2 = L7_2
      L8_2(L9_2, L10_2)
    end
  end
  if not A4_2 or "" == A4_2 then
    L7_2 = Framework
    L7_2 = L7_2.Client
    L7_2 = L7_2.GetPlate
    L8_2 = A0_2
    L7_2 = L7_2(L8_2)
    A4_2 = L7_2
  end
  if not A4_2 or "" == A4_2 then
    L7_2 = print
    L8_2 = "^1[ERROR] The game thinks the vehicle has no plate - absolutely no idea how you've managed this"
    L7_2(L8_2)
    L7_2 = false
    return L7_2
  end
  L7_2 = Entity
  L8_2 = A0_2
  L7_2 = L7_2(L8_2)
  L7_2 = L7_2.state
  L8_2 = L7_2
  L7_2 = L7_2.set
  L9_2 = "vehicleid"
  L10_2 = A1_2
  L11_2 = true
  L7_2(L8_2, L9_2, L10_2, L11_2)
  L7_2 = Framework
  L7_2 = L7_2.Client
  L7_2 = L7_2.VehicleGiveKeys
  L8_2 = A4_2
  L9_2 = A0_2
  L10_2 = A6_2
  L7_2(L8_2, L9_2, L10_2)
  L7_2 = true
  return L7_2
end
function L4_1(A0_2, A1_2, A2_2, A3_2, A4_2, A5_2, A6_2, A7_2)
  local L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  L8_2 = SetModelAsNoLongerNeeded
  L9_2 = A3_2
  L8_2(L9_2)
  if not A0_2 then
    L8_2 = Framework
    L8_2 = L8_2.Client
    L8_2 = L8_2.Notify
    L9_2 = "Could not spawn vehicle - hit F8 for details"
    L10_2 = "error"
    L8_2(L9_2, L10_2)
    L8_2 = print
    L9_2 = "^1Server returned false for netId"
    L8_2(L9_2)
    L8_2 = false
    return L8_2
  end
  L8_2 = lib
  L8_2 = L8_2.waitFor
  function L9_2()
    local L0_3, L1_3
    L0_3 = NetworkDoesNetworkIdExist
    L1_3 = A0_2
    L0_3 = L0_3(L1_3)
    if L0_3 then
      L0_3 = NetworkDoesEntityExistWithNetworkId
      L1_3 = A0_2
      L0_3 = L0_3(L1_3)
      if L0_3 then
        goto lbl_12
      end
    end
    L0_3 = nil
    ::lbl_12::
    return L0_3
  end
  L10_2 = "Timed out while waiting for a server-setter netId to exist on client"
  L11_2 = 10000
  L8_2(L9_2, L10_2, L11_2)
  L8_2 = NetToVeh
  L9_2 = A0_2
  L8_2 = L8_2(L9_2)
  L9_2 = lib
  L9_2 = L9_2.waitFor
  function L10_2()
    local L0_3, L1_3
    L0_3 = DoesEntityExist
    L1_3 = L8_2
    L0_3 = L0_3(L1_3)
    if not L0_3 then
      L0_3 = nil
    end
    return L0_3
  end
  L11_2 = "Timed out while waiting for a server-setter vehicle to exist on client"
  L12_2 = 10000
  L9_2(L10_2, L11_2, L12_2)
  if A1_2 then
    L9_2 = SetEntityCoords
    L10_2 = cache
    L10_2 = L10_2.ped
    L11_2 = A1_2.x
    L12_2 = A1_2.y
    L13_2 = A1_2.z
    L14_2 = false
    L15_2 = false
    L16_2 = false
    L17_2 = false
    L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2)
  end
  L9_2 = L3_1
  L10_2 = L8_2
  L11_2 = A4_2
  L12_2 = A3_2
  L13_2 = A2_2
  L14_2 = A5_2
  L15_2 = A6_2
  L16_2 = A7_2
  L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
  if not L9_2 then
    L10_2 = DeleteEntity
    L11_2 = L8_2
    L10_2(L11_2)
    L10_2 = false
    return L10_2
  end
  L10_2 = true
  return L10_2
end
function L5_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L4_2 = lib
  L4_2 = L4_2.requestModel
  L5_2 = A0_2
  L6_2 = 60000
  L4_2(L5_2, L6_2)
  L4_2 = CreateVehicle
  L5_2 = A0_2
  L6_2 = A1_2.x
  L7_2 = A1_2.y
  L8_2 = A1_2.z
  L9_2 = A1_2.w
  L10_2 = A3_2 or L10_2
  if not A3_2 then
    L10_2 = false
  end
  L11_2 = A3_2 or L11_2
  if not A3_2 then
    L11_2 = false
  end
  L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
  L5_2 = lib
  L5_2 = L5_2.waitFor
  function L6_2()
    local L0_3, L1_3
    L0_3 = DoesEntityExist
    L1_3 = L4_2
    L0_3 = L0_3(L1_3)
    if not L0_3 then
      L0_3 = nil
    end
    return L0_3
  end
  L7_2 = "Timed out while trying to spawn in vehicle (client)"
  L8_2 = 10000
  L5_2(L6_2, L7_2, L8_2)
  L5_2 = SetModelAsNoLongerNeeded
  L6_2 = A0_2
  L5_2(L6_2)
  if A2_2 and "" ~= A2_2 then
    L5_2 = SetVehicleNumberPlateText
    L6_2 = L4_2
    L7_2 = A2_2
    L5_2(L6_2, L7_2)
  end
  return L4_2
end
function L6_1(A0_2, A1_2, A2_2, A3_2, A4_2, A5_2, A6_2)
  local L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2
  L7_2 = Config
  L7_2 = L7_2.SpawnVehiclesWithServerSetter
  if L7_2 then
    L7_2 = print
    L8_2 = "^1This function is disabled as client spawning is enabled"
    L7_2(L8_2)
    L7_2 = false
    return L7_2
  end
  L7_2 = L2_1
  L8_2 = A1_2
  L9_2 = A2_2
  L7_2, L8_2, L9_2 = L7_2(L8_2, L9_2)
  if not L7_2 then
    L10_2 = false
    return L10_2
  end
  L10_2 = L5_1
  L11_2 = L7_2
  L12_2 = A3_2
  L13_2 = A2_2
  L14_2 = true
  L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2)
  if not L10_2 then
    L11_2 = false
    return L11_2
  end
  L11_2 = L3_1
  L12_2 = L10_2
  L13_2 = A0_2
  L14_2 = L7_2
  L15_2 = L9_2 or L15_2
  if L9_2 then
    L15_2 = A4_2
  end
  L16_2 = A2_2
  L17_2 = A5_2
  L18_2 = A6_2
  L11_2 = L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2)
  if not L11_2 then
    L12_2 = DeleteEntity
    L13_2 = L10_2
    L12_2(L13_2)
    L12_2 = false
    return L12_2
  end
  return L10_2
end
SpawnVehicleClient = L6_1
L6_1 = AddStateBagChangeHandler
L7_1 = "vehInit"
L8_1 = ""
function L9_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2
  if not A2_2 then
    return
  end
  L3_2 = GetEntityFromStateBagName
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  if 0 == L3_2 then
    return
  end
  L4_2 = lib
  L4_2 = L4_2.waitFor
  function L5_2()
    local L0_3, L1_3
    L0_3 = IsEntityWaitingForWorldCollision
    L1_3 = L3_2
    L0_3 = L0_3(L1_3)
    L0_3 = not L0_3
    return L0_3
  end
  L4_2(L5_2)
  L4_2 = NetworkGetEntityOwner
  L5_2 = L3_2
  L4_2 = L4_2(L5_2)
  L5_2 = cache
  L5_2 = L5_2.playerId
  if L4_2 ~= L5_2 then
    return
  end
  L4_2 = Entity
  L5_2 = L3_2
  L4_2 = L4_2(L5_2)
  L4_2 = L4_2.state
  L5_2 = SetVehicleOnGroundProperly
  L6_2 = L3_2
  L5_2(L6_2)
  L5_2 = SetTimeout
  L6_2 = 0
  function L7_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3
    L0_3 = L4_2
    L1_3 = L0_3
    L0_3 = L0_3.set
    L2_3 = "vehInit"
    L3_3 = nil
    L4_3 = true
    L0_3(L1_3, L2_3, L3_3, L4_3)
  end
  L5_2(L6_2, L7_2)
end
L6_1(L7_1, L8_1, L9_1)
L6_1 = AddStateBagChangeHandler
L7_1 = "dealershipVehCreatedApplyProps"
L8_1 = ""
function L9_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2
  if not A2_2 then
    return
  end
  L3_2 = GetEntityFromStateBagName
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  if 0 == L3_2 then
    return
  end
  L4_2 = SetTimeout
  L5_2 = 0
  function L6_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3
    L0_3 = Entity
    L1_3 = L3_2
    L0_3 = L0_3(L1_3)
    L0_3 = L0_3.state
    L1_3 = 0
    while L1_3 < 10 do
      L2_3 = NetworkGetEntityOwner
      L3_3 = L3_2
      L2_3 = L2_3(L3_3)
      L3_3 = cache
      L3_3 = L3_3.playerId
      if L2_3 == L3_3 then
        L2_3 = L1_1
        L3_3 = L3_2
        L4_3 = A2_2
        L2_3 = L2_3(L3_3, L4_3)
        if L2_3 then
          L3_3 = L0_3
          L2_3 = L0_3.set
          L4_3 = "dealershipVehCreatedApplyProps"
          L5_3 = nil
          L6_3 = true
          L2_3(L3_3, L4_3, L5_3, L6_3)
          break
        end
      end
      L1_3 = L1_3 + 1
      L2_3 = Wait
      L3_3 = 100
      L2_3(L3_3)
    end
  end
  L4_2(L5_2, L6_2)
end
L6_1(L7_1, L8_1, L9_1)
L6_1 = lib
L6_1 = L6_1.callback
L6_1 = L6_1.register
L7_1 = "jg-dealerships:client:req-vehicle-and-get-spawn-details"
L8_1 = L2_1
L6_1(L7_1, L8_1)
L6_1 = lib
L6_1 = L6_1.callback
L6_1 = L6_1.register
L7_1 = "jg-dealerships:client:on-server-vehicle-created"
L8_1 = L4_1
L6_1(L7_1, L8_1)
