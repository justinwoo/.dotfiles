{ pkgs ? import <nixpkgs> {} }:

import (
  pkgs.fetchFromGitHub {
    owner = "justinwoo";
    repo = "easy-purescript-nix";
    rev = "4dc9b8e589aa3a4daae513a58db2d7149ec413b0";
    sha256 = "1g77n8717brnqbygmn0v0sb60mryigcr0dfy4556yz8mb88ypcrd";
  }
) {
  inherit pkgs;
}
