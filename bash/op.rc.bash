op() {
  if command -v xdg-open
  then
    xdg-open "$1" &>/dev/null & disown
  elif command -v explorer.exe
  then
    explorer.exe "$1"
  else
    echo "trying xdg-open but wtf"
    xdg-open "$1" &>/dev/null & disown
  fi
}

_op() {
  local cur opts
  COMPREPLY=()
  if [ "$COMP_CWORD" == 1 ]
  then
    cur="${COMP_WORDS[COMP_CWORD]}"
    opts="$(ls)"

    # shellcheck disable=2207
    COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
  fi
}
complete -F _op op
