{ pkgs ? import <nixpkgs> {} }:

pkgs.runCommand "my-fonts" {
  name = "my-fonts";
} ''
    ln -s ${pkgs.noto-fonts-cjk.outPath}/share/fonts $out
  ''
