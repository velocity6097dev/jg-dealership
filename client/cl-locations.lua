local blips, points = {}, {}

---@param name string
---@param coords vector3
---@param blipId integer
---@param blipColour integer
---@param blipScale number
local function createBlip(name, coords, blipId, blipColour, blipScale)
  local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
  SetBlipSprite(blip, blipId)
  SetBlipColour(blip, blipColour)
  SetBlipScale(blip, blipScale)
  SetBlipAsShortRange(blip, true)
  BeginTextCommandSetBlipName("STRING")
  AddTextComponentString(name)
  EndTextCommandSetBlipName(blip)
  return blip
end

---@param coords vector3
---@param marker table
local function drawMarkerOnFrame(coords, marker)
  ---@diagnostic disable-next-line: missing-parameter
  DrawMarker(marker.id, coords.x, coords.y, coords.z, 0, 0, 0, 0, 0, 0, marker.size.x, marker.size.y, marker.size.z, marker.color.r, marker.color.g, marker.color.b, marker.color.a, marker.bobUpAndDown, marker.faceCamera, 0, marker.rotate, marker.drawOnEnts)
end

---@param coords vector3
---@param dist number
---@param marker table | false | nil
---@param onEnter function
---@param onExit function
---@param nearby function | nil
local function createLocation(coords, dist, marker, onEnter, onExit, nearby)
  if not coords then return end
  
  local point = lib.points.new({
    coords = coords,
    distance = dist,
  })

  function point:onEnter() onEnter(self) end
  function point:onExit() onExit(self) end
  if nearby then function point:nearby() nearby(self) end end
  points[#points+1] = point
  
  if not marker then return end

  local markerPoint = lib.points.new({
    coords = coords,
    distance = dist * 4,
  })

  function markerPoint:nearby() drawMarkerOnFrame(coords, marker) end
  points[#points+1] = markerPoint
end

local function createDealershipZonesAndBlips()
  for _, point in ipairs(points) do 
    if point and point.remove then point:remove() end 
  end
  points = {}

  for _, blip in ipairs(blips) do 
    if DoesBlipExist(blip) then RemoveBlip(blip) end 
  end 
  blips = {}

  local dealerships = lib.callback.await("jg-dealerships:server:get-locations-data", false)
  if not dealerships then return end

  for _, dealer in ipairs(dealerships) do
    if dealer and dealer.config then
      
      -- Standardize configuration extraction to avoid '?' syntax crashes
      local srCfg = dealer.config.openShowroom
      local srCoords = (type(srCfg) == "table" and srCfg.coords) or srCfg
      local srSize = (type(srCfg) == "table" and srCfg.size) or 5

      if IsShowroomAccessAllowed(dealer.name) or (dealer.type == "owned" and dealer.managementAccess) then
        if srCoords then
          createLocation(
            srCoords,
            srSize,
            not dealer.config.hideMarkers and dealer.config.markers or false,
            function() Framework.Client.ShowTextUI(Config.OpenShowroomPrompt) end,
            function() Framework.Client.HideTextUI() end,
            function()
              if IsControlJustPressed(0, Config.OpenShowroomKeyBind) then
                TriggerEvent("jg-dealerships:client:open-showroom", dealer.name)
              end
            end
          )
        end

        if dealer.config.enableSellVehicle then
          local sellCfg = dealer.config.sellVehicle
          local sellCoords = (type(sellCfg) == "table" and sellCfg.coords) or sellCfg
          local sellSize = (type(sellCfg) == "table" and sellCfg.size) or 5

          if sellCoords then
            createLocation(
              sellCoords,
              sellSize,
              not dealer.config.hideMarkers and dealer.config.markers or false,
              function() Framework.Client.ShowTextUI(Config.SellVehiclePrompt) end,
              function() Framework.Client.HideTextUI() end,
              function()
                if IsControlJustPressed(0, Config.SellVehicleKeyBind) then
                  TriggerEvent("jg-dealerships:client:sell-vehicle", dealer.name)
                end
              end
            )
          end
        end

        if not dealer.config.hideBlip and srCoords then
          local blipName = (Locale.dealership or "Dealership") .. ": " .. (dealer.label or "")
          local blipData = dealer.config.blip or {}
          local blip = createBlip(
            blipName,
            srCoords,
            blipData.id or 326,
            blipData.color or 3,
            blipData.scale or 0.8
          )
          blips[#blips + 1] = blip
        end
      end
    
      if dealer.type == "owned" and dealer.managementAccess then
        local mgmtCfg = dealer.config.openManagement or dealer.config.management
        local mgmtCoords = (type(mgmtCfg) == "table" and mgmtCfg.coords) or mgmtCfg
        local mgmtSize = (type(mgmtCfg) == "table" and mgmtCfg.size) or 5

        if mgmtCoords then
          createLocation(
            mgmtCoords,
            mgmtSize,
            not dealer.config.hideMarkers and dealer.config.markers or false,
            function() Framework.Client.ShowTextUI(Config.OpenManagementPrompt) end,
            function() Framework.Client.HideTextUI() end,
            function()
              if IsControlJustPressed(0, Config.OpenManagementKeyBind) then
                TriggerEvent("jg-dealerships:client:open-management", dealer.name)
              end
            end
          )
        end
      end

    end
  end
end

RegisterNetEvent("jg-dealerships:client:update-blips-text-uis", function()
  Wait(1000)
  createDealershipZonesAndBlips()
  -- Added safe wrapper to prevent nil errors
  if type(SpawnAllDealershipDisplayVehicles) == "function" then 
    SpawnAllDealershipDisplayVehicles() 
  end
end)

CreateThread(function()
  Wait(2000) -- Increased wait to ensure cl-display-vehicles loads first
  createDealershipZonesAndBlips()
  -- Added safe wrapper to prevent nil errors
  if type(SpawnAllDealershipDisplayVehicles) == "function" then 
    SpawnAllDealershipDisplayVehicles() 
  end
end)