{ pkgs ? import <nixpkgs> {} }:

import (
  pkgs.fetchFromGitHub {
    owner = "justinwoo";
    repo = "my-nixpkgs-fmt";
    rev = "09213dab289a1643f9c429b30d03914a18432f46";
    sha256 = "0y5r2vnh2a57lszkhj98199g5ad8cnpmbpbgqmvlra3gwdwq2ndn";
  }
) {}
