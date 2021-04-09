{ pkgs ? import <nixpkgs> {} }:

import (
  pkgs.fetchFromGitHub {
    owner = "nix-community";
    repo = "nix-direnv";
    rev = "a512304cdebbb655817cd4eac8b0e710a781a14f";
    sha256 = "0537ak4316vg9h940shb9lyzchn9v52f0j2ak8pq0jm6glnha5j9";
  }
) {}
