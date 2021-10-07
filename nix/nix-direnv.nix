{ pkgs ? import <nixpkgs> {} }:

import (
  pkgs.fetchFromGitHub {
    owner = "nix-community";
    repo = "nix-direnv";
    rev = "53c44ae33a453e2c9759cc81e028ca6a86f232d4";
    sha256 = "00nj5h26c5q8cpj3ag36ziymgwm1b8ccja49m5ka9lc9jig09lcl";
  }
) {}
