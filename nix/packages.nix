{ pkgs ? import ./pinned.nix {} }:

let
  easy-dhall = import ./easy-dhall.nix;

  easy-ps = import ./easy-ps.nix {};

  importFrom = basename: {
    name = basename;

    value = import (./. + "/${basename}.nix") {
      inherit pkgs;
    };
  };

  my-pkgs = builtins.listToAttrs (
    map importFrom [
      "alacritty"
      "lorri"
      "mkgif"
      "nixpkgs-fmt"
      "tin-summer"
      "update-fetch"
      "z"
    ]
  );

in
my-pkgs // {
  inherit (pkgs) feh i3 i3status rofi scrot;

  inherit (easy-ps.inputs) purs psc-package-simple;

  inherit (easy-dhall) dhall-simple dhall-json-simple;

  inherit (pkgs.gnome3) eog evince;

  inherit (pkgs.gitAndTools) git-extras hub;

  inherit (pkgs.unixtools) route;

  inherit (pkgs)
    autorandr
    bash-completion
    bat
    colordiff
    direnv
    emacs
    exiftool
    fd
    fzf
    ghc
    glibcLocales
    gnumake
    graphviz
    jq
    neovim
    nix-bash-completions
    nodejs-12_x
    pavucontrol
    plantuml
    playerctl
    ripgrep
    R
    shellcheck
    sqlite
    sqlitebrowser
    tig
    tmux
    watchexec
    xdotool
    ;
}
