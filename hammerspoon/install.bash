#!/bin/bash

[[ -z $MACOS ]] && exit 0

TARGET=~/.hammerspoon/init.lua

mkdir -p "$(dirname $TARGET)"

if [ -e $TARGET ]
then
    echo "skipping linking hammerspoon modifications"
else
    echo hammerspoon modifications to "$TARGET"
    ln -s "$DOT/hammerspoon/init.lua" $TARGET
fi
