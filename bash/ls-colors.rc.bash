if [[ -f $(command -v vivid) ]]
then
  LS_COLORS=$(vivid generate one-light)
  export LS_COLORS
fi
