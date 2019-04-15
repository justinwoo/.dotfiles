#!/usr/bin/env bash
if [[ ! -e ~/.fonts && -e ~/.nix-profile/share/fonts ]]
then
  echo 'Symlinking fonts'
  ln -s ~/.nix-profile/share/fonts ~/.fonts
else
  echo 'Skipping font installation.'
fi

fc-cache -v
