#!/bin/bash

TARGET=~/.config/alacritty/alacritty.yml

echo symlinking alacritty config to "$TARGET"
mkdir -p ~/.config/alacritty/
ln -sf "$DOT/alacritty/alacritty.yml" $TARGET
