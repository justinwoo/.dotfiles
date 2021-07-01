{ pkgs ? import ./pinned.nix {} }:
let
  easy-ps = import ./easy-ps.nix {};

  importFrom = basename: {
    name = basename;

    value = import (./. + "/${basename}.nix") {
      inherit pkgs;
    };
  };

  my-pkgs = builtins.listToAttrs (
    map importFrom [
      "my-st"
      "mkgif"
      "nix-direnv"
      "nixpkgs-fmt"
      "update-fetch"
      "z"
    ]
  );

  dynamic-linker = pkgs.stdenv.cc.bintools.dynamicLinker;
  buildInputs = [ pkgs.gmp pkgs.zlib pkgs.ncurses5 pkgs.stdenv.cc.cc.lib ];
  libPath = pkgs.lib.makeLibraryPath buildInputs;

in
my-pkgs // {
  inherit (pkgs) feh i3 i3status rofi scrot;

  inherit (easy-ps.inputs) purs psc-package-simple;

  inherit (pkgs.gnome3) eog evince;

  inherit (pkgs.gitAndTools) git-extras hub;

  inherit (pkgs.unixtools) route;

  inherit (pkgs)
    autorandr
    bash-completion
    bat
    colordiff
    direnv
    emacs27
    exiftool
    fd
    fzf
    glibcLocales
    gnumake
    jq
    neovim
    nix-bash-completions
    nix-prefetch-git
    nodejs-12_x
    ripgrep
    shellcheck
    sox
    sqlite
    tig
    tmux
    watchexec
    xdotool
    ;
}
