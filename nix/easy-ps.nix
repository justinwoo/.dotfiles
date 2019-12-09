{ pkgs ? import <nixpkgs> {} }:

import (
  pkgs.fetchFromGitHub {
    owner = "justinwoo";
    repo = "easy-purescript-nix";
    rev = "6cb5825430ab44719139f28b93d50c5810891366";
    sha256 = "1awsywpw92xr4jmkwfj2s89wih74iw4ppaifc97n9li4pyds56h4";
  }
) {
  inherit pkgs;
}
