{ pkgs ? import ./pinned.nix {} }:

let
  src = builtins.fetchurl {
    url = "https://non-gnu.uvt.nl/debian/bionic/mpv/mpv_0.32.0+wsl.2_amd64.deb";
    sha256 = "1ry0fix22kbmag56ps1i697wsjzplpnl1k4khzzg4rp7mrs2rbql";
  };

  copy-script = pkgs.writeScriptBin "copy-mpv-deb" ''
    #!/usr/bin/env bash
    cp --no-preserve=mode ${src} .
    echo "Remember to dpkg install mpv"
  '';

in
pkgs.mkShell {
  buildInputs = [ copy-script ];
}
