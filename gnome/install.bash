# set xdg defaults
[[ $MACOS ]] && exit 0

xdg-mime default /home/justin/.nix-profile/share/applications/org.gnome.Evince.desktop application/pdf
xdg-mime default emacs.desktop text/plain
