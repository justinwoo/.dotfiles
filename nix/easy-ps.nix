{ pkgs ? import <nixpkgs> {} }:

import (pkgs.fetchFromGitHub {
  owner = "justinwoo";
  repo = "easy-purescript-nix";
  rev = "2bed26ac97f8a47f62c07ce3bc39ce05ca21c2b2";
  sha256 = "1h7vkpwsfgynyv6q7xr6mzhg1v9j9j8y62hkskk0qq4d3b25wmz5";
})
