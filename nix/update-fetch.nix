{ pkgs ? import <nixpkgs> {} }:

import (
  pkgs.fetchFromGitHub {
    owner = "justinwoo";
    repo = "update-fetch";
    rev = "3f3b913aaa6fd05d1ecce04592df1c7796f52d26";
    sha256 = "1b97r0qhz5h29q5pbmanwx1678fvfcgiwava250rg29k1y0wfvsf";
  }
) {
  inherit pkgs;
}
