{ pkgs ? import ./pinned.nix {} }:

let
  src = builtins.fetchurl {
    url = "https://downloads.slack-edge.com/linux_releases/slack-desktop-4.3.2-amd64.deb";
    sha256 = "022raf4nhqp4wphhy3a2pn1hq2v8mms48xfd4wsvh9jj6rwvzsrq";
  };

  copy-script = pkgs.writeScriptBin "copy-slack-deb" ''
    #!/usr/bin/env bash
    cp --no-preserve=mode ${src} .
    echo "Remember to dpkg install slack"
  '';

in
pkgs.mkShell {
  buildInputs = [ copy-script ];
}
