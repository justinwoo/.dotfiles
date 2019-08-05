{ pkgs ? import <nixpkgs> {} }:

import (pkgs.fetchFromGitHub {
  owner = "justinwoo";
  repo = "my-lorri";
  rev = "350a43902265a6b1bf7da5b057d07f6246b53555";
  sha256 = "031rdy8ayarvfbh6qwqa0wppciiaa3zb12298b5768gzbyqvsjba";
}) {
  inherit pkgs;
}
