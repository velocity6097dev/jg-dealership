local L0_1, L1_1, L2_1, L3_1, L4_1
function L0_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L0_2 = lib
  L0_2 = L0_2.callback
  L0_2 = L0_2.await
  L1_2 = "jg-dealerships:server:get-financed-vehicles"
  L2_2 = false
  L0_2 = L0_2(L1_2, L2_2)
  L1_2 = pairs
  L2_2 = L0_2
  L1_2, L2_2, L3_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2 do
    L7_2 = L6_2.financed
    if L7_2 then
      L7_2 = L6_2.finance_data
      if L7_2 then
        L7_2 = Framework
        L7_2 = L7_2.Client
        L7_2 = L7_2.GetModelColumn
        L8_2 = L6_2
        L7_2 = L7_2(L8_2)
        L8_2 = L0_2[L5_2]
        if L7_2 then
          L9_2 = Framework
          L9_2 = L9_2.Client
          L9_2 = L9_2.GetVehicleLabel
          L10_2 = L7_2
          L9_2 = L9_2(L10_2)
          if L9_2 then
            goto lbl_33
          end
        end
        L9_2 = L7_2
        ::lbl_33::
        L8_2.vehicleLabel = L9_2
        L8_2 = L0_2[L5_2]
        L9_2 = json
        L9_2 = L9_2.decode
        L10_2 = L6_2.finance_data
        L9_2 = L9_2(L10_2)
        L8_2.finance_data = L9_2
      end
    end
  end
  L1_2 = {}
  L1_2.type = "manageFinance"
  L1_2.vehicles = L0_2
  L2_2 = Config
  L1_2.config = L2_2
  L2_2 = Locale
  L1_2.locale = L2_2
  return L1_2
end
L1_1 = RegisterCommand
L2_1 = Config
L2_1 = L2_1.MyFinanceCommand
if not L2_1 then
  L2_1 = "myfinance"
end
function L3_1()
  local L0_2, L1_2, L2_2
  L0_2 = SetNuiFocus
  L1_2 = true
  L2_2 = true
  L0_2(L1_2, L2_2)
  L0_2 = SendNUIMessage
  L1_2 = L0_1
  L1_2, L2_2 = L1_2()
  L0_2(L1_2, L2_2)
end
L4_1 = false
L1_1(L2_1, L3_1, L4_1)
L1_1 = RegisterNUICallback
L2_1 = "finance-make-payment"
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = lib
  L2_2 = L2_2.callback
  L2_2 = L2_2.await
  L3_2 = "jg-dealerships:server:finance-make-payment"
  L4_2 = false
  L5_2 = A0_2.plate
  L6_2 = A0_2.type
  L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2)
  L3_2 = A0_2.sendNUI
  if L3_2 then
    L3_2 = SetNuiFocus
    L4_2 = true
    L5_2 = true
    L3_2(L4_2, L5_2)
    L3_2 = SendNUIMessage
    L4_2 = L0_1
    L4_2, L5_2, L6_2 = L4_2()
    L3_2(L4_2, L5_2, L6_2)
  end
  L3_2 = A1_2
  L4_2 = L2_2
  L3_2(L4_2)
end
L1_1(L2_1, L3_1)
