TARGET=~/.config/k9s/skin.yml

mkdir -p "$(dirname "$TARGET")"
ln -sf "$DOT"/k9s/skin.yml $TARGET
