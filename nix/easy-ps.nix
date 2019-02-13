{ pkgs ? import <nixpkgs> {} }:

import (pkgs.fetchFromGitHub {
  owner = "justinwoo";
  repo = "easy-purescript-nix";
  rev = "d9e92b89b53865e93a56d19b2f1e55dc0c344696";
  sha256 = "1miphbm0m3i7mrjyyb8s97ka62pwgvql8vry0jqz8zdllfqm0rh2";
})
