{ pkgs ? import <nixpkgs> { } }:

import
  (
    pkgs.fetchFromGitHub {
      owner = "justinwoo";
      repo = "update-fetch";
      rev = "fe31d783ca58d5359edce92cb86d18e8258b7b0e";
      sha256 = "0fqbz08w8xlfr9a4zbi8wf3jnfvl37hlfid237w9vsbman95j35h";
    }
  )
{
  inherit pkgs;
}
