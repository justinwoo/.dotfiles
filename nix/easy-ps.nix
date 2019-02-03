{ pkgs ? import <nixpkgs> {} }:

import (pkgs.fetchFromGitHub {
  owner = "justinwoo";
  repo = "easy-purescript-nix";
  rev = "905548f4b07e39dab21039c605f8a8441040fbb2";
  sha256 = "17sc4x6l5zql006ca6wl3x1579ks3qcnjb1ck0s32ibwqybs20wc";
})
