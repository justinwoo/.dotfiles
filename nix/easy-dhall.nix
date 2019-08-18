let
  pkgs = import <nixpkgs> {};

in import (pkgs.fetchFromGitHub {
  owner = "justinwoo";
  repo = "easy-dhall-nix";
  rev = "0930101f28d113e6d86be39d37c43d9f894559fc";
  sha256 = "1gscs2bm6bzv9wr8i3g0b4zxj5mf303vhiw3fw8zqpdmbhjfr19i";
}) {}
