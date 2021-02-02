{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation {
  name = "z-simple";

  src = pkgs.fetchFromGitHub {
    owner = "rupa";
    repo = "z";
    rev = "125f4dc47e15891739dd8262d5b23077fe8fb9ab";
    sha256 = "0ihs3m8czx2x735r968jl31vs47psbjqfarqpcn891wzd9ygzzm0";
  };

  phases = "unpackPhase installPhase";

  installPhase = ''
    mkdir -p $out/z
    cp -R $src/* $out/z
    chmod +x $out/z/z.sh
  '';
}
