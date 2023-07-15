#!/usr/bin/env bash
nix run 'nixpkgs/23.05#luaformatter' -- *.lua -i
