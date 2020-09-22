{ pkgs ? import <nixpkgs> {} }:

import (
  pkgs.fetchFromGitHub {
    owner = "nix-community";
    repo = "nix-direnv";
    rev = "e8c54c3f6424e83a7e2f821c61ac084a59b276ce";
    sha256 = "056rrl6if3brlpp4sl7sa6gyykjdinpwd9s305ischgkqncbsakx";
  }
) {}
