{ pkgs ? import <nixpkgs> { } }:

import
  (
    pkgs.fetchFromGitHub {
      owner = "justinwoo";
      repo = "tin-summer-derivation";
      rev = "34c2d7539edf46096bb4b52639361674b143fdc3";
      sha256 = "1w3aj0b7a17rrmjp8f9mbyjcx4llynqsm1r95m0vic8w29yqa3kl";
    }
  )
{
  inherit pkgs;
}
