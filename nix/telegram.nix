{ pkgs ? import ./pinned.nix {} }:
let
  src = builtins.fetchTarball {
    url = "https://updates.tdesktop.com/tlinux/tsetup.1.9.13.tar.xz";
    sha256 = "18mqpz85k2yp2zd88c4299cmza75gh6s94kw6y5wxgaffl2cl2ac";
  };
in
pkgs.writeScript "install-telegram" ''
  #!/usr/bin/env bash
  target=$HOME/Telegram
  mkdir -p $target
  cp --no-preserve=mode ${src}/* $target
  chmod +x $target/*
''
