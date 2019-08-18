{ pkgs ? import <nixpkgs> {} }:

import (pkgs.fetchFromGitHub {
  owner = "justinwoo";
  repo = "easy-purescript-nix";
  rev = "ba3a41aa7918e2123cfd281d8be42e58f092623e";
  sha256 = "0z813xp6as1ynld16gxjq7g74zix0237pqrrzdm2v3rvwx7iz4lb";
}) {
  inherit pkgs;
}
