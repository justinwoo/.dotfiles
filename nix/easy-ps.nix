{ pkgs ? import <nixpkgs> { } }:

import
  (
    pkgs.fetchFromGitHub {
      owner = "justinwoo";
      repo = "easy-purescript-nix";
      rev = "5dca2f0f3b9ec0bceabb23fa1fd2b5f8ec30fa53";
      sha256 = "1vsc08ik9rs7vhnv8bg6bqf6gyqvywjfr5502rw1wpird74whhcs";
    }
  )
{
  inherit pkgs;
}
