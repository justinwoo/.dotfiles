set -x

echo ensuring symlink for ghostty config
ln -sf "$DOT"/ghostty ~/.config
readlink ~/.config/ghostty

echo ensuring no lingering config
rm "$HOME/Library/Application\ Support/com.mitchellh.ghostty/config." || exit 0
