{ pkgs ? import <nixpkgs> { } }:

import
  (
    pkgs.fetchFromGitHub {
      owner = "justinwoo";
      repo = "update-fetch";
      rev = "fb54d83cd26ccf3ea91a610903478ca3d96afa4d";
      sha256 = "1f3r0g660izw7akici2l671vvrndjqf7pir4ahzbmh5crgq9mdks";
    }
  )
{
  inherit pkgs;
}
