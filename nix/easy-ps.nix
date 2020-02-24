{ pkgs ? import <nixpkgs> {} }:

import (
  pkgs.fetchFromGitHub {
    owner = "justinwoo";
    repo = "easy-purescript-nix";
    rev = "340e82b6ecaccc4059740e69f8ec18546b527481";
    sha256 = "1q2ciwd3193kig1paidzrgxl60y4rb39bsi97lk7m6ff8mis6z6i";
  }
) {
  inherit pkgs;
}
