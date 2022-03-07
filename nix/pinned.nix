let
  pkgs = import <nixpkgs> { };
in
import (
  pkgs.fetchFromGitHub {
    owner = "nixos";
    repo = "nixpkgs";
    rev = "65b2a742675f684bfdcc1368884f8116ff6b2c99";
    sha256 = "1byhhlbkcaxqaxvby46g450cv5wgp6wwi8d9bxqp4nfdf9lmj88p";
  }
)
