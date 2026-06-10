-- ============================================================
--  Auto-refactored by lua_refactor.py
--  All original logic is preserved exactly.
-- ============================================================

local tbl, tbl_1, tmp, tmp_2, tmp_4, tbl_3, tmp_6, tmp_8, tmp_10, tmp_12, tmp_14, tmp_16, tmp_18, registerNetEvent, eventName_3, tmp_20
tbl = {}
tbl_1 = {}
tmp = true
tmp_2 = false
tmp_4 = false
tbl_3 = {}
tmp_6 = 30
tmp_8 = 31
tmp_10 = 44
tmp_12 = 22
tmp_14 = 200
tbl_3[1] = tmp_6
tbl_3[2] = tmp_8
tbl_3[3] = tmp_10
tbl_3[4] = tmp_12
tbl_3[5] = tmp_14
function tmp_6(dealershipId)
  local getEntityCoords, tbl_2, mathLib, mathLib_1, cache, tbl_4, eventName_2, deleteEntity, tbl_5, tbl_6, tbl_7, tbl_8, tbl_9, tbl_10, locale, freezeEntityPos, mathLib_2, mathLib_3, mathLib_4, cache_1, tmp_24, getEntityHeading, tmp_27, tmp_28, tmp_30, config_7, tmp_32, tmp_33, tmp_34, tmp_35, tmp_36, tmp_37, tmp_38, tmp_39, tmp_40, tmp_41
  getEntityCoords = GetEntityCoords
  tbl_2 = dealershipId
  getEntityCoords = getEntityCoords(tbl_2)
  tbl_2 = GetEntityRotation
  mathLib = dealershipId
  mathLib_1 = 2
  tbl_2 = tbl_2(mathLib, mathLib_1)
  mathLib = math
  mathLib = mathLib.rad
  mathLib_1 = tbl_2.z
  mathLib = mathLib(mathLib_1)
  mathLib_1 = GetModelDimensions
  cache = GetEntityModel
  tbl_4 = dealershipId
  cache, tbl_4, eventName_2, deleteEntity, tbl_5, tbl_6, tbl_7, tbl_8, tbl_9, tbl_10, locale, freezeEntityPos, mathLib_2, mathLib_3, mathLib_4, cache_1, tmp_24, getEntityHeading, tmp_27, tmp_28, tmp_30, config_7, tmp_32, tmp_33, tmp_34, tmp_35, tmp_36, tmp_37, tmp_38, tmp_39, tmp_40 = cache(tbl_4)
  mathLib_1, cache = mathLib_1(cache, tbl_4, eventName_2, deleteEntity, tbl_5, tbl_6, tbl_7, tbl_8, tbl_9, tbl_10, locale, freezeEntityPos, mathLib_2, mathLib_3, mathLib_4, cache_1, tmp_24, getEntityHeading, tmp_27, tmp_28, tmp_30, config_7, tmp_32, tmp_33, tmp_34, tmp_35, tmp_36, tmp_37, tmp_38, tmp_39, tmp_40, tmp_41)
  tbl_4 = cache.x
  eventName_2 = mathLib_1.x
  tbl_4 = tbl_4 - eventName_2
  eventName_2 = cache.y
  deleteEntity = mathLib_1.y
  eventName_2 = eventName_2 - deleteEntity
  deleteEntity = cache.z
  tbl_5 = mathLib_1.z
  deleteEntity = deleteEntity - tbl_5
  deleteEntity = deleteEntity / 2
  tbl_5 = {}
  tbl_6 = {}
  tbl_7 = tbl_4 / 2
  tbl_8 = 0
  tbl_6[1] = tbl_7
  tbl_6[2] = tbl_8
  tbl_7 = {}
  tbl_8 = 0
  tbl_9 = eventName_2 / 2
  tbl_7[1] = tbl_8
  tbl_7[2] = tbl_9
  tbl_8 = {}
  tbl_9 = tbl_4 / 2
  tbl_9 = -tbl_9
  tbl_10 = 0
  tbl_8[1] = tbl_9
  tbl_8[2] = tbl_10
  tbl_9 = {}
  tbl_10 = 0
  locale = eventName_2 / 2
  locale = -locale
  tbl_9[1] = tbl_10
  tbl_9[2] = locale
  tbl_5[1] = tbl_6
  tbl_5[2] = tbl_7
  tbl_5[3] = tbl_8
  tbl_5[4] = tbl_9
  tbl_6 = ipairs
  tbl_7 = tbl_5
  tbl_6, tbl_7, tbl_8 = tbl_6(tbl_7)
  for tbl_10, locale in tbl_6, tbl_7, tbl_8 do
    freezeEntityPos = locale[1]
    mathLib_2 = math
    mathLib_2 = mathLib_2.cos
    mathLib_3 = mathLib
    mathLib_2 = mathLib_2(mathLib_3)
    freezeEntityPos = freezeEntityPos * mathLib_2
    mathLib_2 = locale[2]
    mathLib_3 = math
    mathLib_3 = mathLib_3.sin
    mathLib_4 = mathLib
    mathLib_3 = mathLib_3(mathLib_4)
    mathLib_2 = mathLib_2 * mathLib_3
    freezeEntityPos = freezeEntityPos - mathLib_2
    mathLib_2 = locale[1]
    mathLib_3 = math
    mathLib_3 = mathLib_3.sin
    mathLib_4 = mathLib
    mathLib_3 = mathLib_3(mathLib_4)
    mathLib_2 = mathLib_2 * mathLib_3
    mathLib_3 = locale[2]
    mathLib_4 = math
    mathLib_4 = mathLib_4.cos
    cache_1 = mathLib
    mathLib_4 = mathLib_4(cache_1)
    mathLib_3 = mathLib_3 * mathLib_4
    mathLib_2 = mathLib_2 + mathLib_3
    mathLib_3 = vector3
    mathLib_4 = getEntityCoords.x
    cache_1 = getEntityCoords.y
    tmp_24 = getEntityCoords.z
    tmp_24 = tmp_24 + deleteEntity
    mathLib_3 = mathLib_3(mathLib_4, cache_1, tmp_24)
    mathLib_4 = vector3
    cache_1 = getEntityCoords.x
    cache_1 = cache_1 + freezeEntityPos
    tmp_24 = getEntityCoords.y
    tmp_24 = tmp_24 + mathLib_2
    getEntityHeading = getEntityCoords.z
    getEntityHeading = getEntityHeading + deleteEntity
    mathLib_4 = mathLib_4(cache_1, tmp_24, getEntityHeading)
    cache_1 = StartShapeTestRay
    tmp_24 = mathLib_3.x
    getEntityHeading = mathLib_3.y
    tmp_27 = mathLib_3.z
    tmp_28 = mathLib_4.x
    tmp_30 = mathLib_4.y
    config_7 = mathLib_4.z
    tmp_32 = -1
    tmp_33 = dealershipId
    tmp_34 = 0
    cache_1 = cache_1(tmp_24, getEntityHeading, tmp_27, tmp_28, tmp_30, config_7, tmp_32, tmp_33, tmp_34)
    tmp_24 = GetShapeTestResult
    getEntityHeading = cache_1
    tmp_24, getEntityHeading, tmp_27, tmp_28 = tmp_24(getEntityHeading)
    config_7 = Config
    config_7 = config_7.Debug
    if config_7 then
      config_7 = DrawLine
      tmp_32 = mathLib_3.x
      tmp_33 = mathLib_3.y
      tmp_34 = mathLib_3.z
      tmp_35 = mathLib_4.x
      tmp_36 = mathLib_4.y
      tmp_37 = mathLib_4.z
      tmp_38 = 255
      tmp_39 = 0
      tmp_40 = 0
      tmp_41 = 255
      config_7(tmp_32, tmp_33, tmp_34, tmp_35, tmp_36, tmp_37, tmp_38, tmp_39, tmp_40, tmp_41)
    end
    if 1 == getEntityHeading then
      config_7 = cache
      config_7 = config_7.ped
      if tmp_30 ~= config_7 then
        config_7 = true
        return config_7
      end
    end
  end
  tbl_6 = false
  return tbl_6
end
function tmp_8(dealershipId, cb)
  local tbl_2, mathLib, mathLib_1, cache, tbl_4, eventName_2, deleteEntity, tbl_5, tbl_6
  tbl_2 = GetEntityRotation
  mathLib = dealershipId
  mathLib_1 = 2
  tbl_2 = tbl_2(mathLib, mathLib_1)
  mathLib = tbl_2.z
  mathLib = mathLib + cb
  mathLib_1 = SetEntityRotation
  cache = dealershipId
  tbl_4 = tbl_2.x
  eventName_2 = tbl_2.y
  deleteEntity = mathLib
  tbl_5 = 2
  tbl_6 = true
  mathLib_1(cache, tbl_4, eventName_2, deleteEntity, tbl_5, tbl_6)
end
function tmp_10(dealershipId)
  local getEntityCoords, tbl_2, mathLib, mathLib_1, cache
  getEntityCoords = math
  getEntityCoords = getEntityCoords.rad
  tbl_2 = dealershipId
  getEntityCoords = getEntityCoords(tbl_2)
  tbl_2 = vector3
  mathLib = math
  mathLib = mathLib.sin
  mathLib_1 = getEntityCoords
  mathLib = mathLib(mathLib_1)
  mathLib = -mathLib
  mathLib_1 = math
  mathLib_1 = mathLib_1.cos
  cache = getEntityCoords
  mathLib_1 = mathLib_1(cache)
  cache = 0
  return tbl_2(mathLib, mathLib_1, cache)
end
function tmp_12(dealershipId, cb, defaultVehicle)
  local mathLib, mathLib_1, cache, tbl_4, eventName_2, deleteEntity, tbl_5, tbl_6, tbl_7, tbl_8, tbl_9, tbl_10, locale
  mathLib = GetEntityCoords
  mathLib_1 = dealershipId
  mathLib = mathLib(mathLib_1)
  mathLib_1 = GetEntityCoords
  cache = cache
  cache = cache.ped
  mathLib_1 = mathLib_1(cache)
  cache = GetEntityHeading
  tbl_4 = dealershipId
  cache = cache(tbl_4)
  tbl_4 = tmp_10
  eventName_2 = cache
  tbl_4 = tbl_4(eventName_2)
  eventName_2 = nil
  if "forward" == cb then
    deleteEntity = tbl_4 * defaultVehicle
    eventName_2 = mathLib + deleteEntity
  elseif "backward" == cb then
    deleteEntity = tbl_4 * defaultVehicle
    eventName_2 = mathLib - deleteEntity
  elseif "left" == cb then
    deleteEntity = vector3
    tbl_5 = tbl_4.y
    tbl_5 = -tbl_5
    tbl_6 = tbl_4.x
    tbl_7 = 0
    deleteEntity = deleteEntity(tbl_5, tbl_6, tbl_7)
    tbl_5 = deleteEntity * defaultVehicle
    eventName_2 = mathLib + tbl_5
  elseif "right" == cb then
    deleteEntity = vector3
    tbl_5 = tbl_4.y
    tbl_6 = tbl_4.x
    tbl_6 = -tbl_6
    tbl_7 = 0
    deleteEntity = deleteEntity(tbl_5, tbl_6, tbl_7)
    tbl_5 = deleteEntity * defaultVehicle
    eventName_2 = mathLib + tbl_5
  end
  deleteEntity = mathLib_1 - eventName_2
  deleteEntity = #deleteEntity
  if deleteEntity <= 10.0 then
    deleteEntity = SetEntityCoordsNoOffset
    tbl_5 = dealershipId
    tbl_6 = eventName_2.x
    tbl_7 = eventName_2.y
    tbl_8 = eventName_2.z
    tbl_9 = false
    tbl_10 = false
    locale = false
    deleteEntity(tbl_5, tbl_6, tbl_7, tbl_8, tbl_9, tbl_10, locale)
  end
end
function tmp_14(dealershipId, cb, defaultVehicle, defaultColor, p4)
  local cache, tbl_4
  cache = lib
  cache = cache.points
  cache = cache.new
  tbl_4 = {}
  tbl_4.coords = dealershipId
  tbl_4.distance = cb
  cache = cache(tbl_4)
  function tbl_4(dealershipId_1)
    local eventName
    eventName = defaultVehicle
    eventName()
  end
  cache.onEnter = tbl_4
  function tbl_4(dealershipId_1)
    local eventName
    eventName = defaultColor
    eventName()
  end
  cache.onExit = tbl_4
  if p4 then
    function tbl_4(dealershipId_1)
      local eventName
      eventName = p4
      eventName()
    end
    cache.nearby = tbl_4
  end
  return cache
end
function tmp_16(dealershipId)
  local getEntityCoords, tbl_2, mathLib, mathLib_1, cache, tbl_4, eventName_2, deleteEntity, tbl_5
  getEntityCoords = tbl
  getEntityCoords = getEntityCoords[dealershipId]
  if getEntityCoords then
    getEntityCoords = tbl
    getEntityCoords = getEntityCoords[dealershipId]
    getEntityCoords = #getEntityCoords
    if getEntityCoords > 0 then
      getEntityCoords = ipairs
      tbl_2 = tbl
      tbl_2 = tbl_2[dealershipId]
      getEntityCoords, tbl_2, mathLib = getEntityCoords(tbl_2)
      for cache, tbl_4 in getEntityCoords, tbl_2, mathLib do
        deleteEntity = tbl_4
        eventName_2 = tbl_4.remove
        eventName_2(deleteEntity)
      end
    end
  end
  getEntityCoords = json
  getEntityCoords = getEntityCoords.decode
  tbl_2 = LocalPlayer
  tbl_2 = tbl_2.state
  mathLib = "displayVehicles:%s"
  mathLib = mathLib.format
  mathLib_1 = dealershipId
  mathLib = mathLib(mathLib_1)
  tbl_2 = tbl_2[mathLib]
  if not tbl_2 then
    tbl_2 = "{}"
  end
  getEntityCoords = getEntityCoords(tbl_2)
  if getEntityCoords then
    tbl_2 = #getEntityCoords
    if tbl_2 > 0 then
      tbl_2 = ipairs
      mathLib = getEntityCoords
      tbl_2, mathLib, mathLib_1 = tbl_2(mathLib)
      for tbl_4, eventName_2 in tbl_2, mathLib, mathLib_1 do
        deleteEntity = DeleteEntity
        tbl_5 = eventName_2.entity
        deleteEntity(tbl_5)
      end
    end
  end
end
function tmp_18(dealershipId)
  local getEntityCoords, tbl_2
  getEntityCoords = tbl_1
  getEntityCoords = getEntityCoords[dealershipId]
  if getEntityCoords then
    return
  end
  getEntityCoords = tbl_1
  getEntityCoords[dealershipId] = true
  getEntityCoords = CreateThread
  function tbl_2()
    local lib, eventName, tmp_1, vehicleList, config_2, ipairsFn, tmp_7, tmp_9, tmp_11, tmp_13, tmp_15, tmp_17, tmp_19, modelToHash, setEntityHeading, tmp_21, config_3, config_4, config_5, tmp_22, tmp_23, tmp_25, tmp_26, config_6, tmp_29, tmp_31
    lib = tmp_16
    eventName = dealershipId
    lib(eventName)
    lib = lib
    lib = lib.callback
    lib = lib.await
    eventName = "jg-dealerships:server:get-display-vehicles"
    tmp_1 = false
    vehicleList = dealershipId
    lib = lib(eventName, tmp_1, vehicleList)
    if not lib then
      tmp_1 = dealershipId
      eventName = tbl_1
      eventName[tmp_1] = false
      return
    end
    eventName = {}
    tmp_1 = lib.isManager
    vehicleList = lib.vehicles
    config_2 = Config
    config_2 = config_2.DealershipLocations
    ipairsFn = dealershipId
    config_2 = config_2[ipairsFn]
    ipairsFn = ipairs
    tmp_7 = vehicleList
    ipairsFn, tmp_7, tmp_9 = ipairsFn(tmp_7)
    for tmp_13, tmp_15 in ipairsFn, tmp_7, tmp_9 do
      tmp_17 = tmp_15.vehicle
      tmp_19 = json
      tmp_19 = tmp_19.decode
      modelToHash = tmp_15.coords
      tmp_19 = tmp_19(modelToHash)
      modelToHash = ConvertModelToHash
      setEntityHeading = tmp_17
      modelToHash = modelToHash(setEntityHeading)
      tmp_17 = modelToHash
      modelToHash = lib
      modelToHash = modelToHash.requestModel
      setEntityHeading = tmp_17
      tmp_21 = 60000
      modelToHash(setEntityHeading, tmp_21)
      modelToHash = CreateVehicle
      setEntityHeading = tmp_17
      tmp_21 = tmp_19.x
      config_3 = tmp_19.y
      config_4 = tmp_19.z
      config_5 = tmp_19.w
      tmp_22 = false
      tmp_23 = false
      modelToHash = modelToHash(setEntityHeading, tmp_21, config_3, config_4, config_5, tmp_22, tmp_23)
      setEntityHeading = SetEntityHeading
      tmp_21 = modelToHash
      config_3 = tmp_19.w
      setEntityHeading(tmp_21, config_3)
      setEntityHeading = SetVehicleColour
      tmp_21 = modelToHash
      config_3 = tmp_15.color
      setEntityHeading(tmp_21, config_3)
      setEntityHeading = SetVehicleDoorsLocked
      tmp_21 = modelToHash
      config_3 = 2
      setEntityHeading(tmp_21, config_3)
      setEntityHeading = SetVehicleNumberPlateText
      tmp_21 = modelToHash
      config_3 = Config
      config_3 = config_3.DisplayVehiclesPlate
      setEntityHeading(tmp_21, config_3)
      setEntityHeading = SetEntityInvincible
      tmp_21 = modelToHash
      config_3 = true
      setEntityHeading(tmp_21, config_3)
      setEntityHeading = SetModelAsNoLongerNeeded
      tmp_21 = tmp_17
      setEntityHeading(tmp_21)
      setEntityHeading = lib
      setEntityHeading = setEntityHeading.waitFor
      function tmp_21()
        local framework, eventName_1
        framework = DoesEntityExist
        eventName_1 = modelToHash
        framework = framework(eventName_1)
        if framework then
          framework = true
          if framework then
            goto lbl_10
          end
        end
        framework = nil
        ::lbl_10::
        return framework
      end
      config_3 = nil
      config_4 = 5000
      setEntityHeading(tmp_21, config_3, config_4)
      setEntityHeading = Entity
      tmp_21 = modelToHash
      setEntityHeading = setEntityHeading(tmp_21)
      setEntityHeading = setEntityHeading.state
      tmp_21 = setEntityHeading
      setEntityHeading = setEntityHeading.set
      config_3 = "isDisplayVehicle"
      config_4 = true
      config_5 = false
      setEntityHeading(tmp_21, config_3, config_4, config_5)
      setEntityHeading = GetModelDimensions
      tmp_21 = GetEntityModel
      config_3 = modelToHash
      tmp_21, config_3, config_4, config_5, tmp_22, tmp_23, tmp_25, tmp_26, config_6, tmp_29 = tmp_21(config_3)
      setEntityHeading, tmp_21 = setEntityHeading(tmp_21, config_3, config_4, config_5, tmp_22, tmp_23, tmp_25, tmp_26, config_6, tmp_29, tmp_31)
      config_3 = setEntityHeading.x
      config_4 = 0
      config_3 = config_4 - config_3
      config_4 = tmp_21.x
      config_3 = config_3 + config_4
      config_3 = config_3 + 1.0
      config_4 = Config
      config_4 = config_4.ViewInShowroomPrompt
      config_5 = Config
      config_5 = config_5.DrawText
      if "auto" == config_5 then
        config_5 = GetResourceState
        tmp_22 = "jg-textui"
        config_5 = config_5(tmp_22)
        if "started" == config_5 then
          goto lbl_120
        end
      end
      config_5 = Config
      config_5 = config_5.DrawText
      ::lbl_120::
      if "jg-textui" == config_5 then
        config_5 = "<h4 style='margin-bottom:5px'>"
        tmp_22 = tmp_15.brand
        if not tmp_22 then
          tmp_22 = ""
        end
        tmp_23 = " "
        tmp_25 = tmp_15.model
        if not tmp_25 then
          tmp_25 = ""
        end
        tmp_26 = "</h4><p>"
        config_6 = Config
        config_6 = config_6.ViewInShowroomPrompt
        tmp_29 = "</p>"
        config_5 = config_5 .. tmp_22 .. tmp_23 .. tmp_25 .. tmp_26 .. config_6 .. tmp_29
        config_4 = config_5
      end
      config_5 = Config
      config_5 = config_5.DisplayVehiclesHidePurchasePrompt
      if not config_5 then
        config_5 = IsShowroomAccessAllowed
        tmp_22 = dealershipId
        config_5 = config_5(tmp_22)
        if not config_5 then
          config_5 = config_2.type
          if not ("owned" == config_5 and tmp_1) then
            goto lbl_171
          end
        end
        config_5 = tmp_2
        if not config_5 then
          config_5 = tbl
          config_5 = #config_5
          tmp_22 = config_5 + 1
          config_5 = tbl
          tmp_23 = tmp_14
          tmp_25 = vector4
          tmp_26 = tmp_19.x
          config_6 = tmp_19.y
          tmp_29 = tmp_19.z
          tmp_31 = tmp_19.w
          tmp_25 = tmp_25(tmp_26, config_6, tmp_29, tmp_31)
          tmp_26 = config_3
          function config_6()
            local framework, eventName_1
            framework = Framework
            framework = framework.Client
            framework = framework.ShowTextUI
            eventName_1 = config_4
            framework(eventName_1)
          end
          function tmp_29()
            local framework, eventName_1
            framework = Framework
            framework = framework.Client
            framework = framework.HideTextUI
            framework()
          end
          function tmp_31()
            local framework, eventName_1, config_1, tmp_3, tmp_5
            framework = IsControlJustPressed
            eventName_1 = 0
            config_1 = Config
            config_1 = config_1.ViewInShowroomKeyBind
            framework = framework(eventName_1, config_1)
            if framework then
              framework = tmp_2
              if not framework then
                framework = TriggerEvent
                eventName_1 = "jg-dealerships:client:open-showroom"
                config_1 = dealershipId
                tmp_3 = tmp_15.vehicle
                tmp_5 = tmp_15.color
                framework(eventName_1, config_1, tmp_3, tmp_5)
              end
            end
          end
          tmp_23 = tmp_23(tmp_25, tmp_26, config_6, tmp_29, tmp_31)
          config_5[tmp_22] = tmp_23
        end
      end
      ::lbl_171::
      config_5 = #eventName
      config_5 = config_5 + 1
      eventName[config_5] = tmp_15
      tmp_22 = eventName[config_5]
      tmp_22.entity = modelToHash
    end
    ipairsFn = LocalPlayer
    ipairsFn = ipairsFn.state
    tmp_7 = ipairsFn
    ipairsFn = ipairsFn.set
    tmp_9 = "displayVehicles:%s"
    tmp_9 = tmp_9.format
    tmp_11 = dealershipId
    tmp_9 = tmp_9(tmp_11)
    tmp_11 = json
    tmp_11 = tmp_11.encode
    tmp_13 = eventName
    tmp_11, tmp_13, tmp_15, tmp_17, tmp_19, modelToHash, setEntityHeading, tmp_21, config_3, config_4, config_5, tmp_22, tmp_23, tmp_25, tmp_26, config_6, tmp_29 = tmp_11(tmp_13)
    ipairsFn(tmp_7, tmp_9, tmp_11, tmp_13, tmp_15, tmp_17, tmp_19, modelToHash, setEntityHeading, tmp_21, config_3, config_4, config_5, tmp_22, tmp_23, tmp_25, tmp_26, config_6, tmp_29, tmp_31)
    tmp_7 = dealershipId
    ipairsFn = tbl
    tmp_9 = tbl
    ipairsFn[tmp_7] = tmp_9
    tmp_7 = dealershipId
    ipairsFn = tbl_1
    ipairsFn[tmp_7] = false
  end
  getEntityCoords(tbl_2)
end
function registerNetEvent()
  local config, getEntityCoords, tbl_2, mathLib, mathLib_1, cache, tbl_4
  config = pairs
  getEntityCoords = Config
  getEntityCoords = getEntityCoords.DealershipLocations
  config, getEntityCoords, tbl_2 = config(getEntityCoords)
  for mathLib_1 in config, getEntityCoords, tbl_2 do
    cache = tmp_18
    tbl_4 = mathLib_1
    cache(tbl_4)
  end
end
SpawnAllDealershipDisplayVehicles = registerNetEvent
registerNetEvent = RegisterNetEvent
eventName_3 = "jg-dealerships:client:spawn-display-vehicles"
function tmp_20(dealershipId)
  local getEntityCoords, tbl_2
  getEntityCoords = tmp_18
  tbl_2 = dealershipId
  getEntityCoords(tbl_2)
end
registerNetEvent(eventName_3, tmp_20)
registerNetEvent = RegisterNUICallback
eventName_3 = "create-display-vehicle"
function tmp_20(dealershipId, cb)
  local tbl_2, mathLib, mathLib_1, cache, tbl_4, eventName_2, deleteEntity, tbl_5, tbl_6, tbl_7, tbl_8, tbl_9, tbl_10, locale, freezeEntityPos, mathLib_2, mathLib_3, mathLib_4, cache_1, tmp_24, getEntityHeading, tmp_27, tmp_28, tmp_30, config_7
  tbl_2 = tmp_4
  if tbl_2 then
    tbl_2 = cb
    mathLib = false
    return tbl_2(mathLib)
  end
  tbl_2 = Framework
  tbl_2 = tbl_2.Client
  tbl_2 = tbl_2.HideTextUI
  tbl_2()
  tbl_2 = true
  tmp_2 = tbl_2
  tbl_2 = dealershipId.dealershipId
  mathLib = dealershipId.color
  mathLib_1 = dealershipId.spawnCode
  cache = 44
  tbl_4 = 38
  eventName_2 = 32
  deleteEntity = 33
  tbl_5 = 34
  tbl_6 = 35
  tbl_7 = 73
  tbl_8 = 201
  tbl_9 = SetNuiFocus
  tbl_10 = false
  locale = false
  tbl_9(tbl_10, locale)
  tbl_9 = SendNUIMessage
  tbl_10 = {}
  tbl_10.type = "displayVehicleHud"
  tbl_10.vehiclePlaced = false
  locale = Locale
  tbl_10.locale = locale
  locale = Config
  tbl_10.config = locale
  tbl_9(tbl_10)
  while true do
    tbl_9 = IsControlJustPressed
    tbl_10 = 0
    locale = tbl_8
    tbl_9 = tbl_9(tbl_10, locale)
    if tbl_9 then
      break
    end
    tbl_9 = Wait
    tbl_10 = 0
    tbl_9(tbl_10)
  end
  tbl_9 = SendNUIMessage
  tbl_10 = {}
  tbl_10.type = "displayVehicleHud"
  tbl_10.vehiclePlaced = true
  locale = Locale
  tbl_10.locale = locale
  locale = Config
  tbl_10.config = locale
  tbl_9(tbl_10)
  tbl_9 = true
  tmp_4 = tbl_9
  tbl_9 = lib
  tbl_9 = tbl_9.requestModel
  tbl_10 = mathLib_1
  tbl_9(tbl_10)
  tbl_9 = GetEntityHeading
  tbl_10 = cache
  tbl_10 = tbl_10.ped
  tbl_9 = tbl_9(tbl_10)
  tbl_10 = GetOffsetFromEntityInWorldCoords
  locale = cache
  locale = locale.ped
  freezeEntityPos = 0.0
  mathLib_2 = 3.0
  mathLib_3 = 0.0
  tbl_10 = tbl_10(locale, freezeEntityPos, mathLib_2, mathLib_3)
  locale = CreateVehicle
  freezeEntityPos = mathLib_1
  mathLib_2 = tbl_10.x
  mathLib_3 = tbl_10.y
  mathLib_4 = tbl_10.z
  mathLib_4 = mathLib_4 - 1.0
  cache_1 = 0.0
  tmp_24 = false
  getEntityHeading = false
  locale = locale(freezeEntityPos, mathLib_2, mathLib_3, mathLib_4, cache_1, tmp_24, getEntityHeading)
  freezeEntityPos = FreezeEntityPosition
  mathLib_2 = cache
  mathLib_2 = mathLib_2.ped
  mathLib_3 = true
  freezeEntityPos(mathLib_2, mathLib_3)
  freezeEntityPos = SetEntityRotation
  mathLib_2 = locale
  mathLib_3 = 0.0
  mathLib_4 = 0.0
  cache_1 = tbl_9
  tmp_24 = 2
  getEntityHeading = true
  freezeEntityPos(mathLib_2, mathLib_3, mathLib_4, cache_1, tmp_24, getEntityHeading)
  freezeEntityPos = SetEntityAlpha
  mathLib_2 = locale
  mathLib_3 = 200
  mathLib_4 = false
  freezeEntityPos(mathLib_2, mathLib_3, mathLib_4)
  freezeEntityPos = SetEntityCollision
  mathLib_2 = locale
  mathLib_3 = false
  mathLib_4 = false
  freezeEntityPos(mathLib_2, mathLib_3, mathLib_4)
  freezeEntityPos = SetVehicleColour
  mathLib_2 = locale
  mathLib_3 = mathLib
  freezeEntityPos(mathLib_2, mathLib_3)
  freezeEntityPos = SetEntityCanBeDamaged
  mathLib_2 = locale
  mathLib_3 = false
  freezeEntityPos(mathLib_2, mathLib_3)
  freezeEntityPos = FreezeEntityPosition
  mathLib_2 = locale
  mathLib_3 = true
  freezeEntityPos(mathLib_2, mathLib_3)
  freezeEntityPos = SetEntityInvincible
  mathLib_2 = locale
  mathLib_3 = true
  freezeEntityPos(mathLib_2, mathLib_3)
  freezeEntityPos = SetVehicleGravity
  mathLib_2 = locale
  mathLib_3 = false
  freezeEntityPos(mathLib_2, mathLib_3)
  freezeEntityPos = SetEntityDynamic
  mathLib_2 = locale
  mathLib_3 = false
  freezeEntityPos(mathLib_2, mathLib_3)
  freezeEntityPos = DisableVehicleWorldCollision
  mathLib_2 = locale
  freezeEntityPos(mathLib_2)
  freezeEntityPos = SetVehicleOnGroundProperly
  mathLib_2 = locale
  freezeEntityPos(mathLib_2)
  freezeEntityPos = SetModelAsNoLongerNeeded
  mathLib_2 = mathLib_1
  freezeEntityPos(mathLib_2)
  while true do
    freezeEntityPos = tmp_4
    if not freezeEntityPos then
      break
    end
    freezeEntityPos = Wait
    mathLib_2 = 0
    freezeEntityPos(mathLib_2)
    freezeEntityPos = false
    mathLib_2 = tmp
    if mathLib_2 then
      mathLib_2 = tmp_6
      mathLib_3 = locale
      mathLib_2 = mathLib_2(mathLib_3)
      freezeEntityPos = mathLib_2
    end
    mathLib_2 = ipairs
    mathLib_3 = tbl_3
    mathLib_2, mathLib_3, mathLib_4 = mathLib_2(mathLib_3)
    for tmp_24, getEntityHeading in mathLib_2, mathLib_3, mathLib_4 do
      tmp_27 = DisableControlAction
      tmp_28 = 0
      tmp_30 = getEntityHeading
      config_7 = true
      tmp_27(tmp_28, tmp_30, config_7)
    end
    if freezeEntityPos then
      mathLib_2 = SetEntityDrawOutlineColor
      mathLib_3 = 254
      mathLib_4 = 77
      cache_1 = 77
      tmp_24 = 255
      mathLib_2(mathLib_3, mathLib_4, cache_1, tmp_24)
    else
      mathLib_2 = SetEntityDrawOutlineColor
      mathLib_3 = 106
      mathLib_4 = 226
      cache_1 = 119
      tmp_24 = 255
      mathLib_2(mathLib_3, mathLib_4, cache_1, tmp_24)
    end
    mathLib_2 = SetEntityDrawOutlineShader
    mathLib_3 = 1
    mathLib_2(mathLib_3)
    mathLib_2 = SetEntityDrawOutline
    mathLib_3 = locale
    mathLib_4 = true
    mathLib_2(mathLib_3, mathLib_4)
    mathLib_2 = IsDisabledControlPressed
    mathLib_3 = 0
    mathLib_4 = cache
    mathLib_2 = mathLib_2(mathLib_3, mathLib_4)
    if mathLib_2 then
      mathLib_2 = tmp_8
      mathLib_3 = locale
      mathLib_4 = -0.5
      mathLib_2(mathLib_3, mathLib_4)
    else
      mathLib_2 = IsControlPressed
      mathLib_3 = 0
      mathLib_4 = tbl_4
      mathLib_2 = mathLib_2(mathLib_3, mathLib_4)
      if mathLib_2 then
        mathLib_2 = tmp_8
        mathLib_3 = locale
        mathLib_4 = 0.5
        mathLib_2(mathLib_3, mathLib_4)
      end
    end
    mathLib_2 = IsControlPressed
    mathLib_3 = 0
    mathLib_4 = eventName_2
    mathLib_2 = mathLib_2(mathLib_3, mathLib_4)
    if mathLib_2 then
      mathLib_2 = tmp_12
      mathLib_3 = locale
      mathLib_4 = "forward"
      cache_1 = 0.025
      mathLib_2(mathLib_3, mathLib_4, cache_1)
    else
      mathLib_2 = IsControlPressed
      mathLib_3 = 0
      mathLib_4 = deleteEntity
      mathLib_2 = mathLib_2(mathLib_3, mathLib_4)
      if mathLib_2 then
        mathLib_2 = tmp_12
        mathLib_3 = locale
        mathLib_4 = "backward"
        cache_1 = 0.025
        mathLib_2(mathLib_3, mathLib_4, cache_1)
      else
        mathLib_2 = IsControlPressed
        mathLib_3 = 0
        mathLib_4 = tbl_5
        mathLib_2 = mathLib_2(mathLib_3, mathLib_4)
        if mathLib_2 then
          mathLib_2 = tmp_12
          mathLib_3 = locale
          mathLib_4 = "left"
          cache_1 = 0.025
          mathLib_2(mathLib_3, mathLib_4, cache_1)
        else
          mathLib_2 = IsControlPressed
          mathLib_3 = 0
          mathLib_4 = tbl_6
          mathLib_2 = mathLib_2(mathLib_3, mathLib_4)
          if mathLib_2 then
            mathLib_2 = tmp_12
            mathLib_3 = locale
            mathLib_4 = "right"
            cache_1 = 0.025
            mathLib_2(mathLib_3, mathLib_4, cache_1)
          end
        end
      end
    end
    mathLib_2 = IsControlJustPressed
    mathLib_3 = 0
    mathLib_4 = tbl_7
    mathLib_2 = mathLib_2(mathLib_3, mathLib_4)
    if mathLib_2 then
      mathLib_2 = DeleteEntity
      mathLib_3 = locale
      mathLib_2(mathLib_3)
      mathLib_2 = false
      tmp_4 = mathLib_2
      mathLib_2 = FreezeEntityPosition
      mathLib_3 = cache
      mathLib_3 = mathLib_3.ped
      mathLib_4 = false
      mathLib_2(mathLib_3, mathLib_4)
      mathLib_2 = SetEntityDrawOutline
      mathLib_3 = locale
      mathLib_4 = false
      mathLib_2(mathLib_3, mathLib_4)
      mathLib_2 = SendNUIMessage
      mathLib_3 = {}
      mathLib_3.type = "hide"
      mathLib_2(mathLib_3)
      mathLib_2 = ClearPedTasks
      mathLib_3 = cache
      mathLib_3 = mathLib_3.ped
      mathLib_2(mathLib_3)
      mathLib_2 = TriggerEvent
      mathLib_3 = "jg-dealerships:client:open-management"
      mathLib_4 = tbl_2
      mathLib_2(mathLib_3, mathLib_4)
      mathLib_2 = cb
      mathLib_3 = true
      return mathLib_2(mathLib_3)
    end
    mathLib_2 = IsDisabledControlJustPressed
    mathLib_3 = 0
    mathLib_4 = tbl_8
    mathLib_2 = mathLib_2(mathLib_3, mathLib_4)
    if mathLib_2 then
      mathLib_2 = tmp_6
      mathLib_3 = locale
      mathLib_2 = mathLib_2(mathLib_3)
      if not mathLib_2 then
        mathLib_2 = GetEntityCoords
        mathLib_3 = locale
        mathLib_2 = mathLib_2(mathLib_3)
        mathLib_3 = vector4
        mathLib_4 = mathLib_2.x
        cache_1 = mathLib_2.y
        tmp_24 = mathLib_2.z
        getEntityHeading = GetEntityHeading
        tmp_27 = locale
        getEntityHeading, tmp_27, tmp_28, tmp_30 = getEntityHeading(tmp_27)
        mathLib_3 = mathLib_3(mathLib_4, cache_1, tmp_24, getEntityHeading, tmp_27, tmp_28, tmp_30, config_7)
        mathLib_4 = DeleteEntity
        cache_1 = locale
        mathLib_4(cache_1)
        mathLib_4 = false
        tmp_4 = mathLib_4
        mathLib_4 = FreezeEntityPosition
        cache_1 = cache
        cache_1 = cache_1.ped
        tmp_24 = false
        mathLib_4(cache_1, tmp_24)
        mathLib_4 = SetEntityDrawOutline
        cache_1 = locale
        tmp_24 = false
        mathLib_4(cache_1, tmp_24)
        mathLib_4 = SendNUIMessage
        cache_1 = {}
        cache_1.type = "hide"
        mathLib_4(cache_1)
        mathLib_4 = ClearPedTasks
        cache_1 = cache
        cache_1 = cache_1.ped
        mathLib_4(cache_1)
        mathLib_4 = lib
        mathLib_4 = mathLib_4.callback
        mathLib_4 = mathLib_4.await
        cache_1 = "jg-dealerships:server:create-display-vehicle"
        tmp_24 = false
        getEntityHeading = tbl_2
        tmp_27 = mathLib_1
        tmp_28 = mathLib
        tmp_30 = mathLib_3
        mathLib_4(cache_1, tmp_24, getEntityHeading, tmp_27, tmp_28, tmp_30)
        mathLib_4 = TriggerEvent
        cache_1 = "jg-dealerships:client:open-management"
        tmp_24 = tbl_2
        mathLib_4(cache_1, tmp_24)
        mathLib_4 = false
        tmp_2 = mathLib_4
        mathLib_4 = cb
        cache_1 = true
        return mathLib_4(cache_1)
      end
    else
      mathLib_2 = IsDisabledControlJustPressed
      mathLib_3 = 0
      mathLib_4 = tbl_8
      mathLib_2 = mathLib_2(mathLib_3, mathLib_4)
      if mathLib_2 then
        mathLib_2 = tmp_6
        mathLib_3 = locale
        mathLib_2 = mathLib_2(mathLib_3)
        if mathLib_2 then
          mathLib_2 = Framework
          mathLib_2 = mathLib_2.Client
          mathLib_2 = mathLib_2.Notify
          mathLib_3 = Locale
          mathLib_3 = mathLib_3.errorPlacementCollision
          if not mathLib_3 then
            mathLib_3 = "You can't place the vehicle here"
          end
          mathLib_4 = "error"
          mathLib_2(mathLib_3, mathLib_4)
        end
      end
    end
    mathLib_2 = GetEntityCoords
    mathLib_3 = locale
    mathLib_2 = mathLib_2(mathLib_3)
    mathLib_3 = SetEntityCoordsNoOffset
    mathLib_4 = locale
    cache_1 = mathLib_2.x
    tmp_24 = mathLib_2.y
    getEntityHeading = mathLib_2.z
    tmp_27 = false
    tmp_28 = false
    tmp_30 = false
    mathLib_3(mathLib_4, cache_1, tmp_24, getEntityHeading, tmp_27, tmp_28, tmp_30)
  end
end
registerNetEvent(eventName_3, tmp_20)
registerNetEvent = RegisterNUICallback
eventName_3 = "edit-display-vehicle"
function tmp_20(dealershipId, cb)
  local tbl_2, mathLib, mathLib_1, cache, tbl_4, eventName_2, deleteEntity, tbl_5, tbl_6, tbl_7, tbl_8
  tbl_2 = dealershipId.id
  mathLib = dealershipId.dealershipId
  mathLib_1 = dealershipId.spawnCode
  cache = dealershipId.color
  tbl_4 = lib
  tbl_4 = tbl_4.callback
  tbl_4 = tbl_4.await
  eventName_2 = "jg-dealerships:server:edit-display-vehicle"
  deleteEntity = false
  tbl_5 = mathLib
  tbl_6 = tbl_2
  tbl_7 = mathLib_1
  tbl_8 = cache
  tbl_4(eventName_2, deleteEntity, tbl_5, tbl_6, tbl_7, tbl_8)
  tbl_4 = cb
  eventName_2 = true
  tbl_4(eventName_2)
end
registerNetEvent(eventName_3, tmp_20)
registerNetEvent = RegisterNUICallback
eventName_3 = "delete-display-vehicle"
function tmp_20(dealershipId, cb)
  local tbl_2, mathLib, mathLib_1, cache, tbl_4, eventName_2, deleteEntity
  tbl_2 = dealershipId.id
  mathLib = dealershipId.dealershipId
  mathLib_1 = lib
  mathLib_1 = mathLib_1.callback
  mathLib_1 = mathLib_1.await
  cache = "jg-dealerships:server:delete-display-vehicle"
  tbl_4 = false
  eventName_2 = mathLib
  deleteEntity = tbl_2
  mathLib_1(cache, tbl_4, eventName_2, deleteEntity)
  mathLib_1 = cb
  cache = true
  mathLib_1(cache)
end
registerNetEvent(eventName_3, tmp_20)
registerNetEvent = RegisterNUICallback
eventName_3 = "reset-display-vehicles"
function tmp_20(dealershipId, cb)
  local tbl_2, mathLib, mathLib_1
  tbl_2 = dealershipId.dealershipId
  mathLib = tmp_18
  mathLib_1 = tbl_2
  mathLib(mathLib_1)
  mathLib = cb
  mathLib_1 = true
  mathLib(mathLib_1)
end
registerNetEvent(eventName_3, tmp_20)
registerNetEvent = CreateThread
function eventName_3()
  local config, getEntityCoords, tbl_2, mathLib, mathLib_1, cache, tbl_4, eventName_2, deleteEntity, tbl_5, tbl_6, tbl_7, tbl_8, tbl_9, tbl_10
  config = Config
  config = config.RemoveGeneratorsAroundDealership
  if config then
    config = Config
    config = config.RemoveGeneratorsAroundDealership
    if config > 0 then
      while true do
        config = pairs
        getEntityCoords = Config
        getEntityCoords = getEntityCoords.DealershipLocations
        config, getEntityCoords, tbl_2 = config(getEntityCoords)
        for mathLib_1, cache in config, getEntityCoords, tbl_2 do
          tbl_4 = cache.openShowroom
          if tbl_4 then
            tbl_4 = tbl_4.coords
          end
          if not tbl_4 then
            tbl_4 = cache.openShowroom
          end
          eventName_2 = Config
          eventName_2 = eventName_2.RemoveGeneratorsAroundDealership
          if not eventName_2 then
            eventName_2 = 60.0
          end
          deleteEntity = RemoveVehiclesFromGeneratorsInArea
          tbl_5 = tbl_4.x
          tbl_5 = tbl_5 - eventName_2
          tbl_6 = tbl_4.y
          tbl_6 = tbl_6 - eventName_2
          tbl_7 = tbl_4.z
          tbl_7 = tbl_7 - eventName_2
          tbl_8 = tbl_4.x
          tbl_8 = tbl_8 + eventName_2
          tbl_9 = tbl_4.y
          tbl_9 = tbl_9 + eventName_2
          tbl_10 = tbl_4.z
          tbl_10 = tbl_10 + eventName_2
          deleteEntity(tbl_5, tbl_6, tbl_7, tbl_8, tbl_9, tbl_10)
        end
        config = Wait
        getEntityCoords = 5000
        config(getEntityCoords)
      end
    end
  end
end
registerNetEvent(eventName_3)
registerNetEvent = lib
registerNetEvent = registerNetEvent.onCache
eventName_3 = "vehicle"
function tmp_20(dealershipId)
  local getEntityCoords, tbl_2, mathLib
  if dealershipId then
    getEntityCoords = Entity
    tbl_2 = dealershipId
    getEntityCoords = getEntityCoords(tbl_2)
    getEntityCoords = getEntityCoords.state
    getEntityCoords = getEntityCoords.isDisplayVehicle
    if getEntityCoords then
      getEntityCoords = Framework
      getEntityCoords = getEntityCoords.Client
      getEntityCoords = getEntityCoords.Notify
      tbl_2 = "Vehicle security breach detected"
      mathLib = "warning"
      getEntityCoords(tbl_2, mathLib)
      getEntityCoords = FreezeEntityPosition
      tbl_2 = dealershipId
      mathLib = true
      getEntityCoords(tbl_2, mathLib)
      getEntityCoords = SetVehicleAlarm
      tbl_2 = dealershipId
      mathLib = true
      getEntityCoords(tbl_2, mathLib)
      getEntityCoords = StartVehicleAlarm
      tbl_2 = dealershipId
      getEntityCoords(tbl_2)
    end
  end
end
registerNetEvent(eventName_3, tmp_20)
registerNetEvent = AddEventHandler
eventName_3 = "onResourceStop"
function tmp_20(dealershipId)
  local getEntityCoords, tbl_2, mathLib, mathLib_1, cache, tbl_4, eventName_2
  getEntityCoords = GetCurrentResourceName
  getEntityCoords = getEntityCoords()
  if getEntityCoords == dealershipId then
    getEntityCoords = pairs
    tbl_2 = Config
    tbl_2 = tbl_2.DealershipLocations
    getEntityCoords, tbl_2, mathLib = getEntityCoords(tbl_2)
    for cache in getEntityCoords, tbl_2, mathLib do
      tbl_4 = tmp_16
      eventName_2 = cache
      tbl_4(eventName_2)
    end
  end
end
registerNetEvent(eventName_3, tmp_20)
