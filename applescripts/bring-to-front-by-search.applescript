on run {appName}

  tell application "System Events"

    set procs to every process whose name is appName

    repeat with proc in procs
      if (get frontmost of proc) then
        set visible of proc to false
      else
        set frontmost of proc to true
      end if
    end repeat

  end tell

end run
