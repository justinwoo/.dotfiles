{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation {
  name = "firefox-simple";

  src = pkgs.fetchurl {
    url = "https://download-installer.cdn.mozilla.net/pub/firefox/releases/65.0.1/linux-x86_64/en-US/firefox-65.0.1.tar.bz2";

    sha256 = "0mnb99w54bzak7wqb1l2c4hff6ki9ah3q8db2xg1nbc79ciax6m8";
  };

  phases = "unpackPhase installPhase";

  installPhase = ''
    mkdir -p $out/bin
    mkdir -p $out/firefox
    ${pkgs.gnutar}/bin/tar xf $src --strip 1 -C $out/firefox
    ln -s $out/firefox/firefox $out/bin/firefox
  '';
}
