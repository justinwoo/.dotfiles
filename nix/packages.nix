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
      "rust-analyzer"
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
    R
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
    ifconfig
    jq
    neovim
    nix-bash-completions
    nix-prefetch-git
    nodejs-12_x
    pavucontrol
    plantuml
    playerctl
    ripgrep
    shellcheck
    sqlite
    sqlitebrowser
    tig
    tmux
    watchexec
    xdotool
    ;
}
