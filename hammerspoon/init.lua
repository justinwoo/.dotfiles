require("config")
require("functions")
require("filters")
require("grid")

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "R", hs.reload)

hs.hotkey.bind({"alt"}, "`", function()
    local windows = hs.window.filter.defaultCurrentSpace:getWindows()
    hs.application.frontmostApplication():hide()
    windows[2]:focus()
end)

hs.hotkey.bind({"alt"}, "e", getToggleApp("emacs"))
hs.hotkey.bind({"alt"}, "w", getToggleApp("Code"))
hs.hotkey.bind({"alt"}, "y", getToggleApp("Google Chrome"))
hs.hotkey.bind({"alt"}, ";", getToggleApp("IINA"))
hs.hotkey.bind({"alt"}, "o", getToggleApp("Ghostty"))

hs.hotkey.bind({"alt"}, "i", getLaunchOrFocus("Slack"))
hs.hotkey.bind({"alt"}, "u", getLaunchOrFocus("Telegram"))
hs.hotkey.bind({"alt", "shift"}, ";", getLaunchOrFocus("Transmit"))
hs.hotkey.bind({"alt", "shift"}, "u", getLaunchOrFocus("UpNote"))
hs.hotkey.bind({"ctrl", "alt", "cmd"}, "m", getLaunchOrFocus("Maps"))
hs.hotkey.bind({"ctrl", "alt", "cmd"}, "n", getLaunchOrFocus("Calendar"))
hs.hotkey.bind({"ctrl", "alt", "cmd"}, "w", getLaunchOrFocus("Weather"))

hs.hotkey.bind({"alt", "shift"}, "p", function()
    local finder = hs.appfinder.appFromName('Finder')
    local windows = finder:allWindows()
    if #windows == 1 then
        hs.execute("open /Users/justin/Desktop/")
        resizeFinder()
    else
        toggleApp("Finder")
    end
end)

hs.hotkey.bind({"ctrl", "shift"}, "left", volumeDown)
hs.hotkey.bind({"ctrl", "shift"}, "right", volumeUp)

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

hs.hotkey.bind({"alt", "shift"}, "3", function() setFocusedSize(1400, 900) end)

hs.hotkey.bind({"alt", "shift"}, "4", function() setFocusedSize(1600, 1000) end)

hs.hotkey.bind({"alt", "shift"}, "5", function() setFocusedSize(1200, 800) end)

hs.hotkey.bind({"ctrl", "alt", "cmd"}, "J", function()
    hs.keycodes.currentSourceID(
        "com.apple.inputmethod.Kotoeri.RomajiTyping.Japanese")
    alert("日本語")
end)

hs.hotkey.bind({"ctrl", "alt", "cmd"}, "K", function()
    hs.keycodes.currentSourceID("com.apple.keylayout.US")
    alert("English")
end)

hs.hotkey.bind({"ctrl", "alt", "cmd"}, "L", function()
    hs.keycodes.currentSourceID("com.apple.keylayout.Swedish-Pro")
    alert("Swedish")
end)

hs.hotkey.bind({"ctrl", "alt", "cmd"}, "H", function()
    hs.keycodes.currentSourceID("com.apple.inputmethod.TCIM.Pinyin")
    alert("漢字")
end)

hs.hotkey.bind({"ctrl", "alt", "cmd"}, ";", function()
    hs.keycodes.currentSourceID("com.apple.inputmethod.Korean.2SetKorean")
    alert("한글")
end)

local laptop = os.getenv("LAPTOP")
if not laptop then
    -- hell on earth
    hs.hotkey.bind({"shift"}, "escape",
                   function() hs.eventtap.keyStroke({"shift"}, "`") end)

    hs.hotkey.bind({"cmd"}, "escape",
                   function() hs.eventtap.keyStroke({"cmd"}, "`") end)

    hs.hotkey.bind({"shift", "cmd"}, "escape",
                   function() hs.eventtap.keyStroke({"shift", "cmd"}, "`") end)

    hs.hotkey.bind({"alt"}, "escape",
                   function() hs.eventtap.keyStroke({"alt"}, "`") end)

    hs.hotkey.bind({"ctrl"}, "escape",
                   function() hs.eventtap.keyStroke({}, "`") end)

end

alert("Config loaded")
