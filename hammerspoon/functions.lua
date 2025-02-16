-- from https://stackoverflow.com/questions/9168058/how-to-dump-a-table-to-console
function dump(o)
    if type(o) == 'table' then
        local s = '{ '
        for k, v in pairs(o) do
            if type(k) ~= 'number' then k = '"' .. k .. '"' end
            s = s .. '[' .. k .. '] = ' .. dump(v) .. ','
        end
        return s .. '} '
    else
        return tostring(o)
    end
end

local appAlertId
function toggleApp(appName)
    local app = hs.appfinder.appFromName(appName)

    if (app) then
        if (app:isFrontmost()) then
            local windows = hs.window.filter.defaultCurrentSpace:getWindows()
            app:hide()
            windows[2]:focus()
        else
            app:activate()
        end
    else
        hs.alert.closeSpecific(appAlertId)
        appAlertId = hs.alert.show("Could not find app from name: " .. appName)
    end
end

function getToggleApp(appName) return function() toggleApp(appName) end end

function getLaunchOrFocus(appName)
    return function() hs.application.launchOrFocus(appName) end
end

function round5(n)
    local r = n % 5
    return r >= 5 / 2 and n + 5 - r or n - r
end

local volumeAlertId
function volumeChange(delta)
    local currentVolume = hs.audiodevice.defaultOutputDevice():volume()
    local newVolume = round5(math.floor(math.min(currentVolume + delta, 100)))
    hs.audiodevice.defaultOutputDevice():setVolume(newVolume)
    hs.alert.closeSpecific(volumeAlertId)
    volumeAlertId = hs.alert.show("Volume: " .. newVolume .. "%")
end

function volumeDown()
    local volumeDownKey = "SOUND_DOWN"
    hs.eventtap.event.newSystemKeyEvent(volumeDownKey, true):post()
    hs.eventtap.event.newSystemKeyEvent(volumeDownKey, false):post()
end

function volumeUp()
    local volumeUpKey = "SOUND_UP"
    hs.eventtap.event.newSystemKeyEvent(volumeUpKey, true):post()
    hs.eventtap.event.newSystemKeyEvent(volumeUpKey, false):post()
end

local messageAlertId
function alert(text)
    hs.alert.closeSpecific(messageAlertId)
    messageAlertId = hs.alert.show(text)
end

function setFocusedSize(x, y)
    local focused = hs.window.focusedWindow()
    focused:setSize(hs.geometry.size(x, y))
    focused:centerOnScreen(0)
end

function findFinder()
    local finder = hs.appfinder.appFromName('Finder')
    local windows = finder:allWindows()
    if #windows == 1 then
        hs.execute("open /Users/justin/Desktop/")
        resizeFinder()
    else
        toggleApp("Finder")
    end
end

function resizeFinder()
    local attempts = 0
    local maxAttempts = 3

    function pred()
        attempts = attempts + 1
        local finder = hs.application.get("Finder")

        if finder ~= nil then
            local win = finder:mainWindow()
            if win then
                win:setSize(1200, 700)
                win:centerOnScreen(0)
                return true
            end
        elseif attempts >= maxAttempts then
            alert("Couldnt' find Finder after " .. maxAttempts .. " attempts")
            return true
        end

        return false
    end

    hs.timer.doUntil(pred, action, 0.05)
end
