{ pkgs ? import <nixpkgs> {} }:

import (
  pkgs.fetchFromGitHub {
    owner = "justinwoo";
    repo = "my-nixpkgs-fmt";
    rev = "3e5bb2cc1f80323c8e1e877f9a86ff6f48b5e10a";
    sha256 = "0rqysvgaw6736m8g1i3xa2mq3s0r51pal4h5v7vhn1na5x1kq2fr";
  }
) {}
