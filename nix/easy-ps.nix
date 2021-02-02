{ pkgs ? import <nixpkgs> {} }:

import (
  pkgs.fetchFromGitHub {
    owner = "justinwoo";
    repo = "easy-purescript-nix";
    rev = "c8c32741bc09e2ac0a94d5140cf51fa5de809e24";
    sha256 = "0rn938nbxqsd7lp7l8z1y7bhzaq29vbziq6hq9llb3yh9xs10lmf";
  }
) {
  inherit pkgs;
}
