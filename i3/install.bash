TARGET=~/.config/i3/config

echo ensuring symlink for i3 config at "$TARGET"
ln -sf "$DOT"/i3/config $TARGET
