{ pkgs ? import <nixpkgs> {} }:

import
  (
    pkgs.fetchFromGitHub {
      owner = "justinwoo";
      repo = "my-st";
      rev = "7c3247ae7155746f0f961f4148b17db1e9545146";
      sha256 = "1ymiiaadpj1y56iv9nhp223s9a70j90yprb687skc5lh38bwm2ld";
    }
  )
  { inherit pkgs; }
