#!/bin/bash

[[ -z $MACOS ]] && exit 0

TARGET=~/.config/karabiner/assets/complex_modifications/myrules.json

mkdir -p "$(dirname $TARGET)"

if [ -e $TARGET ]
then
    echo "skipping linking karabiner modifications"
else
    echo karabiner modifications to "$TARGET"
    ln -s "$DOT/karabiner/myrules.json" $TARGET
fi
