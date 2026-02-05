s() {
  local base="$PROJECTS/scarf"
  if [ $# == 1 ]
  then
    cd "$base/$1" || echo "error: could not go to $base/$1";
  elif [ $# == 0 ]
  then
    cd "$base" || echo "error: no location $base";
  else
    echo "s only takes one argument, for which folder in $base to go to";
  fi
}

_s() {
  local cur opts base
  base="$PROJECTS/scarf"
  COMPREPLY=()
  if [ "$COMP_CWORD" == 1 ]
  then
    cur="${COMP_WORDS[COMP_CWORD]}"
    opts="$(ls "$base")"

    # shellcheck disable=2207
    COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
  fi
}

if command -v complete &>/dev/null
then
  complete -F _s s
fi
