require("functions")
require("filters")

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "R", function() hs.reload() end)

hs.hotkey.bind({"alt"}, "`",
               function() hs.application.frontmostApplication():hide() end)

bindApp({"alt", "shift"}, "p", "Finder")
bindApp({"alt"}, "e", "emacs")
bindApp({"alt"}, "o", "iTerm2")
bindApp({"alt"}, "u", "Telegram")
bindApp({"alt"}, "y", "Google Chrome")
bindApp({"alt"}, "i", "Slack")
bindApp({"alt"}, ";", "mpv")
bindApp({"alt", "shift"}, ";", "FileZilla")

hs.hotkey.bind({"alt"}, "[", function()
    local focused = hs.window.focusedWindow()
    focused:focusWindowWest(nonScratchFilter:getWindows(), true)
end)

hs.hotkey.bind({"alt"}, "]", function()
    local focused = hs.window.focusedWindow()
    focused:focusWindowEast(nonScratchFilter:getWindows(), true)
end)

hs.hotkey.bind({"alt"}, "c", function()
    local focused = hs.window.focusedWindow()
    focused:centerOnScreen()
end)

hs.hotkey.bind({"alt", "shift"}, "3", function()
    local focused = hs.window.focusedWindow()
    focused:setSize(hs.geometry.size(1400, 900))
    focused:centerOnScreen()
end)

hs.alert.show("Config loaded")
