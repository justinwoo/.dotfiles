{ pkgs ? import <nixpkgs> {} }:

import (pkgs.fetchFromGitHub {
  owner = "justinwoo";
  repo = "easy-purescript-nix";
  rev = "f47208b5f136766243c07a29c9b9f685d92eb5c8";
  sha256 = "00iy1rdr4qb4a093zkvm5yjxfkppcmbwlk59fakl1gzbcn0cd61b";
})
