let
  pkgs = import <nixpkgs> {};

in import (pkgs.fetchFromGitHub {
  owner = "justinwoo";
  repo = "easy-dhall-nix";
  rev = "0ebdec46cbeee62b7cb06847ca38cc6fa09e0ff2";
  sha256 = "1qnm5c2q46lkdm39gjyfp35anhz5sil6wknazg8s2ldh3c6znhxj";
}) {}
