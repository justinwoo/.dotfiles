{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation {
  name = "z-simple";

  src = pkgs.fetchFromGitHub {
    owner = "rupa";
    repo = "z";
    rev = "f1f113d9bae9effaef6b1e15853b5eeb445e0712";
    sha256 = "1d0wwdjb0sgxzszbi7jnsnc6887h026r6hn4kzv9hjp1axr0dxrx";
  };

  phases = "unpackPhase installPhase";

  installPhase = ''
    mkdir -p $out/z
    cp -R $src/* $out/z
    chmod +x $out/z/z.sh
  '';
}
