{ pkgs ? import ./pinned.nix {} }:

pkgs.stdenv.mkDerivation {
  name = "alacritty";

  src = pkgs.fetchurl {
    url = "https://github.com/jwilm/alacritty/releases/download/v0.3.3/Alacritty-v0.3.3-ubuntu_18_04_amd64.tar.gz";
    sha256 = "1h607658gghqnzv5wcx66jxgwb3dddch2189clj7cqc81ppmc25n";
  };

  unpackPhase = ''
    mkdir -p $out/bin
    tar xf $src -C $out/bin
    chmod u+w $out/bin/alacritty
  '';

  dontInstall = true;
}
