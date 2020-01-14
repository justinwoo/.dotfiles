let
  pkgs = import <nixpkgs> {};

in
import (
  pkgs.fetchFromGitHub {
    owner = "nixos";
    repo = "nixpkgs";
    rev = "cfc2ead8b3c2a5b60f0859e07a4646794bff52a0";
    sha256 = "1gqg2fh7inlyr98v6yk7c2li6c60wfs7kn8yl663k4sz83b26jqx";
  }
)
