let
  pkgs = import <nixpkgs> {};
in
import (
  pkgs.fetchFromGitHub {
    owner = "nixos";
    repo = "nixpkgs";
    rev = "1bcafed94ee0b542bbb52c63a6878b8f4e111b5c";
    sha256 = "1q8mrcqhryx2hba7jkh53m2k2556qdc0khvrsh7jdbzr00z31grd";
  }
)
