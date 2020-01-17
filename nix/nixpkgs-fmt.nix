{ pkgs ? import <nixpkgs> {} }:

import (
  pkgs.fetchFromGitHub {
    owner = "justinwoo";
    repo = "my-nixpkgs-fmt";
    rev = "907535cbcc45b4717e32339423dbdbfcf1a6a58c";
    sha256 = "0fr0rii311my8mpafhd2km5ag3f4rp1hzf4xn1ppsgrsa7x792fv";
  }
) {}
