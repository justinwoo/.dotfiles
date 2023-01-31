function toggleApp(appName)
    local app = hs.appfinder.appFromName(appName)

    if (app) then
        if (app:isFrontmost()) then
            app:hide()
        else
            app:activate()
        end
    end
end

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "R", function() hs.reload() end)
hs.alert.show("Config loaded")

hs.hotkey.bind({"alt"}, "R", function() toggleApp("emacs") end)
