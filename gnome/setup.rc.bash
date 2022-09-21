alias settings="XDG_CURRENT_DESKTOP=Unity gnome-control-center"

if [[ -f $(command -v xclip) ]]
then
gsettings set org.gnome.desktop.sound event-sounds false
fi
