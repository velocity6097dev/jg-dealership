-- Helper function to determine vehicle classification string
local function GetVehicleTypeString(model)
    local vehicleClass = GetVehicleClassFromName(model)
    if IsThisModelACar(model) then
        return "automobile"
    elseif IsThisModelABicycle(model) or IsThisModelABike(model) then
        return "bike"
    elseif IsThisModelABoat(model) then
        return "boat"
    elseif IsThisModelAHeli(model) then
        return "heli"
    elseif IsThisModelAPlane(model) then
        return "plane"
    elseif IsThisModelAQuadbike(model) then
        return "automobile"
    elseif IsThisModelATrain(model) then
        return "train"
    elseif vehicleClass == 5 then
        return "automobile"
    elseif vehicleClass == 14 then
        return "submarine"
    elseif vehicleClass == 16 then
        return "heli"
    else
        return "trailer"
    end
end

-- Safely applies plates, fuels, and fixed vehicle colours
local function ApplySpawnedVehicleProperties(vehicle, props)
    if props and type(props) == "table" then
        if props.colour then
            if type(props.colour) == "table" then
                local r = math.floor(props.colour.r or props.colour[1] or 255)
                local g = math.floor(props.colour.g or props.colour[2] or 255)
                local b = math.floor(props.colour.b or props.colour[3] or 255)
                SetVehicleCustomPrimaryColour(vehicle, r, g, b)
                SetVehicleCustomSecondaryColour(vehicle, r, g, b)
            else
                local colorId = tonumber(props.colour) or 0
                -- FIXED: Native name is plural 'SetVehicleColours'
                SetVehicleColours(vehicle, colorId, colorId) 
            end
        end
        if props.plate then
            SetVehicleNumberPlateText(vehicle, props.plate)
        end
    end
    
    Framework.Client.VehicleSetFuel(vehicle, 100.0)
    return not NetworkGetEntityIsNetworked(vehicle)
end

-- Pre-checks the vehicle model and requested plates before spawning
local function RequestVehicleSpawnDetails(model, plate)
    local hash = ConvertModelToHash(model)
    local vehicleType = GetVehicleTypeString(hash)
    
    if not IsModelInCdimage(hash) then
        Framework.Client.Notify("Vehicle model does not exist - contact an admin", "error")
        print(string.format("^1Vehicle model %s does not exist", tostring(model)))
        return false
    end
    
    local hasSeats = GetVehicleModelNumberOfSeats(hash) > 0
    
    if plate and plate ~= "" then
        local isValidPlate = true
        if IsValidGTAPlate then
            isValidPlate = IsValidGTAPlate(plate)
        else
            isValidPlate = #plate <= 8
        end
        
        if not isValidPlate then
            Framework.Client.Notify("This vehicle's plate is invalid (hit F8 for more details)", "error")
            print(string.format("^1This vehicle is trying to spawn with the plate '%s' which is invalid for a GTA vehicle plate", tostring(plate):upper()))
            print("^1Vehicle plates must be 8 characters long maximum, and can contain ONLY numbers, letters and spaces")
            return false
        end
    end
    
    lib.requestModel(hash, 60000)
    
    if IsPedRagdoll(cache.ped) then
        Framework.Client.Notify("You are currently in a ragdoll state", "error")
        SetModelAsNoLongerNeeded(hash)
        return false
    end
    
    return hash, vehicleType, hasSeats
end

-- Finalization logic to warp the ped, track keys, and assign state records
local function FinalizeVehicleSpawn(vehicle, vehicleId, modelHash, warpPed, plate, props, origin)
    if not vehicle or vehicle == 0 then
        Framework.Client.Notify("Could not spawn vehicle - hit F8 for details", "error")
        print("^1Vehicle does not exist (vehicle = 0)")
        return false
    end
    
    if IsPedRagdoll(cache.ped) then
        Framework.Client.Notify("You are currently in a ragdoll state", "error")
        SetModelAsNoLongerNeeded(modelHash)
        return false
    end
    
    if warpPed then
        ClearPedTasks(cache.ped)
        local success = pcall(function()
            lib.waitFor(function()
                if GetPedInVehicleSeat(vehicle, -1) == cache.ped then
                    return true
                end
                TaskWarpPedIntoVehicle(cache.ped, vehicle, -1)
            end, nil, 5000)
        end)
        if not success then
            print("^1[ERROR] Could not warp you into the vehicle^0")
            return false
        end
    end
    
    if plate and plate ~= "" then
        SetVehicleNumberPlateText(vehicle, plate)
    end
    
    if props and type(props) == "table" then
        ApplySpawnedVehicleProperties(vehicle, props)
    end
    
    if GetResourceState("brazzers-fakeplates") == "started" then
        local fakePlate = lib.callback.await("jg-dealerships:server:brazzers-get-fakeplate-from-plate", false, plate)
        if fakePlate then
            plate = fakePlate
            SetVehicleNumberPlateText(vehicle, fakePlate)
        end
    end
    
    if not plate or plate == "" then
        plate = Framework.Client.GetPlate(vehicle)
    end
    
    if not plate or plate == "" then
        print("^1[ERROR] The game thinks the vehicle has no plate - absolutely no idea how you've managed this")
        return false
    end
    
    Entity(vehicle).state:set("vehicleid", vehicleId, true)
    Framework.Client.VehicleGiveKeys(plate, vehicle, origin)
    
    return true
end

-- Server setter handler triggered when server handles vehicle spawning routes
local function OnServerVehicleCreated(netId, coords, warpPed, modelHash, vehicleId, plate, props, origin)
    SetModelAsNoLongerNeeded(modelHash)
    
    if not netId then
        Framework.Client.Notify("Could not spawn vehicle - hit F8 for details", "error")
        print("^1Server returned false for netId")
        return false
    end
    
    lib.waitFor(function()
        if NetworkDoesNetworkIdExist(netId) and NetworkDoesEntityExistWithNetworkId(netId) then
            return true
        end
    end, "Timed out while waiting for a server-setter netId to exist on client", 10000)
    
    local vehicle = NetToVeh(netId)
    
    lib.waitFor(function()
        if DoesEntityExist(vehicle) then
            return true
        end
    end, "Timed out while waiting for a server-setter vehicle to exist on client", 10000)
    
    if coords then
        SetEntityCoords(cache.ped, coords.x, coords.y, coords.z, false, false, false, false)
    end
    
    local success = FinalizeVehicleSpawn(vehicle, vehicleId, modelHash, warpPed, plate, props, origin)
    if not success then
        DeleteEntity(vehicle)
        return false
    end
    
    return true
end

-- Traditional local spawning fallback helper
local function SpawnVehicleLocal(model, coords, plate, networked)
    lib.requestModel(model, 60000)
    
    local isNetworked = true
    if networked == false then isNetworked = false end
    
    local vehicle = CreateVehicle(model, coords.x, coords.y, coords.z, coords.w, isNetworked, isNetworked)
    
    lib.waitFor(function()
        if DoesEntityExist(vehicle) then
            return true
        end
    end, "Timed out while trying to spawn in vehicle (client)", 10000)
    
    SetModelAsNoLongerNeeded(model)
    
    if plate and plate ~= "" then
        SetVehicleNumberPlateText(vehicle, plate)
    end
    
    return vehicle
end

-- Main client side vehicle spawning entry method mapping layer
function SpawnVehicleClient(origin, model, plate, coords, warpPed, props, vehicleId)
    if Config.SpawnVehiclesWithServerSetter then
        print("^1This function is disabled as client spawning is enabled")
        return false
    end
    
    local hash, vehicleType, hasSeats = RequestVehicleSpawnDetails(model, plate)
    if not hash then
        return false
    end
    
    local vehicle = SpawnVehicleLocal(hash, coords, plate, true)
    if not vehicle then
        return false
    end
    
    local success = FinalizeVehicleSpawn(vehicle, vehicleId, hash, warpPed, plate, props, origin)
    if not success then
        DeleteEntity(vehicle)
        return false
    end
    
    return vehicle
end

-- State Bag Change Interceptors
AddStateBagChangeHandler("vehInit", "", function(bagName, key, value)
    if not value then return end
    local vehicle = GetEntityFromStateBagName(bagName)
    if vehicle == 0 then return end
    
    lib.waitFor(function()
        if not IsEntityWaitingForWorldCollision(vehicle) then
            return true
        end
    end)
    
    if NetworkGetEntityOwner(vehicle) ~= cache.playerId then
        return
    end
    
    local state = Entity(vehicle).state
    SetVehicleOnGroundProperly(vehicle)
    
    SetTimeout(0, function()
        state:set("vehInit", nil, true)
    end)
end)

AddStateBagChangeHandler("dealershipVehCreatedApplyProps", "", function(bagName, key, value)
    if not value then return end
    local vehicle = GetEntityFromStateBagName(bagName)
    if vehicle == 0 then return end
    
    SetTimeout(0, function()
        local state = Entity(vehicle).state
        for i = 1, 10 do
            if NetworkGetEntityOwner(vehicle) == cache.playerId then
                local success = ApplySpawnedVehicleProperties(vehicle, value)
                if success then
                    state:set("dealershipVehCreatedApplyProps", nil, true)
                    break
                end
            end
            Wait(100)
        end
    end)
end)

-- Register script communication callbacks
lib.callback.register("jg-dealerships:client:req-vehicle-and-get-spawn-details", RequestVehicleSpawnDetails)
lib.callback.register("jg-dealerships:client:on-server-vehicle-created", OnServerVehicleCreated)