TARGET=~/.config/i3/config

echo ensuring symlink for i3 config at "$TARGET"
mkdir -p "$DOT"/i3
ln -sf "$DOT"/i3/config $TARGET

echo ensuring dunstrc
if [[ ! -e ~/.config/dunst/dunstrc ]]
then
  mkdir -p ~/.config/dunst
  ln -sf "$DOT/i3/dunstrc" ~/.config/dunst/dunstrc
fi
