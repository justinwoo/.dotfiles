{ pkgs ? import <nixpkgs> {} }:

import
  (
    pkgs.fetchFromGitHub {
      owner = "justinwoo";
      repo = "my-st";
      rev = "aec79bbc375a5cb22c7ddac38880f557ff997a69";
      sha256 = "18x3p2w2zp5j5vcl422i671f4jn17rs9a4f7awsg68bnxb3ljgsf";
    }
  )
  { inherit pkgs; }
