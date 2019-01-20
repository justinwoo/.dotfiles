#!/bin/bash

TARGET=~/.config/alacritty

if [[ ! -e $TARGET ]]
then
  echo Installing alacritty config to "$TARGET"
  ln -s "$DOT/alacritty" $TARGET
else
  echo Skipping alacritty config installation.
fi
