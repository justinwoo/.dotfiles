{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation {
  name = "firefox-simple";
  src = pkgs.fetchurl {
    url = "https://download-installer.cdn.mozilla.net/pub/firefox/releases/64.0.2/linux-x86_64/en-US/firefox-64.0.2.tar.bz2";
    sha256 = "19q9rsx7vh5w28fb3fyb7nb1gq98f29g3jlgnqi5cn6qkjyzm844";
  };
  phases = "unpackPhase installPhase";
  installPhase = ''
    mkdir -p $out/bin
    mkdir -p $out/firefox
    ${pkgs.gnutar}/bin/tar xf $src --strip 1 -C $out/firefox
    ln -s $out/firefox/firefox $out/bin/firefox
  '';
}
