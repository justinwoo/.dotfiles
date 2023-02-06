gridWidth = 3

hs.grid.setMargins(hs.geometry({0, 0}))

function updateGridGeometry(displayAlert)
    hs.grid.setGrid(hs.geometry({w = gridWidth, h = 1}))
    if (displayAlert) then hs.alert.show("Grid width: " .. gridWidth) end
end

updateGridGeometry(false)

hs.hotkey.bind({"alt", "shift"}, "-", function()
    gridWidth = gridWidth - 1
    updateGridGeometry(true)
end)

hs.hotkey.bind({"alt", "shift"}, "=", function()
    gridWidth = gridWidth + 1
    updateGridGeometry(true)
end)

hs.hotkey.bind({"alt", "shift"}, ",", hs.grid.resizeWindowThinner)
hs.hotkey.bind({"alt", "shift"}, ".", hs.grid.resizeWindowWider)
hs.hotkey.bind({"alt", "shift"}, "h", hs.grid.pushWindowLeft)
hs.hotkey.bind({"alt", "shift"}, "l", hs.grid.pushWindowRight)

