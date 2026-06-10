local resourceName = "jg-dealerships"

CreateThread(function()
    Wait(2000)
    local currentVersion = GetResourceMetadata(GetCurrentResourceName(), "version", 0)
    if currentVersion then
        print("^2["..resourceName.."]^7 Running version: ^3" .. currentVersion .. "^7 (Version check bypassed)")
    else
        print("^2["..resourceName.."]^7 Version check bypassed.")
    end
end)