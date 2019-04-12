{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation {
  name = "firefox-simple";

  src = pkgs.fetchurl {
    url = "https://download-installer.cdn.mozilla.net/pub/firefox/releases/66.0.3/linux-x86_64/en-US/firefox-66.0.3.tar.bz2";

    sha256 = "04nrqhpwqh7i4h0h4llvwn3c8nnybclga785g3jk90pd4i7cqsps";
  };

  phases = "unpackPhase installPhase";

  installPhase = ''
    mkdir -p $out/bin
    mkdir -p $out/firefox
    ${pkgs.gnutar}/bin/tar xf $src --strip 1 -C $out/firefox
    ln -s $out/firefox/firefox $out/bin/firefox
  '';
}
