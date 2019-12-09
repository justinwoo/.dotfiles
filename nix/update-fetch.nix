{ pkgs ? import <nixpkgs> {} }:

import (
  pkgs.fetchFromGitHub {
    owner = "justinwoo";
    repo = "update-fetch";
    rev = "146f97d4a239e3cb53f1d72cfd43bf25080c32dd";
    sha256 = "1maw28ra2jral30nid30d8yxdg3xwqq1waaj8dfl0b9pfb4j5w1x";
  }
) {
  inherit pkgs;
}
