let
  pkgs = import <nixpkgs> {};

in
import (
  pkgs.fetchFromGitHub {
    owner = "nixos";
    repo = "nixpkgs";
    rev = "3a0d1543b4c438357c88352ce0751c78270738a0";
    sha256 = "0390x040srhm6dsihb7vvfyx46jjx44fig4qiagr9b8md3k5av8p";
  }
)
