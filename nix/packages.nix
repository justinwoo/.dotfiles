{ pkgs ? import ./pinned.nix {} }:

let
  easy-dhall = import ./easy-dhall.nix;

  easy-ps = import ./easy-ps.nix {};

  nix-utils = import ./nix-utils.nix {
    inherit pkgs;
  };

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
      "z"
    ]
  );

in
nix-utils // my-pkgs // {
  # i3

  inherit (pkgs) feh i3 i3status rofi scrot polybarFull;

  # ps

  inherit (easy-ps.inputs) purs psc-package-simple spago purty;

  # dhall

  inherit (easy-dhall) dhall-simple dhall-json-simple;

  # gnome

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
    nodejs-10_x
    noto-fonts-cjk
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
