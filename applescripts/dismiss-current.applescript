on run {}

  tell application "System Events"

    set proc to first process whose frontmost is true

    set visible of proc to false

  end tell

end run
