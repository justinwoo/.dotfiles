{ pkgs ? import <nixpkgs> { } }:

import
  (
    pkgs.fetchFromGitHub {
      owner = "justinwoo";
      repo = "my-st";
      rev = "1d95ee580012e69af11e9558f1c3bf9e0c703850";
      sha256 = "1v068g5giiacrrzi096y0ic3485zv41lvjpnpk3dhwf1s2zl2sxh";
    })
{ inherit pkgs; }
