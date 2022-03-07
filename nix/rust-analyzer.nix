{ pkgs ? import ./pinned.nix { } }:

pkgs.stdenv.mkDerivation {
  name = "rust-analyzer";

  src = pkgs.fetchurl {
    url = "https://github.com/rust-analyzer/rust-analyzer/releases/download/2020-03-09/rust-analyzer-linux";
    sha256 = "0kga537fviz2sxawwr8q9khr7kq4yknm5q31llid4sczmn447w5j";
  };

  unpackPhase = ''
    mkdir -p $out/bin
    target=$out/bin/rust-analyzer-linux
    ln -s $src $target
    chmod +x $target
  '';

  dontInstall = true;
}
