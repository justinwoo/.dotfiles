{ pkgs ? import ./pinned.nix {} }:

pkgs.stdenv.mkDerivation {
  name = "alacritty";

  src = pkgs.fetchurl {
    url = "https://github.com/jwilm/alacritty/releases/download/v0.2.9/Alacritty-v0.2.9-x86_64.tar.gz";

    sha256 = "1x6h0bfzhz9vc0ndv32szpmxrl30kkigxxx9vqq4p097x1bn2npi";
  };

  unpackPhase = ''
      mkdir -p $out/bin
      tar xf $src -C $out/bin
      chmod u+w $out/bin/alacritty
  '';

  dontInstall = true;
}
