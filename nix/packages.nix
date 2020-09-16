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
      "lorri"
      "mkgif"
      "nixpkgs-fmt"
      "rust-analyzer"
      "tin-summer"
      "update-fetch"
      "z"
    ]
  );

  dynamic-linker = pkgs.stdenv.cc.bintools.dynamicLinker;
  buildInputs = [ pkgs.gmp pkgs.zlib pkgs.ncurses5 pkgs.stdenv.cc.cc.lib ];
  libPath = pkgs.lib.makeLibraryPath buildInputs;

  purs-0_13_7 = pkgs.runCommand "purs-local" rec {
    src = pkgs.fetchurl {
      url = "https://github.com/justinwoo/purescript/releases/download/v0.13.7/purs";
      sha256 = "1dahif6z40acjsjm0clrq5hqhibdva6s3g8v49k9fjrvnfiwam77";
    };
  } ''
    mkdir -p $out/bin
    cp $src $out/bin/purs
    chmod +xw $out/bin/purs
    patchelf --interpreter ${dynamic-linker} --set-rpath ${libPath} $out/bin/purs
  '';
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
    sox
    sqlite
    sqlitebrowser
    tig
    tmux
    watchexec
    xdotool
    ;
}
