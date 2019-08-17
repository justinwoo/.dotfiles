{ pkgs ? import <nixpkgs> {} }:

import (pkgs.fetchFromGitHub {
  owner = "justinwoo";
  repo = "mkgif";
  rev = "046fe40b9b1fb7594e3b9f6db2207d623056ebb8";
  sha256 = "1s9gplx7fsb3gmipwzcx0mg5sdc6ylhsjzy0lcw80wzmfd4sd4dx";
}) {
  inherit pkgs;
}
