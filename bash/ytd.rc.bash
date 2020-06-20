ytd() {
  if [ $# == 0 ]
  then
    echo "need target url"
  else
    youtube-dl -x --audio-format mp3 "$1";
  fi
}
