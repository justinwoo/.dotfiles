on run {appName}

  if isFrontmost(appName) then
    log "Hiding " & appName
    tell application "Finder" to set visible of process appName to false
  else
    log "Activating " & appName
    tell application "System Events" to set frontmost of process appName to true
  end if

end run

on getVisible(appName)
  tell application "Finder" to get visible of process appName
end getVisible

on isFrontmost(appName)
  return frontmost of application appName
end isFrontmost
