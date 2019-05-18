{ pkgs ? import <nixpkgs> {} }:

import (pkgs.fetchFromGitHub {
  owner = "justinwoo";
  repo = "easy-purescript-nix";
  rev = "e82748382170156f7daf9cd1f370b74a3397d9b5";
  sha256 = "03mqqppl4bxljppgpr5n64fg0lxjamb11lq6x4n8x38b1y0f51jd";
})
