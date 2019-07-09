#!/bin/bash

TARGET=~/.config/alacritty

echo symlinking alacritty config to "$TARGET"
ln -sf "$DOT/alacritty/alacritty.yml" $TARGET
