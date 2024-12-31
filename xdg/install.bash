mkdir -p $XDG_CONFIG_HOME

find "$DOT/xdg" \
     -mindepth 1 \
     -type d \
     -exec ln -sf {} "$XDG_CONFIG_HOME" \;
