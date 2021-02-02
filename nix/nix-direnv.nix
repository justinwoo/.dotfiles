{ pkgs ? import <nixpkgs> {} }:

import (
  pkgs.fetchFromGitHub {
    owner = "nix-community";
    repo = "nix-direnv";
    rev = "52996098653a97b2ed2dbcccb191e9ed38505a47";
    sha256 = "0g4rc772rmfmm39w8z9y7s65xp1wba9yglg2nhj187dqn2nxygfb";
  }
) {}
