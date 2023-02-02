#!/bin/bash

[[ -z $MACOS ]] && exit 0

TARGET=~/.hammerspoon

mkdir -p "$(dirname $TARGET)"

if [ -e $TARGET ]
then
    echo "skipping linking hammerspoon modifications"
else
    echo symlinking "$DOT/hammerspoon" to "$TARGET"
    ln -s "$DOT/hammerspoon" $TARGET
fi
