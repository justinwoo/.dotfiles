{ pkgs ? import <nixpkgs> {} }:

import (
  pkgs.fetchFromGitHub {
    owner = "xzfc";
    repo = "cached-nix-shell";
    rev = "9bd1649452280c20b4978bc0122208e2c6cd46f0";
    sha256 = "1wn5srs27l3csidlhyavgfc99hxs5nwii6m8dgizkyqkjcrwp85p";
  }
) {
  inherit pkgs;
}
