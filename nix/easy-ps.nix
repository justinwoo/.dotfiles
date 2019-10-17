{ pkgs ? import <nixpkgs> {} }:

import (
  pkgs.fetchFromGitHub {
    owner = "justinwoo";
    repo = "easy-purescript-nix";
    rev = "ab6c0a0518d14f68d0684344219959642adf4355";
    sha256 = "11skjldl28vlmm48bqza4b7bmly3dlppvha036nkgljkihqs69w7";
  }
) {
  inherit pkgs;
}
