#!/bin/bash

TARGET=~/.config/alacritty.yml

echo symlinking alacritty config to "$TARGET"
ln -sf "$DOT/alacritty/alacritty.yml" $TARGET
