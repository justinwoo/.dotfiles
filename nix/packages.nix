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
      "z"
    ] ++ pkgs.lib.optional (pkgs.stdenv.isLinux && pkgs.stdenv.is64bit)
      [
        "mkgif"
        "nix-direnv"
        "update-fetch"
      ]
  );

  dynamic-linker = pkgs.stdenv.cc.bintools.dynamicLinker;
  buildInputs = [ pkgs.gmp pkgs.zlib pkgs.ncurses5 pkgs.stdenv.cc.cc.lib ];
  libPath = pkgs.lib.makeLibraryPath buildInputs;

in
my-pkgs // {
  inherit (pkgs.gitAndTools) git-extras hub;

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
    jq
    neovim
    nix-bash-completions
    nix-prefetch-git
    nixpkgs-fmt
    nodejs-16_x
    ripgrep
    shellcheck
    sqlite-interactive
    tig
    tmux
    ;
} // pkgs.lib.optionalAttrs (pkgs.stdenv.isLinux && pkgs.stdenv.is64bit) {
  inherit (pkgs) feh i3 i3status rofi scrot;
  inherit (pkgs.gnome3) eog evince;
  inherit (pkgs.unixtools) route;

  inherit (pkgs)
    cached-nix-shell
    glibcLocales
    gnumake
    pamixer
    sox
    watchexec
    xdotool
    ;
}
