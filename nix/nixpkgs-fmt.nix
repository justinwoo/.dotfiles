{ pkgs ? import <nixpkgs> { } }:

import
  (
    pkgs.fetchFromGitHub {
      owner = "justinwoo";
      repo = "my-nixpkgs-fmt";
      rev = "fbc0c5dee8c26ed3571eb7baf7c05fc309d193f0";
      sha256 = "0ag9c98gnmm3qwkh0zxryfv4dqxlknprvk4ccj0bidlkr5350hlh";
    }
  )
{ }
