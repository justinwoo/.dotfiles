let
  pkgs = import <nixpkgs> {};
in
import (
  pkgs.fetchFromGitHub {
    owner = "justinwoo";
    repo = "easy-dhall-nix";
    rev = "4f6da8c7e7397cbc8429b481a49a7ff989c07195";
    sha256 = "1120m0yc06l8mv5wd1bqmkbm65krsmqlnnm0di79nw19n3f0m0ci";
  }
) {}
