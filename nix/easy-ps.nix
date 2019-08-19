{ pkgs ? import <nixpkgs> {} }:

import (pkgs.fetchFromGitHub {
  owner = "justinwoo";
  repo = "easy-purescript-nix";
  rev = "a85ee748097fb70caaa953cb15bd18f81e4f85a1";
  sha256 = "16xmsgjvwwxsf05n5wwpa63vjhr5y3bplkzhc5hcv99ns9x76m8x";
}) {
  inherit pkgs;
}
