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
        hs.alert.show("Could not find app from name: " .. appName)
    end
end

function bindApp(modifiers, key, appName)
    hs.hotkey.bind(modifiers, key, function() toggleApp(appName) end)
end

local alertId

function round5(n)
    local r = n % 5
    return r >= 5 / 2 and n + 5 - r or n - r
end

function volumeChange(delta)
    local currentVolume = hs.audiodevice.defaultOutputDevice():volume()
    local newVolume = round5(math.floor(math.min(currentVolume + delta, 100)))
    hs.audiodevice.defaultOutputDevice():setVolume(newVolume)
    hs.alert.closeSpecific(alertId)
    alertId = hs.alert.show("Volume: " .. newVolume .. "%")
end
