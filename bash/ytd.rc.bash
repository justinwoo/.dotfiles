ytd() {
  if [ $# == 0 ]
  then
    echo "need target url"
  else
    yt-dlp -x --audio-format mp3 "$1";
  fi
}
