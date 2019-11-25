{ pkgs ? import <nixpkgs> {} }:

import (
  pkgs.fetchFromGitHub {
    owner = "justinwoo";
    repo = "easy-purescript-nix";
    rev = "6be3f48f339034a58b1b1ae997ace534cf459826";
    sha256 = "10fxfxgbpr920bj69jail8vsj6qj5cf4g2r5brxiv23fz8nkzf5n";
  }
) {
  inherit pkgs;
}
