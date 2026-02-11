#!/bin/bash

[[ -z $MACOS ]] && exit 0

PROFILES_DIR="$HOME/Library/Application Support/iTerm2/DynamicProfiles"

mkdir -p "$PROFILES_DIR"

for f in "$DOT/iterm2/profiles/"*.json; do
    ln -sf "$f" "$PROFILES_DIR/$(basename "$f")"
done

defaults write com.googlecode.iterm2 TerminalMargin -int 8
defaults write com.googlecode.iterm2 TerminalVMargin -int 8
defaults write com.googlecode.iterm2 "Default Bookmark Guid" -string "dotfiles-solarized-light-001"
