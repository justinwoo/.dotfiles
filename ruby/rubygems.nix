{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation rec {
  name = "rubygems";

  src = pkgs.fetchurl {
    url = "https://rubygems.org/rubygems/rubygems-3.0.3.tgz";
    sha256 = "0b6b9ads8522804xv8b8498gqwsv4qawv13f81kyc7g966y7lfmy";
  };

  installPhase = ''
    mkdir -p $out/rubygems
    mkdir -p $out/bin

    GEM=$out/bin/gem

    tar xf $src --strip 1 -C $out/rubygems
    ln -s $out/rubygems/bin/gem $GEM
  '';
}
