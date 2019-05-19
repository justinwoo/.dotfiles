{ pkgs ? import <nixpkgs> {} }:

import (pkgs.fetchFromGitHub {
  owner = "justinwoo";
  repo = "easy-purescript-nix";
  rev = "38272e5ae6ca18dab1f9c0afd88c4dcc0fd7ebe2";
  sha256 = "1c26hyzfh5j095gz1mj6m6nknxj5w85yf9f9h0df36537l9cv0hg";
})
