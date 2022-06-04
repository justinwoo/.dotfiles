{ pkgs ? import <nixpkgs> { } }:

import
  (
    pkgs.fetchFromGitHub {
      owner = "nix-community";
      repo = "nix-direnv";
      rev = "0e844baa7ff02d29cd45a8627a33dc299d7b1cc8";
      sha256 = "17f9h4j42cr6dw813rhyp8fc3n4ci1nbh63ag8kxzx7x7l56jsq5";
    }
  )
{ }
