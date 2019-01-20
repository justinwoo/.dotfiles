c() {
  if [ $# == 1 ]
  then
    cd "$PROJECTS/$1" || echo "error: could not go to ${$PROJECTS/$1}";
  elif [ $# == 0 ]
  then
    cd "$PROJECTS" || echo "error: no location $PROJECTS";
  else
    echo "c only takes one argument, for which folder in $PROJECTS to go to";
  fi
}

_c() {
  local cur opts
  COMPREPLY=()
  if [ "$COMP_CWORD" == 1 ]
  then
    cur="${COMP_WORDS[COMP_CWORD]}"
    opts="$(ls ~/Code)"

    # shellcheck disable=2207
    COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
  fi
}
complete -F _c c
