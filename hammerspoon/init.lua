require("functions")
require("filters")
require("grid")

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "R", function() hs.reload() end)
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "L",
               function() hs.caffeinate.lockScreen() end)

hs.hotkey.bind({"alt"}, "`", function()
    local windows = hs.window.filter.defaultCurrentSpace:getWindows()
    hs.application.frontmostApplication():hide()
    windows[2]:focus()
end)

bindApp({"alt"}, "e", "emacs")
bindApp({"alt"}, "o", "iTerm2")
bindApp({"alt"}, "u", "Telegram")
bindApp({"alt", "shift"}, "u", "UpNote")
bindApp({"alt"}, "y", "Google Chrome")
bindApp({"alt"}, "i", "Slack")
bindApp({"alt"}, ";", "IINA")
bindApp({"alt", "shift"}, ";", "FileZilla")

hs.hotkey.bind({"alt", "shift"}, "p", function()
    local finder = hs.appfinder.appFromName('Finder')
    local windows = finder:allWindows()
    if #windows == 1 then
        hs.execute("open /Users/justin/Desktop/")
    else
        toggleApp("Finder")
    end
end)

-- hs.hotkey.bind({"ctrl", "shift"}, "left", function() volumeChange(-5) end)
-- hs.hotkey.bind({"ctrl", "shift"}, "right", function() volumeChange(5) end)

hs.hotkey.bind({"ctrl", "shift"}, "left", volumeDown)
hs.hotkey.bind({"ctrl", "shift"}, "right", volumeUp)

-- hs.hotkey
--     .bind({"cmd"}, "p", function() hs.alert.show("No printing allowed") end)

hs.hotkey.bind({"ctrl", "alt"}, "return", function()
    local focused = hs.window.focusedWindow()
    focused:maximize(0)
end)

hs.hotkey.bind({"alt"}, "[", function()
    local focused = hs.window.focusedWindow()
    focused:focusWindowWest(nonScratchFilter:getWindows(), true)
end)

hs.hotkey.bind({"alt"}, "]", function()
    local focused = hs.window.focusedWindow()
    focused:focusWindowEast(nonScratchFilter:getWindows(), true)
end)

hs.hotkey.bind({"alt", "shift"}, "c", function()
    local focused = hs.window.focusedWindow()
    focused:centerOnScreen(0)
end)

hs.hotkey.bind({"alt", "shift"}, "1", function()
    hs.window.focusedWindow():move(hs.geometry({x = 0, y = 0, w = 0.5, h = 1}))
end)

hs.hotkey.bind({"alt", "shift"}, "2", function()
    hs.window.focusedWindow():move(hs.geometry({x = 0.5, y = 0, w = 0.5, h = 1}))
end)

hs.hotkey.bind({"alt", "shift"}, "[", function()
    hs.window.focusedWindow():move(hs.geometry({x = 0, y = 0, w = 0.333, h = 1}))
end)

hs.hotkey.bind({"alt", "shift"}, "]", function()
    hs.window.focusedWindow():move(hs.geometry({
        x = 0.667,
        y = 0,
        w = 0.334,
        h = 1
    }))
end)

hs.hotkey.bind({"alt", "shift"}, "3", function()
    local focused = hs.window.focusedWindow()
    focused:setSize(hs.geometry.size(1400, 900))
    focused:centerOnScreen(0)
end)

hs.hotkey.bind({"alt", "shift"}, "4", function()
    local focused = hs.window.focusedWindow()
    focused:setSize(hs.geometry.size(1600, 1000))
    focused:centerOnScreen(0)
end)

hs.hotkey.bind({"alt", "shift"}, "5", function()
    local focused = hs.window.focusedWindow()
    focused:setSize(hs.geometry.size(1000, 800))
    focused:centerOnScreen(0)
end)

-- hell on earth
hs.hotkey.bind({"shift"}, "escape",
               function() hs.eventtap.keyStroke({"shift"}, "`") end)

hs.hotkey.bind({"cmd"}, "escape",
               function() hs.eventtap.keyStroke({"cmd"}, "`") end)

hs.hotkey.bind({"shift", "cmd"}, "escape",
               function() hs.eventtap.keyStroke({"shift", "cmd"}, "`") end)

hs.hotkey.bind({"alt"}, "escape",
               function() hs.eventtap.keyStroke({"alt"}, "`") end)

hs.hotkey
    .bind({"ctrl"}, "escape", function() hs.eventtap.keyStroke({}, "`") end)

hs.alert.show("Config loaded")
