let
  pkgs = import <nixpkgs> {};
in
import (
  pkgs.fetchFromGitHub {
    owner = "nixos";
    repo = "nixpkgs";
    rev = "7fab0b1c1acfa89634ed4a330a550c3e39ea59cc";
    sha256 = "1i9x6q8jclpl1bkyh0743pn1aw5mkfq0q475blln188d4zrixmck";
  }
)
