let
  pkgs = import <nixpkgs> {};
in
import (
  pkgs.fetchFromGitHub {
    owner = "nixos";
    repo = "nixpkgs";
    rev = "76e1d5cf3b8f817e4e43f5b0fcdb951426956c35";
    sha256 = "1iz5dr9xx8qa1m94pjlr0dmb0b1syp2sp1514gw10r877cjxqvd8";
  }
)
