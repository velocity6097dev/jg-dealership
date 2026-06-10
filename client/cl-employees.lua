
local L0_1, L1_1, L2_1
L0_1 = RegisterNetEvent
L1_1 = "jg-dealerships:client:show-confirm-employment"
function L2_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = SetNuiFocus
  L2_2 = true
  L3_2 = true
  L1_2(L2_2, L3_2)
  L1_2 = SendNUIMessage
  L2_2 = {}
  L2_2.type = "showConfirmEmployment"
  L2_2.data = A0_2
  L3_2 = Config
  L2_2.config = L3_2
  L3_2 = Locale
  L2_2.locale = L3_2
  L1_2(L2_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "accept-hire-request"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = TriggerServerEvent
  L3_2 = "jg-dealerships:server:hire-employee"
  L4_2 = A0_2
  L2_2(L3_2, L4_2)
  L2_2 = A1_2
  L3_2 = true
  L2_2(L3_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "deny-hire-request"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = TriggerServerEvent
  L3_2 = "jg-dealerships:server:employee-hire-rejected"
  L4_2 = A0_2.requesterId
  L2_2(L3_2, L4_2)
  L2_2 = A1_2
  L3_2 = true
  L2_2(L3_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "request-hire-employee"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = TriggerServerEvent
  L3_2 = "jg-dealerships:server:request-hire-employee"
  L4_2 = A0_2
  L2_2(L3_2, L4_2)
  L2_2 = A1_2
  L3_2 = true
  L2_2(L3_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "fire-employee"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L2_2 = A0_2.identifier
  L3_2 = A0_2.dealershipId
  L4_2 = TriggerServerEvent
  L5_2 = "jg-dealerships:server:fire-employee"
  L6_2 = L2_2
  L7_2 = L3_2
  L4_2(L5_2, L6_2, L7_2)
  L4_2 = A1_2
  L5_2 = true
  L4_2(L5_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "update-employee-role"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L2_2 = A0_2.identifier
  L3_2 = A0_2.dealershipId
  L4_2 = A0_2.newRole
  L5_2 = TriggerServerEvent
  L6_2 = "jg-dealerships:server:update-employee-role"
  L7_2 = L2_2
  L8_2 = L3_2
  L9_2 = L4_2
  L5_2(L6_2, L7_2, L8_2, L9_2)
  L5_2 = A1_2
  L6_2 = true
  L5_2(L6_2)
end
L0_1(L1_1, L2_1)
