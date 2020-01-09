{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation {
  name = "z-simple";

  src = pkgs.fetchFromGitHub {
    owner = "rupa";
    repo = "z";
    rev = "4f08e7febba8d024cbf583544a8cd563e02c3413";
    sha256 = "0rx75149wnxmbgys0ayyq61rfv4h19j3d1kh27hqa11k5gf2p0lp";
  };

  phases = "unpackPhase installPhase";

  installPhase = ''
    mkdir -p $out/z
    cp -R $src/* $out/z
    chmod +x $out/z/z.sh
  '';
}
