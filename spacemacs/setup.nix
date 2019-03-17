#!/usr/bin/env nix-shell
#!nix-shell ./setup.nix --run exit -j 20

{ pkgs ? import ../nix/pinned.nix {} }:

let
  elpaDevelop = "~/.emacs.d/elpa/develop/";

  emacsTrash = pkgs.fetchFromGitHub {
    owner = "justinwoo";
    repo = "emacs-trash";
    rev = "08305410c60f7d5c91eb44d7711e8754e91c9756";
    sha256 = "1k9gp3lijd4caf88jk9alzfwbjqg4iifja25vaa5kpmkih1dl613";
  };

in pkgs.stdenv.mkDerivation {
  name = "spacemacs-install";
  # prefetch-github -owner syl20bnr -repo spacemacs -branch -rev develop
  src = pkgs.fetchFromGitHub {
    owner = "syl20bnr";
    repo = "spacemacs";
    # warning: do not let this update to the useless master branch
    rev = "4b195ddfc9228256361e0b264fe974aa86ed51a8";
    sha256 = "123mc3hb13kq812l4nv2c7qbasqadyjj3nyhj5y8psg5lqdrl6qx";
  };
  phases = "unpackPhase";
  shellHook = ''
    echo $src
    echo "copying $src to ~/.emacs.d"
    cp -TR --no-preserve=mode $src ~/.emacs.d

    echo "copying trash"
    mkdir -p ~/.emacs.d/elpa/develop
    cp -TR --no-preserve=mode ${emacsTrash} ~/.emacs.d/elpa/develop

    nix-env -f local-packages.nix -i -j 10
  '';
}
