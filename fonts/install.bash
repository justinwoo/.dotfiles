#!/usr/bin/env bash


TARGET=~/.fonts

echo "installing fonts"
rm -f $TARGET
nix-build "$(dirname "${BASH_SOURCE[0]}")"/fonts.nix -o $TARGET

fc-cache
