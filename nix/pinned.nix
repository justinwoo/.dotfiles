let
  pkgs = import <nixpkgs> { };
in
import (
  pkgs.fetchFromGitHub {
    owner = "nixos";
    repo = "nixpkgs";
    rev = "0f8eb0b8f2e3d440556036d6cae54e9576cb901b";
    sha256 = "0rwhq7cy4xy25gg2in6vah55psdizz7r187zy7z4c2a7pj2hs7ak";
  }
)
