{ pkgs ? import <nixpkgs> {} }:

import (pkgs.fetchFromGitHub {
  owner = "justinwoo";

  repo = "easy-purescript-nix";

  rev = "180098aa9d2e64928a9c7727222a71b4d6658e1e";

  sha256 = "0kf43ga3zc73vdv6kb8n8vqcxk9l31xpdhdlav23i0cmhkp137v6";
})
