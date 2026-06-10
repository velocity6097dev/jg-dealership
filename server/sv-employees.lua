
local L0_1, L1_1, L2_1
function L0_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  if A3_2 then
    L4_2 = Framework
    L4_2 = L4_2.Server
    L4_2 = L4_2.IsAdmin
    L5_2 = A0_2
    L4_2 = L4_2(L5_2)
    if L4_2 then
      L4_2 = DebugPrint
      L5_2 = A0_2
      L6_2 = " returned as server admin"
      L5_2 = L5_2 .. L6_2
      L4_2(L5_2)
      L4_2 = "server_admin"
      return L4_2
    end
  end
  L4_2 = Framework
  L4_2 = L4_2.Server
  L4_2 = L4_2.GetPlayerIdentifier
  L5_2 = A0_2
  L4_2 = L4_2(L5_2)
  L5_2 = MySQL
  L5_2 = L5_2.single
  L5_2 = L5_2.await
  L6_2 = "SELECT name FROM dealership_data WHERE name = ? AND owner_id = ?"
  L7_2 = {}
  L8_2 = A1_2
  L9_2 = L4_2
  L7_2[1] = L8_2
  L7_2[2] = L9_2
  L5_2 = L5_2(L6_2, L7_2)
  if L5_2 then
    L6_2 = "owner"
    return L6_2
  end
  L6_2 = MySQL
  L6_2 = L6_2.single
  L6_2 = L6_2.await
  L7_2 = "SELECT * FROM dealership_employees WHERE identifier = ? AND dealership = ?"
  L8_2 = {}
  L9_2 = L4_2
  L10_2 = A1_2
  L8_2[1] = L9_2
  L8_2[2] = L10_2
  L6_2 = L6_2(L7_2, L8_2)
  if not L6_2 then
    L7_2 = DebugPrint
    L8_2 = L4_2
    L9_2 = " is not an employee at "
    L10_2 = A1_2
    L8_2 = L8_2 .. L9_2 .. L10_2
    L9_2 = "debug"
    L7_2(L8_2, L9_2)
    L7_2 = false
    return L7_2
  end
  if A2_2 then
    L7_2 = type
    L8_2 = A2_2
    L7_2 = L7_2(L8_2)
    if "string" == L7_2 then
      L7_2 = L6_2.role
      if A2_2 ~= L7_2 then
        L7_2 = false
        return L7_2
      end
    end
    L7_2 = type
    L8_2 = A2_2
    L7_2 = L7_2(L8_2)
    if "table" == L7_2 then
      L7_2 = IsItemInList
      L8_2 = A2_2
      L9_2 = L6_2.role
      L7_2 = L7_2(L8_2, L9_2)
      if not L7_2 then
        L7_2 = false
        return L7_2
      end
    end
  end
  L7_2 = DebugPrint
  L8_2 = L4_2
  L9_2 = " is an employee at "
  L10_2 = A1_2
  L11_2 = " with role "
  L12_2 = L6_2.role
  L8_2 = L8_2 .. L9_2 .. L10_2 .. L11_2 .. L12_2
  L9_2 = "debug"
  L7_2(L8_2, L9_2)
  L7_2 = L6_2.role
  return L7_2
end
IsEmployee = L0_1
L0_1 = lib
L0_1 = L0_1.callback
L0_1 = L0_1.register
L1_1 = "jg-dealerships:server:employee-nearest-dealership"
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = GetCurrentDealershipLocation
  L2_2 = GetEntityCoords
  L3_2 = GetPlayerPed
  L4_2 = A0_2
  L3_2, L4_2, L5_2 = L3_2(L4_2)
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)
  L1_2, L2_2 = L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2)
  L3_2 = Config
  L3_2 = L3_2.DealershipLocations
  L3_2 = L3_2[L1_2]
  L4_2 = L3_2.directSaleDistance
  if not L4_2 then
    L4_2 = 50
  end
  if L2_2 > L4_2 then
    L4_2 = Framework
    L4_2 = L4_2.Server
    L4_2 = L4_2.Notify
    L5_2 = A0_2
    L6_2 = Locale
    L6_2 = L6_2.dealershipTooFarAway
    L7_2 = "error"
    L4_2(L5_2, L6_2, L7_2)
    L4_2 = {}
    L4_2.error = true
    return L4_2
  end
  L4_2 = IsEmployee
  L5_2 = A0_2
  L6_2 = L1_2
  L4_2 = L4_2(L5_2, L6_2)
  if not L4_2 then
    L4_2 = Framework
    L4_2 = L4_2.Server
    L4_2 = L4_2.Notify
    L5_2 = A0_2
    L6_2 = Locale
    L6_2 = L6_2.employeePermissionsError
    L7_2 = "error"
    L4_2(L5_2, L6_2, L7_2)
    L4_2 = {}
    L4_2.error = true
    return L4_2
  end
  return L1_2
end
L0_1(L1_1, L2_1)
L0_1 = lib
L0_1 = L0_1.callback
L0_1 = L0_1.register
L1_1 = "jg-dealerships:server:get-employees"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = IsEmployee
  L3_2 = A0_2
  L4_2 = A1_2
  L5_2 = "manager"
  L6_2 = true
  L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2)
  if not L2_2 then
    L2_2 = Framework
    L2_2 = L2_2.Server
    L2_2 = L2_2.Notify
    L3_2 = A0_2
    L4_2 = Locale
    L4_2 = L4_2.employeePermissionsError
    L5_2 = "error"
    L2_2(L3_2, L4_2, L5_2)
    L2_2 = {}
    L2_2.error = true
    return L2_2
  end
  L2_2 = MySQL
  L2_2 = L2_2.query
  L2_2 = L2_2.await
  L3_2 = "SELECT * FROM dealership_employees WHERE dealership = ? ORDER BY joined DESC"
  L4_2 = {}
  L5_2 = A1_2
  L4_2[1] = L5_2
  L2_2 = L2_2(L3_2, L4_2)
  return L2_2
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNetEvent
L1_1 = "jg-dealerships:server:request-hire-employee"
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = source
  A0_2.requesterId = L1_2
  L2_2 = IsEmployee
  L3_2 = L1_2
  L4_2 = A0_2.dealershipId
  L5_2 = "manager"
  L6_2 = true
  L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2)
  if not L2_2 then
    L2_2 = Framework
    L2_2 = L2_2.Server
    L2_2 = L2_2.Notify
    L3_2 = L1_2
    L4_2 = Locale
    L4_2 = L4_2.employeePermissionsError
    L5_2 = "error"
    L2_2(L3_2, L4_2, L5_2)
    return
  end
  L2_2 = TriggerClientEvent
  L3_2 = "jg-dealerships:client:show-confirm-employment"
  L4_2 = A0_2.playerId
  L5_2 = A0_2
  L2_2(L3_2, L4_2, L5_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNetEvent
L1_1 = "jg-dealerships:server:employee-hire-rejected"
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = Framework
  L1_2 = L1_2.Server
  L1_2 = L1_2.Notify
  L2_2 = A0_2
  L3_2 = Locale
  L3_2 = L3_2.employeeRejectedMsg
  L4_2 = "error"
  L1_2(L2_2, L3_2, L4_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNetEvent
L1_1 = "jg-dealerships:server:hire-employee"
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L1_2 = source
  L2_2 = Config
  L2_2 = L2_2.DealershipLocations
  L3_2 = A0_2.dealershipId
  L2_2 = L2_2[L3_2]
  L3_2 = Framework
  L3_2 = L3_2.Server
  L3_2 = L3_2.GetPlayerIdentifier
  L4_2 = A0_2.playerId
  L3_2 = L3_2(L4_2)
  L4_2 = DebugPrint
  L5_2 = "Hiring employee "
  L6_2 = L3_2
  L7_2 = "("
  L8_2 = A0_2.playerId
  L9_2 = ") at "
  L10_2 = A0_2.dealershipId
  L11_2 = " with role "
  L12_2 = A0_2.role
  L5_2 = L5_2 .. L6_2 .. L7_2 .. L8_2 .. L9_2 .. L10_2 .. L11_2 .. L12_2
  L6_2 = "debug"
  L4_2(L5_2, L6_2)
  L4_2 = MySQL
  L4_2 = L4_2.insert
  L4_2 = L4_2.await
  L5_2 = "INSERT INTO dealership_employees (identifier, dealership, role) VALUES (?, ?, ?)"
  L6_2 = {}
  L7_2 = L3_2
  L8_2 = A0_2.dealershipId
  L9_2 = A0_2.role
  L6_2[1] = L7_2
  L6_2[2] = L8_2
  L6_2[3] = L9_2
  L4_2(L5_2, L6_2)
  L4_2 = L2_2.job
  if L4_2 then
    L4_2 = DebugPrint
    L5_2 = "Setting job for "
    L6_2 = L3_2
    L7_2 = "("
    L8_2 = A0_2.playerId
    L9_2 = ") to "
    L10_2 = L2_2.job
    L11_2 = " with role "
    L12_2 = A0_2.role
    L5_2 = L5_2 .. L6_2 .. L7_2 .. L8_2 .. L9_2 .. L10_2 .. L11_2 .. L12_2
    L6_2 = "debug"
    L4_2(L5_2, L6_2)
    L4_2 = Framework
    L4_2 = L4_2.Server
    L4_2 = L4_2.PlayerSetJob
    L5_2 = A0_2.playerId
    L6_2 = L2_2.job
    L7_2 = A0_2.role
    L4_2(L5_2, L6_2, L7_2)
  end
  L4_2 = Framework
  L4_2 = L4_2.Server
  L4_2 = L4_2.GetPlayerInfo
  L5_2 = A0_2.playerId
  L4_2 = L4_2(L5_2)
  L5_2 = SendWebhook
  L6_2 = L1_2
  L7_2 = Webhooks
  L7_2 = L7_2.Dealership
  L8_2 = "Dealership: Employee Hired"
  L9_2 = "success"
  L10_2 = {}
  L11_2 = {}
  L11_2.key = "Dealership"
  L12_2 = A0_2.dealershipId
  L11_2.value = L12_2
  L12_2 = {}
  L12_2.key = "Employee"
  if L4_2 then
    L13_2 = L4_2.name
    if L13_2 then
      goto lbl_83
    end
  end
  L13_2 = L3_2
  ::lbl_83::
  L12_2.value = L13_2
  L13_2 = {}
  L13_2.key = "Role"
  L14_2 = A0_2.role
  L13_2.value = L14_2
  L10_2[1] = L11_2
  L10_2[2] = L12_2
  L10_2[3] = L13_2
  L5_2(L6_2, L7_2, L8_2, L9_2, L10_2)
  L5_2 = Framework
  L5_2 = L5_2.Server
  L5_2 = L5_2.Notify
  L6_2 = A0_2.requesterId
  L7_2 = Locale
  L7_2 = L7_2.employeeHiredMsg
  L8_2 = "success"
  L5_2(L6_2, L7_2, L8_2)
  L5_2 = TriggerClientEvent
  L6_2 = "jg-dealerships:client:update-blips-text-uis"
  L7_2 = L1_2
  L5_2(L6_2, L7_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNetEvent
L1_1 = "jg-dealerships:server:fire-employee"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L2_2 = source
  L3_2 = IsEmployee
  L4_2 = L2_2
  L5_2 = A1_2
  L6_2 = "manager"
  L7_2 = true
  L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2)
  if not L3_2 then
    L3_2 = Framework
    L3_2 = L3_2.Server
    L3_2 = L3_2.Notify
    L4_2 = L2_2
    L5_2 = Locale
    L5_2 = L5_2.employeePermissionsError
    L6_2 = "error"
    L3_2(L4_2, L5_2, L6_2)
    return
  end
  L3_2 = MySQL
  L3_2 = L3_2.insert
  L3_2 = L3_2.await
  L4_2 = "DELETE FROM dealership_employees WHERE identifier = ? AND dealership = ?"
  L5_2 = {}
  L6_2 = A0_2
  L7_2 = A1_2
  L5_2[1] = L6_2
  L5_2[2] = L7_2
  L3_2(L4_2, L5_2)
  L3_2 = Framework
  L3_2 = L3_2.Server
  L3_2 = L3_2.GetPlayerFromIdentifier
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  if L3_2 then
    L4_2 = Framework
    L4_2 = L4_2.Server
    L4_2 = L4_2.PlayerSetJob
    L5_2 = L3_2
    L6_2 = "unemployed"
    L7_2 = 0
    L4_2(L5_2, L6_2, L7_2)
    L4_2 = Framework
    L4_2 = L4_2.Server
    L4_2 = L4_2.Notify
    L5_2 = L3_2
    L6_2 = string
    L6_2 = L6_2.gsub
    L7_2 = Locale
    L7_2 = L7_2.firedNotification
    L8_2 = "%%{value}"
    L9_2 = A1_2
    L6_2 = L6_2(L7_2, L8_2, L9_2)
    L7_2 = "error"
    L4_2(L5_2, L6_2, L7_2)
    L4_2 = TriggerClientEvent
    L5_2 = "jg-dealerships:client:update-blips-text-uis"
    L6_2 = L3_2
    L4_2(L5_2, L6_2)
  else
    L4_2 = Framework
    L4_2 = L4_2.Server
    L4_2 = L4_2.PlayerSetJobOffline
    L5_2 = A0_2
    L6_2 = "unemployed"
    L7_2 = 0
    L4_2(L5_2, L6_2, L7_2)
  end
  L4_2 = Framework
  L4_2 = L4_2.Server
  L4_2 = L4_2.GetPlayerInfoFromIdentifier
  L5_2 = A0_2
  L4_2 = L4_2(L5_2)
  L5_2 = SendWebhook
  L6_2 = L2_2
  L7_2 = Webhooks
  L7_2 = L7_2.Dealership
  L8_2 = "Dealership: Employee Fired"
  L9_2 = "danger"
  L10_2 = {}
  L11_2 = {}
  L11_2.key = "Dealership"
  L11_2.value = A1_2
  L12_2 = {}
  L12_2.key = "Employee"
  if L4_2 then
    L13_2 = L4_2.name
    if L13_2 then
      goto lbl_94
    end
  end
  L13_2 = A0_2
  ::lbl_94::
  L12_2.value = L13_2
  L10_2[1] = L11_2
  L10_2[2] = L12_2
  L5_2(L6_2, L7_2, L8_2, L9_2, L10_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNetEvent
L1_1 = "jg-dealerships:server:update-employee-role"
function L2_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L3_2 = source
  L4_2 = IsEmployee
  L5_2 = L3_2
  L6_2 = A1_2
  L7_2 = "manager"
  L8_2 = true
  L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
  if not L4_2 then
    L4_2 = Framework
    L4_2 = L4_2.Server
    L4_2 = L4_2.Notify
    L5_2 = L3_2
    L6_2 = Locale
    L6_2 = L6_2.employeePermissionsError
    L7_2 = "error"
    L4_2(L5_2, L6_2, L7_2)
    return
  end
  L4_2 = Config
  L4_2 = L4_2.DealershipLocations
  L4_2 = L4_2[A1_2]
  L5_2 = MySQL
  L5_2 = L5_2.insert
  L5_2 = L5_2.await
  L6_2 = "UPDATE dealership_employees SET role = ? WHERE identifier = ? AND dealership = ?"
  L7_2 = {}
  L8_2 = A2_2
  L9_2 = A0_2
  L10_2 = A1_2
  L7_2[1] = L8_2
  L7_2[2] = L9_2
  L7_2[3] = L10_2
  L5_2(L6_2, L7_2)
  L5_2 = Framework
  L5_2 = L5_2.Server
  L5_2 = L5_2.GetPlayerFromIdentifier
  L6_2 = A0_2
  L5_2 = L5_2(L6_2)
  if L5_2 then
    L6_2 = L4_2.job
    if L6_2 then
      L6_2 = Framework
      L6_2 = L6_2.Server
      L6_2 = L6_2.PlayerSetJob
      L7_2 = L5_2
      L8_2 = L4_2.job
      L9_2 = A2_2
      L6_2(L7_2, L8_2, L9_2)
      L6_2 = TriggerClientEvent
      L7_2 = "jg-dealerships:client:update-blips-text-uis"
      L8_2 = L5_2
      L6_2(L7_2, L8_2)
  end
  else
    L6_2 = Framework
    L6_2 = L6_2.Server
    L6_2 = L6_2.PlayerSetJobOffline
    L7_2 = A0_2
    L8_2 = L4_2.job
    L9_2 = A2_2
    L6_2(L7_2, L8_2, L9_2)
  end
  L6_2 = Framework
  L6_2 = L6_2.Server
  L6_2 = L6_2.GetPlayerInfoFromIdentifier
  L7_2 = A0_2
  L6_2 = L6_2(L7_2)
  L7_2 = SendWebhook
  L8_2 = L3_2
  L9_2 = Webhooks
  L9_2 = L9_2.Dealership
  L10_2 = "Dealership: Employee Updated"
  L11_2 = nil
  L12_2 = {}
  L13_2 = {}
  L13_2.key = "Dealership"
  L13_2.value = A1_2
  L14_2 = {}
  L14_2.key = "Employee"
  if L6_2 then
    L15_2 = L6_2.name
    if L15_2 then
      goto lbl_88
    end
  end
  L15_2 = A0_2
  ::lbl_88::
  L14_2.value = L15_2
  L15_2 = {}
  L15_2.key = "New role"
  L15_2.value = A2_2
  L12_2[1] = L13_2
  L12_2[2] = L14_2
  L12_2[3] = L15_2
  L7_2(L8_2, L9_2, L10_2, L11_2, L12_2)
end
L0_1(L1_1, L2_1)
