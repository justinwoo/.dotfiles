{ pkgs ? import ./pinned.nix {} }:

pkgs.stdenv.mkDerivation {
  name = "alacritty";

  src = pkgs.fetchurl {
    url = "https://github.com/jwilm/alacritty/releases/download/v0.3.0-rc2/Alacritty-v0.3.0-rc2-x86_64.tar.gz";

    sha256 = "109y0yaqj2kc847d5b0a7xpnp5ffwgqxj2yvjz2vsfabcwpxm2m7";
  };

  unpackPhase = ''
      mkdir -p $out/bin
      tar xf $src -C $out/bin
      chmod u+w $out/bin/alacritty
  '';

  dontInstall = true;
}
