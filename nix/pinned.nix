let
  pkgs = import <nixpkgs> {};

in
import (
  pkgs.fetchFromGitHub {
    owner = "nixos";
    repo = "nixpkgs";
    rev = "b9c9ff9fb32fa213cded161dc329bb959d5f1240";
    sha256 = "1525sgiqgvv214qhk115dan6ys87j4qi28n6551wxr4vhwa701fk";
  }
)
