{ pkgs ? import ./pinned.nix {} }:

pkgs.stdenv.mkDerivation {
  name = "alacritty";

  src = pkgs.fetchurl {
    url = "https://github.com/jwilm/alacritty/releases/download/v0.4.1/Alacritty-v0.4.1-ubuntu_18_04_amd64.tar.gz";
    sha256 = "1x2cnzb34gm91vw59cw5cmyxdqms2i0j7bycjfyq37ksi25nil3v";
  };

  unpackPhase = ''
    mkdir -p $out/bin
    tar xf $src -C $out/bin
    chmod u+w $out/bin/alacritty
  '';

  dontInstall = true;
}
