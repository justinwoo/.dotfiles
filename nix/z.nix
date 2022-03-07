{ pkgs ? import <nixpkgs> { } }:

pkgs.stdenv.mkDerivation {
  name = "z-simple";

  src = pkgs.fetchFromGitHub {
    owner = "rupa";
    repo = "z";
    rev = "b82ac78a2d4457d2ca09973332638f123f065fd1";
    sha256 = "0phk9lswwxsypchb11qsnxy1pv5xg1zkrqj8im6x2icma63hfcz2";
  };

  phases = "unpackPhase installPhase";

  installPhase = ''
    mkdir -p $out/z
    cp -R $src/* $out/z
    chmod +x $out/z/z.sh
  '';
}
