#!/bin/bash

[[ $MACOS ]] && exit 0

TARGET=~/.config/autorandr/postswitch

echo "installing autorandr postswitch"
rm -f $TARGET
nix-build "$(dirname "${BASH_SOURCE[0]}")"/postswitch.nix -o $TARGET
