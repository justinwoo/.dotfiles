{ pkgs ? import ./pinned.nix {} }:

pkgs.stdenv.mkDerivation {
  name = "alacritty";

  src = pkgs.fetchurl {
    url = "https://github.com/jwilm/alacritty/releases/download/v0.3.0/Alacritty-v0.3.0-ubuntu_18_04-x86_64.tar.gz";

    sha256 = "0q03q6nd2xg390drvnsx1m76n9nyx494dcgqsvjrjgig6f8ynd32";
  };

  unpackPhase = ''
      mkdir -p $out/bin
      tar xf $src -C $out/bin
      chmod u+w $out/bin/alacritty
  '';

  dontInstall = true;
}
