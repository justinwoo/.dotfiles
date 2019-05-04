{ pkgs ? import ./pinned.nix {} }:

pkgs.stdenv.mkDerivation {
  name = "alacritty";

  src = pkgs.fetchurl {
    url = "https://github.com/jwilm/alacritty/releases/download/v0.3.2/Alacritty-v0.3.2-ubuntu_18_04-x86_64.tar.gz";
    sha256 = "0msxghy8x6izq9mvx1173lsajw15ngnvsip2bq8hx6rymyfq6002";
  };

  unpackPhase = ''
      mkdir -p $out/bin
      tar xf $src -C $out/bin
      chmod u+w $out/bin/alacritty
  '';

  dontInstall = true;
}
