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
hs.hotkey.bind({"alt"}, "y", getToggleApp("Signal"))
hs.hotkey.bind({"alt"}, ";", getToggleApp("IINA"))
hs.hotkey.bind({"alt"}, "o", getToggleApp("Ghostty"))

hs.hotkey.bind({"alt"}, "i", getLaunchOrFocus("Slack"))
hs.hotkey.bind({"alt"}, "u", getLaunchOrFocus("Telegram"))
hs.hotkey.bind({"alt", "shift"}, ";", getLaunchOrFocus("Filezilla"))
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

local resolutions = {
    { label = "1920 x 1080", width = 1920, height = 1080 },
}

local function setAndAlert(width, height, label)
    local win = hs.window.focusedWindow()
    if not win then return end
    local f = win:frame()
    local screen = win:screen():frame()
    f.w = width
    f.h = height
    f.x = screen.x + (screen.w - f.w) / 2
    f.y = screen.y + (screen.h - f.h) / 2
    win:setFrame(f)
    alert("Window: " .. label)
end

hs.hotkey.bind({"alt", "shift"}, "3", function()
    setAndAlert(1920, 1080, "1920 x 1080")
end)

hs.hotkey.bind({"alt", "shift"}, "4", function()
    setAndAlert(1600, 1000, "1600 x 1000")
end)

hs.hotkey.bind({"alt", "shift"}, "5", function()
    setAndAlert(1200, 800, "1200 x 800")
end)

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

-- Preview and paste latest screenshot (Ctrl+Opt+Cmd+V)
-- Shows a preview overlay; click or press Escape to dismiss and paste
local screenshotPreview = nil
local screenshotPreviewEsc = nil

local function dismissScreenshotPreview()
    if screenshotPreview then
        screenshotPreview:delete()
        screenshotPreview = nil
    end
    if screenshotPreviewEsc then
        screenshotPreviewEsc:delete()
        screenshotPreviewEsc = nil
    end
end

hs.hotkey.bind({"ctrl", "alt", "cmd"}, "V", function()
    dismissScreenshotPreview()

    local home = os.getenv("HOME")
    local desktop = home .. "/Desktop"
    local latest = hs.execute(
        "ls -t " .. desktop .. " | grep -iE '\\.(png|jpg|jpeg|gif|webp|heic|tiff)$' | head -1"
    )
    latest = latest and latest:gsub("%s+$", "") or ""
    if latest == "" then
        alert("No image files found on Desktop")
        return
    end
    latest = desktop .. "/" .. latest

    if not hs.fs.attributes(latest) then
        alert("Image file not accessible: " .. latest)
        return
    end

    local image = hs.image.imageFromPath(latest)
    if not image then
        alert("Failed to load image")
        return
    end

    -- Put file path on clipboard for pasting
    hs.pasteboard.setContents(latest)

    -- Calculate preview size (max 600x400, maintain aspect ratio)
    local imgSize = image:size()
    local maxW, maxH = 600, 400
    local scale = math.min(maxW / imgSize.w, maxH / imgSize.h, 1)
    local previewW = imgSize.w * scale
    local previewH = imgSize.h * scale

    -- Anchor to top-center of screen
    local screen = hs.screen.mainScreen():frame()
    local x = screen.x + (screen.w - previewW) / 2
    local y = screen.y + 40

    screenshotPreview = hs.canvas.new({x = x, y = y, w = previewW, h = previewH})
    screenshotPreview:level(hs.canvas.windowLevels.overlay)
    screenshotPreview[1] = {
        type = "rectangle",
        fillColor = {white = 0, alpha = 0.8},
        roundedRectRadii = {xRadius = 8, yRadius = 8},
    }
    screenshotPreview[2] = {
        type = "image",
        image = image,
        imageAlignment = "center",
        imageScaling = "proportionallyUpOrDown",
    }
    screenshotPreview:clickActivating(false)
    screenshotPreview:behavior({"canJoinAllSpaces", "stationary", "ignoresCycle"})
    screenshotPreview:show()

    -- Paste immediately, dismiss preview after 1 second
    hs.timer.doAfter(0.1, function()
        hs.eventtap.keyStroke({"cmd"}, "v")
    end)
    hs.timer.doAfter(1, function()
        dismissScreenshotPreview()
    end)
end)

alert("Config loaded")
