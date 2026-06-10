
local L0_1, L1_1, L2_1, L3_1
L0_1 = lib
L0_1 = L0_1.addCommand
L1_1 = Config
L1_1 = L1_1.DealerAdminCommand
if not L1_1 then
  L1_1 = "dealeradmin"
end
L2_1 = false
function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = Framework
  L1_2 = L1_2.Server
  L1_2 = L1_2.IsAdmin
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if not L1_2 then
    L1_2 = Framework
    L1_2 = L1_2.Server
    L1_2 = L1_2.Notify
    L2_2 = A0_2
    L3_2 = "INSUFFICIENT_PERMISSIONS"
    L4_2 = "error"
    L1_2(L2_2, L3_2, L4_2)
    L1_2 = DebugPrint
    L2_2 = "Player "
    L3_2 = A0_2
    L4_2 = " tried to access the dealer admin panel without permission"
    L2_2 = L2_2 .. L3_2 .. L4_2
    L3_2 = "warning"
    L1_2(L2_2, L3_2)
    return
  end
  L1_2 = TriggerClientEvent
  L2_2 = "jg-dealerships:client:open-admin"
  L3_2 = A0_2
  L1_2(L2_2, L3_2)
end
L0_1(L1_1, L2_1, L3_1)
L0_1 = lib
L0_1 = L0_1.callback
L0_1 = L0_1.register
L1_1 = "jg-dealerships:server:get-admin-data"
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L1_2 = Framework
  L1_2 = L1_2.Server
  L1_2 = L1_2.IsAdmin
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if not L1_2 then
    L1_2 = Framework
    L1_2 = L1_2.Server
    L1_2 = L1_2.Notify
    L2_2 = A0_2
    L3_2 = "INSUFFICIENT_PERMISSIONS"
    L4_2 = "error"
    L1_2(L2_2, L3_2, L4_2)
    L1_2 = DebugPrint
    L2_2 = "Player "
    L3_2 = A0_2
    L4_2 = " tried to get admin data without permission"
    L2_2 = L2_2 .. L3_2 .. L4_2
    L3_2 = "warning"
    L1_2(L2_2, L3_2)
    L1_2 = {}
    L1_2.error = true
    return L1_2
  end
  L1_2 = MySQL
  L1_2 = L1_2.query
  L1_2 = L1_2.await
  L2_2 = "SELECT * FROM dealership_data"
  L1_2 = L1_2(L2_2)
  L2_2 = {}
  L3_2 = pairs
  L4_2 = L1_2
  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
  for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
    L9_2 = Config
    L9_2 = L9_2.DealershipLocations
    L10_2 = L8_2.name
    L9_2 = L9_2[L10_2]
    L10_2 = "-"
    L11_2 = false
    if L9_2 then
      L12_2 = L9_2.type
      L11_2 = true
      L10_2 = L12_2
    end
    L12_2 = #L2_2
    L12_2 = L12_2 + 1
    L13_2 = {}
    L14_2 = L8_2.name
    L13_2.name = L14_2
    L13_2.type = L10_2
    L14_2 = L8_2.label
    L13_2.label = L14_2
    L14_2 = L8_2.balance
    L13_2.balance = L14_2
    L13_2.active = L11_2
    L14_2 = L8_2.owner_id
    L13_2.owner_id = L14_2
    L14_2 = L8_2.owner_name
    L13_2.owner_name = L14_2
    L13_2.config = L9_2
    L2_2[L12_2] = L13_2
  end
  L3_2 = {}
  L4_2 = MySQL
  L4_2 = L4_2.query
  L4_2 = L4_2.await
  L5_2 = "SELECT vehicle.spawn_code, MAX(vehicle.brand) AS brand, MAX(vehicle.model) AS model, MAX(vehicle.category) AS category, MAX(vehicle.price) AS price, MAX(vehicle.created_at) AS created_at, IFNULL(CONCAT('[', GROUP_CONCAT(CONCAT('\"', dealer.name, '\"')), ']'), '[]') as dealers FROM dealership_vehicles vehicle LEFT JOIN dealership_stock stock ON vehicle.spawn_code = stock.vehicle LEFT JOIN dealership_data dealer ON dealer.name = stock.dealership GROUP BY vehicle.spawn_code ORDER BY MAX(vehicle.created_at) DESC;"
  L4_2 = L4_2(L5_2)
  L5_2 = pairs
  L6_2 = L4_2
  L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2)
  for L9_2, L10_2 in L5_2, L6_2, L7_2, L8_2 do
    L11_2 = #L3_2
    L11_2 = L11_2 + 1
    L12_2 = {}
    L13_2 = L10_2.spawn_code
    L12_2.spawn_code = L13_2
    L13_2 = L10_2.brand
    L12_2.brand = L13_2
    L13_2 = L10_2.model
    L12_2.model = L13_2
    L13_2 = L10_2.category
    L12_2.category = L13_2
    L13_2 = L10_2.price
    L12_2.price = L13_2
    L13_2 = json
    L13_2 = L13_2.decode
    L14_2 = L10_2.dealers
    L13_2 = L13_2(L14_2)
    L12_2.dealerships = L13_2
    L13_2 = L10_2.created_at
    L12_2.created_at = L13_2
    L3_2[L11_2] = L12_2
  end
  L5_2 = {}
  L5_2.vehicles = L3_2
  L5_2.dealerships = L2_2
  L6_2 = GetNearbyPlayers
  L7_2 = A0_2
  L8_2 = GetEntityCoords
  L9_2 = GetPlayerPed
  L10_2 = A0_2
  L9_2, L10_2, L11_2, L12_2, L13_2, L14_2 = L9_2(L10_2)
  L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
  L9_2 = 10.0
  L10_2 = true
  L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2)
  L5_2.nearbyPlayers = L6_2
  return L5_2
end
L0_1(L1_1, L2_1)
L0_1 = lib
L0_1 = L0_1.callback
L0_1 = L0_1.register
L1_1 = "jg-dealerships:server:add-vehicle"
function L2_1(A0_2, A1_2, A2_2, A3_2, A4_2, A5_2, A6_2)
  local L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2
  L7_2 = Framework
  L7_2 = L7_2.Server
  L7_2 = L7_2.IsAdmin
  L8_2 = A0_2
  L7_2 = L7_2(L8_2)
  if not L7_2 then
    L7_2 = Framework
    L7_2 = L7_2.Server
    L7_2 = L7_2.Notify
    L8_2 = A0_2
    L9_2 = "INSUFFICIENT_PERMISSIONS"
    L10_2 = "error"
    L7_2(L8_2, L9_2, L10_2)
    L7_2 = DebugPrint
    L8_2 = "Player "
    L9_2 = A0_2
    L10_2 = " tried to add a vehicle without permission"
    L8_2 = L8_2 .. L9_2 .. L10_2
    L9_2 = "warning"
    L7_2(L8_2, L9_2)
    L7_2 = {}
    L7_2.error = true
    return L7_2
  end
  L7_2 = DebugPrint
  L8_2 = "Adding vehicle with spawn code: "
  L9_2 = A1_2
  L10_2 = ", trimmed: "
  L11_2 = Trim
  L12_2 = A1_2
  L11_2 = L11_2(L12_2)
  L8_2 = L8_2 .. L9_2 .. L10_2 .. L11_2
  L9_2 = "debug"
  L7_2(L8_2, L9_2)
  L7_2 = Trim
  L8_2 = A1_2
  L7_2 = L7_2(L8_2)
  A1_2 = L7_2
  L7_2 = MySQL
  L7_2 = L7_2.query
  L7_2 = L7_2.await
  L8_2 = "INSERT INTO dealership_vehicles (spawn_code, hashkey, brand, model, category, price) VALUES(?, ?, ?, ?, ?, ?)"
  L9_2 = {}
  L10_2 = A1_2
  L11_2 = joaat
  L12_2 = A1_2
  L11_2 = L11_2(L12_2)
  L12_2 = A2_2
  L13_2 = A3_2
  L14_2 = A4_2
  L15_2 = A5_2
  L9_2[1] = L10_2
  L9_2[2] = L11_2
  L9_2[3] = L12_2
  L9_2[4] = L13_2
  L9_2[5] = L14_2
  L9_2[6] = L15_2
  L7_2(L8_2, L9_2)
  L7_2 = ipairs
  L8_2 = A6_2
  L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2)
  for L11_2, L12_2 in L7_2, L8_2, L9_2, L10_2 do
    L13_2 = MySQL
    L13_2 = L13_2.query
    L13_2 = L13_2.await
    L14_2 = "INSERT IGNORE INTO dealership_stock (vehicle, dealership, price) VALUES (?, ?, ?)"
    L15_2 = {}
    L16_2 = A1_2
    L17_2 = L12_2
    L18_2 = A5_2
    L15_2[1] = L16_2
    L15_2[2] = L17_2
    L15_2[3] = L18_2
    L13_2(L14_2, L15_2)
  end
  L7_2 = SendWebhook
  L8_2 = A0_2
  L9_2 = Webhooks
  L9_2 = L9_2.Admin
  L10_2 = "Admin: Add Vehicle"
  L11_2 = "success"
  L12_2 = {}
  L13_2 = {}
  L13_2.key = "Vehicle"
  L13_2.value = A1_2
  L14_2 = {}
  L14_2.key = "Name"
  L15_2 = A2_2
  L16_2 = " "
  L17_2 = A3_2
  L15_2 = L15_2 .. L16_2 .. L17_2
  L14_2.value = L15_2
  L15_2 = {}
  L15_2.key = "Category"
  L15_2.value = A4_2
  L16_2 = {}
  L16_2.key = "Price"
  L16_2.value = A5_2
  L17_2 = {}
  L17_2.key = "Dealerships"
  L18_2 = #A6_2
  L19_2 = " dealership(s)"
  L18_2 = L18_2 .. L19_2
  L17_2.value = L18_2
  L12_2[1] = L13_2
  L12_2[2] = L14_2
  L12_2[3] = L15_2
  L12_2[4] = L16_2
  L12_2[5] = L17_2
  L7_2(L8_2, L9_2, L10_2, L11_2, L12_2)
  L7_2 = UpdateAllDealershipsShowroomCache
  L7_2()
  L7_2 = true
  return L7_2
end
L0_1(L1_1, L2_1)
L0_1 = lib
L0_1 = L0_1.callback
L0_1 = L0_1.register
L1_1 = "jg-dealerships:server:update-vehicle"
function L2_1(A0_2, A1_2, A2_2, A3_2, A4_2, A5_2, A6_2, A7_2)
  local L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2
  L8_2 = Framework
  L8_2 = L8_2.Server
  L8_2 = L8_2.IsAdmin
  L9_2 = A0_2
  L8_2 = L8_2(L9_2)
  if not L8_2 then
    L8_2 = Framework
    L8_2 = L8_2.Server
    L8_2 = L8_2.Notify
    L9_2 = A0_2
    L10_2 = "INSUFFICIENT_PERMISSIONS"
    L11_2 = "error"
    L8_2(L9_2, L10_2, L11_2)
    L8_2 = DebugPrint
    L9_2 = "Player "
    L10_2 = A0_2
    L11_2 = " tried to update a vehicle without permission"
    L9_2 = L9_2 .. L10_2 .. L11_2
    L10_2 = "warning"
    L8_2(L9_2, L10_2)
    L8_2 = {}
    L8_2.error = true
    return L8_2
  end
  L8_2 = DebugPrint
  L9_2 = "Updating vehicle with spawn code: "
  L10_2 = A1_2
  L11_2 = ", trimmed: "
  L12_2 = Trim
  L13_2 = A1_2
  L12_2 = L12_2(L13_2)
  L9_2 = L9_2 .. L10_2 .. L11_2 .. L12_2
  L10_2 = "debug"
  L8_2(L9_2, L10_2)
  L8_2 = Trim
  L9_2 = A1_2
  L8_2 = L8_2(L9_2)
  A1_2 = L8_2
  L8_2 = MySQL
  L8_2 = L8_2.query
  L8_2 = L8_2.await
  L9_2 = "UPDATE dealership_vehicles SET brand = ?, model = ?, category = ?, price = ? WHERE spawn_code = ?"
  L10_2 = {}
  L11_2 = A2_2
  L12_2 = A3_2
  L13_2 = A4_2
  L14_2 = A5_2
  L15_2 = A1_2
  L10_2[1] = L11_2
  L10_2[2] = L12_2
  L10_2[3] = L13_2
  L10_2[4] = L14_2
  L10_2[5] = L15_2
  L8_2(L9_2, L10_2)
  L8_2 = #A6_2
  if L8_2 > 0 then
    L8_2 = MySQL
    L8_2 = L8_2.query
    L8_2 = L8_2.await
    L9_2 = "DELETE FROM dealership_stock WHERE vehicle = ? AND dealership NOT IN (?)"
    L10_2 = {}
    L11_2 = A1_2
    L12_2 = A6_2
    L10_2[1] = L11_2
    L10_2[2] = L12_2
    L8_2(L9_2, L10_2)
  else
    L8_2 = MySQL
    L8_2 = L8_2.query
    L8_2 = L8_2.await
    L9_2 = "DELETE FROM dealership_stock WHERE vehicle = ?"
    L10_2 = {}
    L11_2 = A1_2
    L10_2[1] = L11_2
    L8_2(L9_2, L10_2)
  end
  L8_2 = ipairs
  L9_2 = A6_2
  L8_2, L9_2, L10_2, L11_2 = L8_2(L9_2)
  for L12_2, L13_2 in L8_2, L9_2, L10_2, L11_2 do
    L14_2 = MySQL
    L14_2 = L14_2.query
    L14_2 = L14_2.await
    L15_2 = "INSERT IGNORE INTO dealership_stock (vehicle, dealership, price) VALUES (?, ?, ?)"
    L16_2 = {}
    L17_2 = A1_2
    L18_2 = L13_2
    L19_2 = A5_2
    L16_2[1] = L17_2
    L16_2[2] = L18_2
    L16_2[3] = L19_2
    L14_2(L15_2, L16_2)
  end
  if A7_2 then
    L8_2 = MySQL
    L8_2 = L8_2.query
    L8_2 = L8_2.await
    L9_2 = "UPDATE dealership_stock SET price = ? WHERE vehicle = ?"
    L10_2 = {}
    L11_2 = A5_2
    L12_2 = A1_2
    L10_2[1] = L11_2
    L10_2[2] = L12_2
    L8_2(L9_2, L10_2)
  end
  L8_2 = SendWebhook
  L9_2 = A0_2
  L10_2 = Webhooks
  L10_2 = L10_2.Admin
  L11_2 = "Admin: Vehicle Updated"
  L12_2 = nil
  L13_2 = {}
  L14_2 = {}
  L14_2.key = "Vehicle"
  L14_2.value = A1_2
  L15_2 = {}
  L15_2.key = "Name"
  L16_2 = A2_2
  L17_2 = " "
  L18_2 = A3_2
  L16_2 = L16_2 .. L17_2 .. L18_2
  L15_2.value = L16_2
  L16_2 = {}
  L16_2.key = "Category"
  L16_2.value = A4_2
  L17_2 = {}
  L17_2.key = "Price"
  L17_2.value = A5_2
  L18_2 = {}
  L18_2.key = "Dealerships"
  L19_2 = #A6_2
  L20_2 = " dealership(s)"
  L19_2 = L19_2 .. L20_2
  L18_2.value = L19_2
  L13_2[1] = L14_2
  L13_2[2] = L15_2
  L13_2[3] = L16_2
  L13_2[4] = L17_2
  L13_2[5] = L18_2
  L8_2(L9_2, L10_2, L11_2, L12_2, L13_2)
  L8_2 = UpdateAllDealershipsShowroomCache
  L8_2()
  L8_2 = true
  return L8_2
end
L0_1(L1_1, L2_1)
L0_1 = lib
L0_1 = L0_1.callback
L0_1 = L0_1.register
L1_1 = "jg-dealerships:server:delete-vehicle"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L2_2 = Framework
  L2_2 = L2_2.Server
  L2_2 = L2_2.IsAdmin
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    L2_2 = Framework
    L2_2 = L2_2.Server
    L2_2 = L2_2.Notify
    L3_2 = A0_2
    L4_2 = "INSUFFICIENT_PERMISSIONS"
    L5_2 = "error"
    L2_2(L3_2, L4_2, L5_2)
    L2_2 = DebugPrint
    L3_2 = "Player "
    L4_2 = A0_2
    L5_2 = " tried to delete a vehicle without permission"
    L3_2 = L3_2 .. L4_2 .. L5_2
    L4_2 = "warning"
    L2_2(L3_2, L4_2)
    L2_2 = {}
    L2_2.error = true
    return L2_2
  end
  L2_2 = MySQL
  L2_2 = L2_2.query
  L2_2 = L2_2.await
  L3_2 = "DELETE FROM dealership_stock WHERE vehicle = ?"
  L4_2 = {}
  L5_2 = A1_2
  L4_2[1] = L5_2
  L2_2(L3_2, L4_2)
  L2_2 = MySQL
  L2_2 = L2_2.query
  L2_2 = L2_2.await
  L3_2 = "DELETE FROM dealership_sales WHERE vehicle = ?"
  L4_2 = {}
  L5_2 = A1_2
  L4_2[1] = L5_2
  L2_2(L3_2, L4_2)
  L2_2 = MySQL
  L2_2 = L2_2.query
  L2_2 = L2_2.await
  L3_2 = "DELETE FROM dealership_orders WHERE vehicle = ?"
  L4_2 = {}
  L5_2 = A1_2
  L4_2[1] = L5_2
  L2_2(L3_2, L4_2)
  L2_2 = MySQL
  L2_2 = L2_2.query
  L2_2 = L2_2.await
  L3_2 = "DELETE FROM dealership_dispveh WHERE vehicle = ?"
  L4_2 = {}
  L5_2 = A1_2
  L4_2[1] = L5_2
  L2_2(L3_2, L4_2)
  L2_2 = MySQL
  L2_2 = L2_2.query
  L2_2 = L2_2.await
  L3_2 = "DELETE FROM dealership_vehicles WHERE spawn_code = ?"
  L4_2 = {}
  L5_2 = A1_2
  L4_2[1] = L5_2
  L2_2(L3_2, L4_2)
  L2_2 = SendWebhook
  L3_2 = A0_2
  L4_2 = Webhooks
  L4_2 = L4_2.Admin
  L5_2 = "Admin: Vehicle Deleted"
  L6_2 = "danger"
  L7_2 = {}
  L8_2 = {}
  L8_2.key = "Vehicle"
  L8_2.value = A1_2
  L7_2[1] = L8_2
  L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)
  L2_2 = UpdateAllDealershipsShowroomCache
  L2_2()
  L2_2 = true
  return L2_2
end
L0_1(L1_1, L2_1)
L0_1 = lib
L0_1 = L0_1.callback
L0_1 = L0_1.register
L1_1 = "jg-dealerships:server:delete-dealership-data"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L2_2 = Framework
  L2_2 = L2_2.Server
  L2_2 = L2_2.IsAdmin
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    L2_2 = Framework
    L2_2 = L2_2.Server
    L2_2 = L2_2.Notify
    L3_2 = A0_2
    L4_2 = "INSUFFICIENT_PERMISSIONS"
    L5_2 = "error"
    L2_2(L3_2, L4_2, L5_2)
    L2_2 = DebugPrint
    L3_2 = "Player "
    L4_2 = A0_2
    L5_2 = " tried to delete a dealership without permission"
    L3_2 = L3_2 .. L4_2 .. L5_2
    L4_2 = "warning"
    L2_2(L3_2, L4_2)
    L2_2 = {}
    L2_2.error = true
    return L2_2
  end
  L2_2 = MySQL
  L2_2 = L2_2.query
  L2_2 = L2_2.await
  L3_2 = "DELETE FROM dealership_stock WHERE dealership = ?"
  L4_2 = {}
  L5_2 = A1_2
  L4_2[1] = L5_2
  L2_2(L3_2, L4_2)
  L2_2 = MySQL
  L2_2 = L2_2.query
  L2_2 = L2_2.await
  L3_2 = "DELETE FROM dealership_sales WHERE dealership = ?"
  L4_2 = {}
  L5_2 = A1_2
  L4_2[1] = L5_2
  L2_2(L3_2, L4_2)
  L2_2 = MySQL
  L2_2 = L2_2.query
  L2_2 = L2_2.await
  L3_2 = "DELETE FROM dealership_orders WHERE dealership = ?"
  L4_2 = {}
  L5_2 = A1_2
  L4_2[1] = L5_2
  L2_2(L3_2, L4_2)
  L2_2 = MySQL
  L2_2 = L2_2.query
  L2_2 = L2_2.await
  L3_2 = "DELETE FROM dealership_dispveh WHERE dealership = ?"
  L4_2 = {}
  L5_2 = A1_2
  L4_2[1] = L5_2
  L2_2(L3_2, L4_2)
  L2_2 = MySQL
  L2_2 = L2_2.query
  L2_2 = L2_2.await
  L3_2 = "DELETE FROM dealership_data WHERE name = ?"
  L4_2 = {}
  L5_2 = A1_2
  L4_2[1] = L5_2
  L2_2(L3_2, L4_2)
  L2_2 = SendWebhook
  L3_2 = A0_2
  L4_2 = Webhooks
  L4_2 = L4_2.Admin
  L5_2 = "Admin: Dealership Data Deleted"
  L6_2 = "danger"
  L7_2 = {}
  L8_2 = {}
  L8_2.key = "Dealership"
  L8_2.value = A1_2
  L7_2[1] = L8_2
  L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)
  L2_2 = UpdateAllDealershipsShowroomCache
  L2_2()
  L2_2 = true
  return L2_2
end
L0_1(L1_1, L2_1)
L0_1 = lib
L0_1 = L0_1.callback
L0_1 = L0_1.register
L1_1 = "jg-dealerships:server:set-dealership-owner"
function L2_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L3_2 = Framework
  L3_2 = L3_2.Server
  L3_2 = L3_2.IsAdmin
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    L3_2 = Framework
    L3_2 = L3_2.Server
    L3_2 = L3_2.Notify
    L4_2 = A0_2
    L5_2 = "INSUFFICIENT_PERMISSIONS"
    L6_2 = "error"
    L3_2(L4_2, L5_2, L6_2)
    L3_2 = DebugPrint
    L4_2 = "Player "
    L5_2 = A0_2
    L6_2 = " tried to set a dealership owner without permission"
    L4_2 = L4_2 .. L5_2 .. L6_2
    L5_2 = "warning"
    L3_2(L4_2, L5_2)
    L3_2 = {}
    L3_2.error = true
    return L3_2
  end
  L3_2 = Framework
  L3_2 = L3_2.Server
  L3_2 = L3_2.GetPlayerIdentifier
  L4_2 = tonumber
  L5_2 = A2_2
  L4_2 = L4_2(L5_2)
  if not L4_2 then
    L4_2 = 0
  end
  L3_2 = L3_2(L4_2)
  L4_2 = DebugPrint
  L5_2 = "Setting dealership owner for "
  L6_2 = A1_2
  L7_2 = " to "
  L8_2 = L3_2
  L5_2 = L5_2 .. L6_2 .. L7_2 .. L8_2
  L6_2 = "debug"
  L4_2(L5_2, L6_2)
  L4_2 = Framework
  L4_2 = L4_2.Server
  L4_2 = L4_2.GetPlayerInfo
  L5_2 = tonumber
  L6_2 = A2_2
  L5_2 = L5_2(L6_2)
  if not L5_2 then
    L5_2 = 0
  end
  L4_2 = L4_2(L5_2)
  if not L4_2 or not L3_2 then
    L5_2 = Framework
    L5_2 = L5_2.Server
    L5_2 = L5_2.Notify
    L6_2 = A0_2
    L7_2 = "PLAYER_NOT_ONLINE"
    L8_2 = "error"
    L5_2(L6_2, L7_2, L8_2)
    L5_2 = {}
    L5_2.error = true
    return L5_2
  end
  L5_2 = MySQL
  L5_2 = L5_2.update
  L5_2 = L5_2.await
  L6_2 = "UPDATE dealership_data SET owner_id = ?, owner_name = ? WHERE name = ?"
  L7_2 = {}
  L8_2 = L3_2
  L9_2 = L4_2.name
  L10_2 = A1_2
  L7_2[1] = L8_2
  L7_2[2] = L9_2
  L7_2[3] = L10_2
  L5_2(L6_2, L7_2)
  L5_2 = TriggerClientEvent
  L6_2 = "jg-dealerships:client:update-blips-text-uis"
  L7_2 = -1
  L5_2(L6_2, L7_2)
  L5_2 = SendWebhook
  L6_2 = A0_2
  L7_2 = Webhooks
  L7_2 = L7_2.Admin
  L8_2 = "Admin: Dealership Owner Updated"
  L9_2 = nil
  L10_2 = {}
  L11_2 = {}
  L11_2.key = "Dealership"
  L11_2.value = A1_2
  L12_2 = {}
  L12_2.key = "Owner"
  L13_2 = L4_2.name
  L12_2.value = L13_2
  L10_2[1] = L11_2
  L10_2[2] = L12_2
  L5_2(L6_2, L7_2, L8_2, L9_2, L10_2)
  L5_2 = true
  return L5_2
end
L0_1(L1_1, L2_1)
function L0_1()
  local L0_2, L1_2
  L0_2 = MySQL
  L0_2 = L0_2.query
  L0_2 = L0_2.await
  L1_2 = "DELETE FROM dealership_dispveh"
  L0_2(L1_2)
  L0_2 = MySQL
  L0_2 = L0_2.query
  L0_2 = L0_2.await
  L1_2 = "DELETE FROM dealership_orders"
  L0_2(L1_2)
  L0_2 = MySQL
  L0_2 = L0_2.query
  L0_2 = L0_2.await
  L1_2 = "DELETE FROM dealership_sales"
  L0_2(L1_2)
  L0_2 = MySQL
  L0_2 = L0_2.query
  L0_2 = L0_2.await
  L1_2 = "DELETE FROM dealership_stock"
  L0_2(L1_2)
  L0_2 = MySQL
  L0_2 = L0_2.query
  L0_2 = L0_2.await
  L1_2 = "DELETE FROM dealership_vehicles"
  L0_2(L1_2)
end
L1_1 = lib
L1_1 = L1_1.callback
L1_1 = L1_1.register
L2_1 = "jg-dealerships:server:import-vehicles-data"
function L3_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2
  L3_2 = Config
  L3_2 = L3_2.Framework
  if "QBCore" == L3_2 then
    if "qbshared" == A1_2 then
      L3_2 = QBCore
      L3_2 = L3_2.Shared
      L3_2 = L3_2.Vehicles
      if "Overwrite" == A2_2 then
        L4_2 = L0_1
        L4_2()
      end
      L4_2 = pairs
      L5_2 = L3_2
      L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
      for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
        L10_2 = MySQL
        L10_2 = L10_2.query
        L10_2 = L10_2.await
        L11_2 = "INSERT IGNORE INTO dealership_vehicles (spawn_code, hashkey, brand, model, category, price) VALUES(?, ?, ?, ?, ?, ?)"
        L12_2 = {}
        L13_2 = Trim
        L14_2 = L8_2
        L13_2 = L13_2(L14_2)
        L14_2 = joaat
        L15_2 = L8_2
        L14_2 = L14_2(L15_2)
        L15_2 = L9_2.brand
        L16_2 = L9_2.name
        L17_2 = L9_2.category
        L18_2 = L9_2.price
        L12_2[1] = L13_2
        L12_2[2] = L14_2
        L12_2[3] = L15_2
        L12_2[4] = L16_2
        L12_2[5] = L17_2
        L12_2[6] = L18_2
        L10_2(L11_2, L12_2)
        L10_2 = {}
        L11_2 = type
        L12_2 = L9_2.shop
        L11_2 = L11_2(L12_2)
        if "string" == L11_2 then
          L11_2 = L9_2.shop
          L10_2[1] = L11_2
        else
          L11_2 = type
          L12_2 = L9_2.shop
          L11_2 = L11_2(L12_2)
          if "table" == L11_2 then
            L10_2 = L9_2.shop
          end
        end
        L11_2 = ipairs
        L12_2 = L10_2
        L11_2, L12_2, L13_2, L14_2 = L11_2(L12_2)
        for L15_2, L16_2 in L11_2, L12_2, L13_2, L14_2 do
          L17_2 = Config
          L17_2 = L17_2.DealershipLocations
          L17_2 = L17_2[L16_2]
          if L17_2 then
            L17_2 = MySQL
            L17_2 = L17_2.query
            L17_2 = L17_2.await
            L18_2 = "INSERT IGNORE INTO dealership_stock (vehicle, dealership, stock, price) VALUES(?, ?, ?, ?)"
            L19_2 = {}
            L20_2 = Trim
            L21_2 = L8_2
            L20_2 = L20_2(L21_2)
            L21_2 = L16_2
            L22_2 = 0
            L23_2 = L9_2.price
            L19_2[1] = L20_2
            L19_2[2] = L21_2
            L19_2[3] = L22_2
            L19_2[4] = L23_2
            L17_2(L18_2, L19_2)
          end
        end
      end
      L4_2 = MySQL
      L4_2 = L4_2.scalar
      L4_2 = L4_2.await
      L5_2 = "SELECT COUNT(*) as count FROM dealership_vehicles"
      L4_2 = L4_2(L5_2)
      L5_2 = Framework
      L5_2 = L5_2.Server
      L5_2 = L5_2.Notify
      L6_2 = A0_2
      L7_2 = "Import successful! Vehicle count: "
      L8_2 = L4_2
      L7_2 = L7_2 .. L8_2
      L8_2 = "success"
      L5_2(L6_2, L7_2, L8_2)
      L5_2 = SendWebhook
      L6_2 = A0_2
      L7_2 = Webhooks
      L7_2 = L7_2.Admin
      L8_2 = "Admin: Vehicles Imported"
      L9_2 = "success"
      L10_2 = {}
      L11_2 = {}
      L11_2.key = "Method"
      L11_2.value = "QBCore Shared"
      L12_2 = {}
      L12_2.key = "Rows Imported"
      L12_2.value = L4_2
      L10_2[1] = L11_2
      L10_2[2] = L12_2
      L5_2(L6_2, L7_2, L8_2, L9_2, L10_2)
      L5_2 = UpdateAllDealershipsShowroomCache
      L5_2()
      L5_2 = true
      return L5_2
    end
  else
    L3_2 = Config
    L3_2 = L3_2.Framework
    if "Qbox" == L3_2 then
      if "qbx_shared" == A1_2 then
        L3_2 = exports
        L3_2 = L3_2.qbx_core
        L4_2 = L3_2
        L3_2 = L3_2.GetVehiclesByHash
        L3_2 = L3_2(L4_2)
        if "Overwrite" == A2_2 then
          L4_2 = L0_1
          L4_2()
        end
        L4_2 = pairs
        L5_2 = L3_2
        L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
        for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
          L10_2 = MySQL
          L10_2 = L10_2.query
          L10_2 = L10_2.await
          L11_2 = "INSERT IGNORE INTO dealership_vehicles (spawn_code, hashkey, brand, model, category, price) VALUES(?, ?, ?, ?, ?, ?)"
          L12_2 = {}
          L13_2 = Trim
          L14_2 = L9_2.model
          L13_2 = L13_2(L14_2)
          L14_2 = L8_2
          L15_2 = L9_2.brand
          L16_2 = L9_2.name
          L17_2 = L9_2.category
          L18_2 = L9_2.price
          L12_2[1] = L13_2
          L12_2[2] = L14_2
          L12_2[3] = L15_2
          L12_2[4] = L16_2
          L12_2[5] = L17_2
          L12_2[6] = L18_2
          L10_2(L11_2, L12_2)
          L10_2 = L9_2.shop
          if L10_2 then
            L10_2 = {}
            L11_2 = type
            L12_2 = L9_2.shop
            L11_2 = L11_2(L12_2)
            if "string" == L11_2 then
              L11_2 = L9_2.shop
              L10_2[1] = L11_2
            else
              L11_2 = type
              L12_2 = L9_2.shop
              L11_2 = L11_2(L12_2)
              if "table" == L11_2 then
                L10_2 = L9_2.shop
              end
            end
            L11_2 = ipairs
            L12_2 = L10_2
            L11_2, L12_2, L13_2, L14_2 = L11_2(L12_2)
            for L15_2, L16_2 in L11_2, L12_2, L13_2, L14_2 do
              L17_2 = Config
              L17_2 = L17_2.DealershipLocations
              L17_2 = L17_2[L16_2]
              if L17_2 then
                L17_2 = MySQL
                L17_2 = L17_2.query
                L17_2 = L17_2.await
                L18_2 = "INSERT IGNORE INTO dealership_stock (vehicle, dealership, stock, price) VALUES(?, ?, ?, ?)"
                L19_2 = {}
                L20_2 = Trim
                L21_2 = L9_2.model
                L20_2 = L20_2(L21_2)
                L21_2 = L16_2
                L22_2 = 0
                L23_2 = L9_2.price
                L19_2[1] = L20_2
                L19_2[2] = L21_2
                L19_2[3] = L22_2
                L19_2[4] = L23_2
                L17_2(L18_2, L19_2)
              end
            end
          else
            L10_2 = pairs
            L11_2 = Config
            L11_2 = L11_2.DealershipLocations
            L10_2, L11_2, L12_2, L13_2 = L10_2(L11_2)
            for L14_2, L15_2 in L10_2, L11_2, L12_2, L13_2 do
              L16_2 = IsItemInList
              L17_2 = L15_2.categories
              L18_2 = L9_2.category
              L16_2 = L16_2(L17_2, L18_2)
              if L16_2 then
                L16_2 = MySQL
                L16_2 = L16_2.query
                L16_2 = L16_2.await
                L17_2 = "INSERT IGNORE INTO dealership_stock (vehicle, dealership, stock, price) VALUES(?, ?, ?, ?)"
                L18_2 = {}
                L19_2 = Trim
                L20_2 = L9_2.model
                L19_2 = L19_2(L20_2)
                L20_2 = L14_2
                L21_2 = 0
                L22_2 = L9_2.price
                L18_2[1] = L19_2
                L18_2[2] = L20_2
                L18_2[3] = L21_2
                L18_2[4] = L22_2
                L16_2(L17_2, L18_2)
              end
            end
          end
        end
        L4_2 = MySQL
        L4_2 = L4_2.scalar
        L4_2 = L4_2.await
        L5_2 = "SELECT COUNT(*) as count FROM dealership_vehicles"
        L4_2 = L4_2(L5_2)
        L5_2 = Framework
        L5_2 = L5_2.Server
        L5_2 = L5_2.Notify
        L6_2 = A0_2
        L7_2 = "Import successful! Vehicle count: "
        L8_2 = L4_2
        L7_2 = L7_2 .. L8_2
        L8_2 = "success"
        L5_2(L6_2, L7_2, L8_2)
        L5_2 = SendWebhook
        L6_2 = A0_2
        L7_2 = Webhooks
        L7_2 = L7_2.Admin
        L8_2 = "Admin: Vehicles Imported"
        L9_2 = "success"
        L10_2 = {}
        L11_2 = {}
        L11_2.key = "Method"
        L11_2.value = "QBox Shared"
        L12_2 = {}
        L12_2.key = "Rows Imported"
        L12_2.value = L4_2
        L10_2[1] = L11_2
        L10_2[2] = L12_2
        L5_2(L6_2, L7_2, L8_2, L9_2, L10_2)
        L5_2 = UpdateAllDealershipsShowroomCache
        L5_2()
        L5_2 = true
        return L5_2
      end
    else
      L3_2 = Config
      L3_2 = L3_2.Framework
      if "ESX" == L3_2 and "esxdb" == A1_2 then
        if "Overwrite" == A2_2 then
          L3_2 = L0_1
          L3_2()
        end
        L3_2 = MySQL
        L3_2 = L3_2.query
        L3_2 = L3_2.await
        L4_2 = "SELECT * FROM vehicles ORDER BY name DESC"
        L3_2 = L3_2(L4_2)
        L4_2 = pairs
        L5_2 = L3_2
        L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
        for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
          L10_2 = MySQL
          L10_2 = L10_2.query
          L10_2 = L10_2.await
          L11_2 = "INSERT IGNORE INTO dealership_vehicles (spawn_code, hashkey, brand, model, category, price) VALUES(?, ?, ?, ?, ?, ?)"
          L12_2 = {}
          L13_2 = Trim
          L14_2 = L9_2.model
          L13_2 = L13_2(L14_2)
          L14_2 = joaat
          L15_2 = L9_2.model
          L14_2 = L14_2(L15_2)
          L15_2 = nil
          L16_2 = L9_2.name
          L17_2 = L9_2.category
          L18_2 = L9_2.price
          L12_2[1] = L13_2
          L12_2[2] = L14_2
          L12_2[3] = L15_2
          L12_2[4] = L16_2
          L12_2[5] = L17_2
          L12_2[6] = L18_2
          L10_2(L11_2, L12_2)
          L10_2 = pairs
          L11_2 = Config
          L11_2 = L11_2.DealershipLocations
          L10_2, L11_2, L12_2, L13_2 = L10_2(L11_2)
          for L14_2, L15_2 in L10_2, L11_2, L12_2, L13_2 do
            L16_2 = IsItemInList
            L17_2 = L15_2.categories
            L18_2 = L9_2.category
            L16_2 = L16_2(L17_2, L18_2)
            if L16_2 then
              L16_2 = MySQL
              L16_2 = L16_2.query
              L16_2 = L16_2.await
              L17_2 = "INSERT IGNORE INTO dealership_stock (vehicle, dealership, stock, price) VALUES(?, ?, ?, ?)"
              L18_2 = {}
              L19_2 = Trim
              L20_2 = L9_2.model
              L19_2 = L19_2(L20_2)
              L20_2 = L14_2
              L21_2 = 0
              L22_2 = L9_2.price
              L18_2[1] = L19_2
              L18_2[2] = L20_2
              L18_2[3] = L21_2
              L18_2[4] = L22_2
              L16_2(L17_2, L18_2)
            end
          end
        end
        L4_2 = MySQL
        L4_2 = L4_2.scalar
        L4_2 = L4_2.await
        L5_2 = "SELECT COUNT(*) as count FROM dealership_vehicles"
        L4_2 = L4_2(L5_2)
        L5_2 = Framework
        L5_2 = L5_2.Server
        L5_2 = L5_2.Notify
        L6_2 = A0_2
        L7_2 = "Import successful! Vehicle count: "
        L8_2 = L4_2
        L7_2 = L7_2 .. L8_2
        L8_2 = "success"
        L5_2(L6_2, L7_2, L8_2)
        L5_2 = SendWebhook
        L6_2 = A0_2
        L7_2 = Webhooks
        L7_2 = L7_2.Admin
        L8_2 = "Admin: Vehicles Imported"
        L9_2 = "success"
        L10_2 = {}
        L11_2 = {}
        L11_2.key = "Method"
        L11_2.value = "ESX"
        L12_2 = {}
        L12_2.key = "Rows Imported"
        L12_2.value = L4_2
        L10_2[1] = L11_2
        L10_2[2] = L12_2
        L5_2(L6_2, L7_2, L8_2, L9_2, L10_2)
        L5_2 = UpdateAllDealershipsShowroomCache
        L5_2()
        L5_2 = true
        return L5_2
      end
    end
  end
  L3_2 = {}
  L3_2.error = "UNSUPPORTED_SOURCE"
  return L3_2
end
L1_1(L2_1, L3_1)

