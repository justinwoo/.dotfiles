#!/bin/bash

DIR=~/.config/autorandr
TARGET=$DIR/postswitch

if [[ ! -e $TARGET ]]
then
  echo Installing autorandr postswitch to "$TARGET"
  mkdir -p $DIR
  ln -s "$DOT/autorandr/postswitch" $TARGET
else
  echo Skipping autorandr postswitch installation.
fi
