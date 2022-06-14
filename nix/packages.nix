{ pkgs ? import ./pinned.nix { } }:
let
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

  inherit (pkgs.gnome3) eog evince;

  inherit (pkgs.gitAndTools) git-extras hub;

  inherit (pkgs.unixtools) route;

  inherit (pkgs)
    autorandr
    bash-completion
    bat
    colordiff
    direnv
    emacs28
    exiftool
    fd
    fzf
    gh
    glibcLocales
    gnumake
    jq
    neovim
    nix-bash-completions
    nix-prefetch-git
    nixpkgs-fmt
    nodejs-16_x
    pamixer
    ripgrep
    shellcheck
    sox
    sqlite-interactive
    tig
    tmux
    watchexec
    xdotool
    ;
}
