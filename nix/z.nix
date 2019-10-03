{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation {
  name = "z-simple";

  src = pkgs.fetchFromGitHub {
    owner = "rupa";
    repo = "z";
    rev = "e77e9384937bd43eb6ca8f1ba036924f4006df07";
    sha256 = "0v43ls2cjd4awlp16q4p1zlfjlky53qp8vd3rhdcd61v0jx9yila";
  };

  phases = "unpackPhase installPhase";

  installPhase = ''
    mkdir -p $out/z
    cp -R $src/* $out/z
    chmod +x $out/z/z.sh
  '';
}
