{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation {
  name = "firefox-simple";

  src = pkgs.fetchurl {
    url = "https://download-installer.cdn.mozilla.net/pub/firefox/releases/66.0.5/linux-x86_64/en-US/firefox-66.0.5.tar.bz2";
    sha256 = "05zzzhx41sj9jgr9vjq01dh33mvi4ncfss0ljwmr1w1d63zi68s8";
  };

  phases = "unpackPhase installPhase";

  installPhase = ''
    mkdir -p $out/bin
    mkdir -p $out/firefox
    ${pkgs.gnutar}/bin/tar xf $src --strip 1 -C $out/firefox
    ln -s $out/firefox/firefox $out/bin/firefox
  '';
}
