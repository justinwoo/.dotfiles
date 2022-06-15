#!/bin/bash

TARGET=~/.config/nix/nix.conf

mkdir -p $(dirname $TARGET)

if [ -f $TARGET ]
then
    echo "skipping copying nix.conf.default"
else
    echo copying nix config to "$TARGET"
    cp "$DOT/nix/nix.conf.default" $TARGET
fi
