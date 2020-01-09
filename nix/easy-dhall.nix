let
  pkgs = import <nixpkgs> {};

in
import (
  pkgs.fetchFromGitHub {
    owner = "justinwoo";
    repo = "easy-dhall-nix";
    rev = "7e063af9bd6f6bd4b4be00dd0a8bff272893fc44";
    sha256 = "0c47zlxhpjm1hddhxsqy86mkyy7hlym1rjmnapc3b7x7bkchr8za";
  }
) {}
