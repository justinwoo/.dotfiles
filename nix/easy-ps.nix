{ pkgs ? import <nixpkgs> {} }:

import (pkgs.fetchFromGitHub {
  owner = "justinwoo";
  repo = "easy-purescript-nix";
  rev = "80e6c66c7b5cffefeb823ebebf156d2d7acd3285";
  sha256 = "0npvnr3h4vnq6ibwi9gvxgijyjnwmmyvqglq471wkkn6b4ygry9v";
})
