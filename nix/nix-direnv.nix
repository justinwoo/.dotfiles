{ pkgs ? import <nixpkgs> { } }:

import
  (
    pkgs.fetchFromGitHub {
      owner = "nix-community";
      repo = "nix-direnv";
      rev = "02e11da5fb485ebc2b3746cbf024fc12f9376a8c";
      sha256 = "0r4qwkdlz9j7ixiv29dml7c5ckwrd658im1m6hmgbfrsancx9jjk";
    }
  )
{ }
