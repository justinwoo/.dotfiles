op() {
  if command -v xdg-open &>/dev/null
  then
    xdg-open "$1" &>/dev/null & disown
  elif command -v explorer.exe &>/dev/null
  then
    explorer.exe "$1"
  else
    echo "trying xdg-open but wtf"
    xdg-open "$1" &>/dev/null & disown
  fi
}

if [[ -f $(command -v complete) ]]
then
  complete -o default -o bashdefault op
fi