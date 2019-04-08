#!/bin/bash

TARGET=~/.config/alacritty

if [[ ! -e $TARGET || $OVERRIDE == 'true' ]]
then
  echo Installing alacritty config to "$TARGET"
  mkdir -p $TARGET
  cp "$DOT/alacritty/alacritty.yml" $TARGET
else
  echo Skipping alacritty config installation.
fi
