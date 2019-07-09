{ pkgs ? import <nixpkgs> {} }:

pkgs.runCommand "autorandr-postswitch" {
  name = "autorandr-postswitch";

  src = ./postswitch;
} ''
    ln -s $src $out
  ''
