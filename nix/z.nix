{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation {
  name = "z-simple";

  src = pkgs.fetchFromGitHub {
    owner = "rupa";
    repo = "z";
    rev = "9f76454b32c0007f20b0eae46d55d7a1488c9df9";
    sha256 = "0qywf8pdrlp43b6c1pgyl51501dhx4f672dk1b0lvdlkj37d4pgz";
  };

  phases = "unpackPhase installPhase";

  installPhase = ''
    mkdir -p $out/z
    cp -R $src/* $out/z
    chmod +x $out/z/z.sh
  '';
}
