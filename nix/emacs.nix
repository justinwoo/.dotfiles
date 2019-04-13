{ pkgs ? import ./pinned.nix {} }:

pkgs.emacs.overrideAttrs (old: rec {
  name = "emacs-${version}${versionModifier}";

  version = "26.2";

  versionModifier = "";

  src = pkgs.fetchurl {
    url = "mirror://gnu/emacs/${name}.tar.xz";

    sha256 = "13n5m60i47k96mpv5pp6km2ph9rv2m5lmbpzj929v02vpsfyc70m";
  };

  patches = [ ];
})
