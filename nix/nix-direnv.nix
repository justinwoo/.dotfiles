{ pkgs ? import <nixpkgs> { } }:

import
  (
    pkgs.fetchFromGitHub {
      owner = "nix-community";
      repo = "nix-direnv";
      rev = "b4cdd0c3beeaf999df42a3d42fe7396961c402b4";
      sha256 = "195qfzkzhy74z61a47339nd7kcjd2qncbjyb9g9pffq8aw6lajb3";
    }
  )
{ }
