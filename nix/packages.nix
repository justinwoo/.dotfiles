{ pkgs ? import ./pinned.nix {} }:

let
  easy-dhall = import ./easy-dhall.nix;

  lorri = import ./lorri.nix {};

  easy-ps = import ./easy-ps.nix {};

  tin-summer = import ./tin-summer.nix {};

  i3-pkgs = rec {
    inherit (pkgs) feh i3 i3status rofi scrot polybarFull;
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

  nix-utils = import ./nix-utils.nix {
    inherit pkgs;
  };

  alacritty = import ./alacritty.nix {
    inherit pkgs;
  };

  z = import ./z.nix {
    inherit pkgs;
  };

  emacs = pkgs.emacs;

in i3-pkgs // dhall-pkgs // ps-pkgs // gnome3-pkgs // nix-utils // {
  inherit alacritty;

  inherit lorri;

  inherit emacs;

  inherit tin-summer;

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
