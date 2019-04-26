{ pkgs ? import ./pinned.nix {} }:

let
  easy-dhall = import ./easy-dhall.nix;

  easy-ps = import ./easy-ps.nix {};

  i3-pkgs = rec {
    polybar = pkgs.callPackage ./polybar.nix {
      i3Support = true;

      pulseSupport = true;
    };

    inherit (pkgs) feh i3 i3status rofi scrot;
  };

  ps-pkgs = {
    inherit (easy-ps.inputs) purs psc-package-simple purp spago psc-package2nix;
  };

  dhall-pkgs = {
    inherit (easy-dhall) dhall-simple dhall-json-simple;
  };

  gnome3-pkgs = {
    inherit (pkgs.gnome3) eog evince;
  };

  firefox = import ./firefox.nix {
    inherit pkgs;
  };

  nix-utils = import ./nix-utils.nix {
    inherit pkgs;
  };

  alacritty = import ./alacritty.nix {
    inherit pkgs;
  };

  z = import ./z.nix {
    inherit pkgs;
  };

  emacs = import ./emacs.nix {
    inherit pkgs;
  };

  myrica = pkgs.callPackage ./myrica.nix {};

in i3-pkgs // dhall-pkgs // ps-pkgs // gnome3-pkgs // nix-utils // {
  inherit alacritty;

  inherit emacs;

  inherit firefox;

  inherit myrica;

  inherit z;

  inherit (pkgs.gitAndTools) git-extras hub;

  inherit (pkgs.unixtools) route;

  inherit (pkgs)
    autorandr
    bash-completion
    bat
    cabal-install
    colordiff
    colormake
    disper
    direnv
    fd
    fzf
    ghc
    gitg
    glibcLocales
    gnumake
    jq
    neovim
    nix-bash-completions
    nodejs-10_x
    noto-fonts-cjk
    pavucontrol
    playerctl
    ripgrep
    shellcheck
    sqlite
    sqlitebrowser
    tig
    tmux
    watchexec
    xdotool;
}
