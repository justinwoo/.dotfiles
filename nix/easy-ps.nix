{ pkgs ? import <nixpkgs> {} }:

import (pkgs.fetchFromGitHub {
  owner = "justinwoo";
  repo = "easy-purescript-nix";
  rev = "e54b442633f59adedc3fbc81889ca7cb6b3ef087";
  sha256 = "17i19dnqmd71bdz83bc3aak2rx3p1lvgwp1cc02w3sm9i24s9pvz";
})
