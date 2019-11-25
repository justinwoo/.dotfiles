{ pkgs ? import <nixpkgs> {} }:

import (
  pkgs.fetchFromGitHub {
    owner = "justinwoo";
    repo = "my-nixpkgs-fmt";
    rev = "c3fd7f6e1f2a32c54863d5311a2d6376d91a2992";
    sha256 = "0bvqnbha10dfl5c6d3wk9vpgb2s6w6yfbybhdkgsvih0zdrirgii";
  }
) {}
