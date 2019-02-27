{ pkgs ? import ./pinned.nix {} }:

let
  easy-dhall = import ./easy-dhall.nix;
  easy-ps = import ./easy-ps.nix {};

  i3-pkgs = rec {
    i3 = pkgs.i3;
    # old overrides:
    # i3 = pkgs.i3.overrideAttrs (old: rec {
    #   name = "i3-${version}";
    #   version = "4.16.1";

    #   src = pkgs.fetchurl {
    #     url = "https://i3wm.org/downloads/i3-4.16.tar.bz2";
    #     sha256 = "1d2mnryn7m9c6d69awd7lwzadliapd0ahi5n8d0ppqy533ssaq6c";
    #   };
    # });

    polybar = pkgs.polybar.override {
      i3Support = true;
      pulseSupport = true;
    };

    inherit (pkgs)
    scrot
    i3status
    feh
    rofi;
  };

  prefetch-url = import (pkgs.fetchFromGitHub {
    owner = "justinwoo";
    repo = "prefetch-url";
    rev = "71a74a6facfe8bd81ad0e571ef382b9abd887718";
    sha256 = "1qgdpy7qxlz81sf55lyswwjyzn99siy745k3w4y7l26w68zjrjki";
  }) {};

  prefetch-github = import (pkgs.fetchFromGitHub {
    owner = "justinwoo";
    repo = "prefetch-github";
    rev = "ecc358529592f403d24a955c293922124c4354f7";
    sha256 = "1wcyzmbrs0rzva7jwnqa4vqr34z1sv1cigpyyiaajkf8bx29pamw";
  }) {};

  update-fetch-derivations = import (pkgs.fetchFromGitHub {
    owner = "justinwoo";
    repo = "update-fetch-derivations";
    rev = "7b58debd6cc8dbdcaee81aef7869fecb31d00463";
    sha256 = "1m3g8zrzzhw65qc8spccykasqlw85dl4jw2a7wx3gy0df1a2ympb";
  }) {};

  alacritty = pkgs.stdenv.mkDerivation {
    name = "alacritty";
    src = pkgs.fetchurl {
      url = "https://github.com/jwilm/alacritty/releases/download/v0.2.9/Alacritty-v0.2.9-x86_64.tar.gz";
      sha256 = "1x6h0bfzhz9vc0ndv32szpmxrl30kkigxxx9vqq4p097x1bn2npi";
    };

    unpackPhase = ''
      mkdir -p $out/bin
      tar xf $src -C $out/bin
      chmod u+w $out/bin/alacritty
    '';

    dontInstall = true;
  };

  z = import ./z.nix { inherit pkgs; };
  liquidprompt = import ./liquidprompt.nix { inherit pkgs; };

  ps-pkgs = {
    inherit (easy-ps.inputs)
    purs
    psc-package-simple
    purp
    spago
    psc-package2nix;
  };

  dhall-pkgs = {
    inherit (easy-dhall)
    dhall-simple
    dhall-json-simple
    dhall-bash-simple
    dhall-text-simple;
  };

  gnome3-pkgs = {
    inherit (pkgs.gnome3)
    # nautilus
    eog
    evince;
  };

  firefox = import ./firefox.nix { inherit pkgs; };

in   i3-pkgs
  // dhall-pkgs
  // ps-pkgs
  // gnome3-pkgs
  // {

    inherit alacritty;
    inherit firefox;
    inherit liquidprompt;
    inherit prefetch-github;
    inherit prefetch-url;
    inherit update-fetch-derivations;
    inherit z;

    inherit (pkgs)

    autorandr
    bash-completion
    bat
    cabal-install
    colordiff
    colormake
    disper
    emacs
    fd
    fzf
    ghc
    gitg
    gnumake
    jq
    neovim
    nix-bash-completions
    nodejs-10_x
    noto-fonts-cjk
    pavucontrol
    perl
    playerctl
    ripgrep
    shellcheck
    sqlitebrowser
    tig
    tmux
    watchexec
    xdotool

    ;

    inherit(pkgs.gitAndTools)
    git-extras
    hub;
  }
