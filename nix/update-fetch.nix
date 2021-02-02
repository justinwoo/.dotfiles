{ pkgs ? import <nixpkgs> {} }:

import (
  pkgs.fetchFromGitHub {
    owner = "justinwoo";
    repo = "update-fetch";
    rev = "5c7db176857bf7aca6ae145b89bcdcc8f1d0262a";
    sha256 = "00z3ndhdlp9pwkw1nifvdpdzvbjdsdxggwr2h252nwjayl5jkf76";
  }
) {
  inherit pkgs;
}
