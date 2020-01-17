{ pkgs ? import <nixpkgs> {} }:

import (
  pkgs.fetchFromGitHub {
    owner = "justinwoo";
    repo = "easy-purescript-nix";
    rev = "485471b86f764b9dd34e77ae767a629290f7f295";
    sha256 = "0fh7sxpnp8krs091imksrs6w3vw31sq9kpz26mdw1kbpa8f0sgby";
  }
) {
  inherit pkgs;
}
