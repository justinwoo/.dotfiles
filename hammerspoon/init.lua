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

function bindApp(modifiers, key, appName)
    hs.hotkey.bind(modifiers, key, function() toggleApp(appName) end)
end

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "R", function() hs.reload() end)

hs.hotkey.bind({"alt"}, "`",
               function() hs.application.frontmostApplication():hide() end)

bindApp({"alt"}, "e", "emacs")
bindApp({"alt"}, "o", "iTerm2")
bindApp({"alt"}, "u", "Telegram")
bindApp({"alt"}, "y", "Google Chrome")
bindApp({"alt"}, "i", "Slack")
bindApp({"alt"}, ";", "mpv")

hs.alert.show("Config loaded")
