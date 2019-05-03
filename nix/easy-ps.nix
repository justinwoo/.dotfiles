{ pkgs ? import <nixpkgs> {} }:

import (pkgs.fetchFromGitHub {
  owner = "justinwoo";
  repo = "easy-purescript-nix";
  rev = "6f359bf0f11690886558f96c297305ede5a70650";
  sha256 = "1ghh6gf6k7sxldrn9dsc5nwj0sk8sn89hyrz1m1w6qabzmkl75yd";
})
