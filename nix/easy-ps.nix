{ pkgs ? import <nixpkgs> {} }:

import (
  pkgs.fetchFromGitHub {
    owner = "justinwoo";
    repo = "easy-purescript-nix";
    rev = "d5f44b9389b290874cc3e479741b746067f19a78";
    sha256 = "0vswaasg2ik7csi40a0ihpxxzp4c803z7mjd096f3lmjrbw4j4av";
  }
) {
  inherit pkgs;
}
