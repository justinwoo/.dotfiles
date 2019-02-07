{ pkgs ? import <nixpkgs> {} }:

import (pkgs.fetchFromGitHub {
  owner = "justinwoo";
  repo = "easy-purescript-nix";
  rev = "5f9b10387ead1ccd424d1f53d91f9d685982729c";
  sha256 = "13rc474k1b8mph76ckz8kfv0rbkycfa9hfmvr8idjhkvb72mrxnq";
})
