{ pkgs ? import <nixpkgs> {} }:

import (pkgs.fetchFromGitHub {
  owner = "justinwoo";
  repo = "tin-summer-derivation";
  rev = "360f8d3b424a7fb2bc9267c4aee5fe7c9f2d4914";
  sha256 = "0jaxghd2bsdidqb537lligl3wbcd6lxahkaq7b4jy8k2n1jdhvxi";
}) {
  inherit pkgs;
}
