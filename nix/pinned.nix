let
  pkgs = import <nixpkgs> {};

in
import (
  pkgs.fetchFromGitHub {
    owner = "nixos";
    repo = "nixpkgs";
    rev = "62bbc2abc1f3ae24943a204a4095c20737189656";
    sha256 = "0cggas9zl19pzc0ikj9zdxvygqrgmj26snnmhhj27d25kh6cksww";
  }
)
