clonecd() {
  cd "$PROJECTS" || echo "error: no location $PROJECTS";
  if [ $# == 1 ]
  then
    hub clone "$1"
    cd "$1" || echo "error: no location $1";
  elif [ $# == 2 ]
  then
    hub clone "$1" "$2";
    cd "$2" || echo "error: no location $2";
  else
    echo "usage: clonecd hub-repo-name [optional-dirname]";
  fi
}
