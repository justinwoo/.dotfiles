{ pkgs ? import <nixpkgs> {} }:

import (pkgs.fetchFromGitHub {
  owner = "justinwoo";
  repo = "my-lorri";
  rev = "579dbc6df776c0480d93a78435306a8fb191fb2b";
  sha256 = "099zmcfgydbm8bg25c5cxqad9vshj2jc67w89qbqvy12zqilpv76";
}) {
  inherit pkgs;
}
