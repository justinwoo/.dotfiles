on run {appName}

  if getVisible(appName) then
    log "Hiding " & appName
    tell application "Finder" to set visible of process appName to false
  else
    log "Activating " & appName
    tell application appName to activate
  end if

end run

on getVisible(appName)
  tell application "Finder" to get visible of process appName
end getVisible
