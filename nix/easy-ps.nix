{ pkgs ? import <nixpkgs> {} }:

import (pkgs.fetchFromGitHub {
  owner = "justinwoo";
  repo = "easy-purescript-nix";
  rev = "f1e038e20596512656413fd3c192f57ad4fc88d3";
  sha256 = "1lxi09fnlgq4bcbcdjml1lvcldkh0kaz8x09ayw2s8dz8pzkv7a6";
})
