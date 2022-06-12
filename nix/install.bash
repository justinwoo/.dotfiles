#!/bin/bash

TARGET=~/.config/nix/nix.conf

echo symlinking nix config to "$TARGET"
mkdir -p $(dirname $TARGET)
ln -sf "$DOT/nix/nix.conf" $TARGET
