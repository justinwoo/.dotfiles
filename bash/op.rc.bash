op() {
  if [ -n "$MACOS" ]
  then
    open "$@"
  elif command -v xdg-open &>/dev/null
  then
    xdg-open "$@" &>/dev/null & disown
  elif command -v explorer.exe &>/dev/null
  then
    explorer.exe "$@"
  else
    echo "trying xdg-open but wtf"
    xdg-open "$@" &>/dev/null & disown
  fi
}

if [[ -f $(command -v complete) ]]
then
  complete -o default -o bashdefault op
fi
