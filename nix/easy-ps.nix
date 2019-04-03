{ pkgs ? import <nixpkgs> {} }:

import (pkgs.fetchFromGitHub {
  owner = "justinwoo";

  repo = "easy-purescript-nix";

  rev = "d383972c82620a712ead4033db14110497bc2c9c";

  sha256 = "0hj85y3k0awd21j5s82hkskzp4nlzhi0qs4npnv172kaac03x8ms";
})
