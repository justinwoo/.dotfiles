{ pkgs ? import <nixpkgs> { } }:
let
  importFrom = basename: {
    name = basename;

    value = import (./. + "/${basename}.nix") {
      inherit pkgs;
    };
  };

  my-pkgs = builtins.listToAttrs (
    map importFrom ([
      "z"
    ] ++ pkgs.lib.optionals (pkgs.stdenv.isLinux && pkgs.stdenv.is64bit)
      [
        "mkgif"
        "nix-direnv"
        # "update-fetch"
      ]
    )
  );

in
my-pkgs // {
  inherit (pkgs.gitAndTools) git git-extras hub;

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
    # nix-prefetch-git
    nixpkgs-fmt
    nodejs-18_x
    ripgrep
    shellcheck
    sqlite-interactive
    tig
    tmux
    ;
} // pkgs.lib.optionalAttrs (pkgs.stdenv.isLinux && pkgs.stdenv.is64bit) {
  inherit (pkgs) feh i3 i3status rofi scrot;
  inherit (pkgs.gnome3) eog evince;

  inherit (pkgs)
    glibcLocales
    gnumake
    pamixer
    watchexec
    xdotool
    ;
}
