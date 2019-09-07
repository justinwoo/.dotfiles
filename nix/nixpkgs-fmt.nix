{ pkgs ? import <nixpkgs> {} }:

import (
  pkgs.fetchFromGitHub {
    owner = "justinwoo";
    repo = "my-nixpkgs-fmt";
    rev = "3ef6bbaf726e4c569e0dc079652b0259e1639620";
    sha256 = "0qa9ps88gvvmznm4vmzrgzyf2mng8i1pgpdkj8gj86ygxwzqq85x";
  }
) {}
