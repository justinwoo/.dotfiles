{ pkgs ? import ./pinned.nix {} }:

let
  src = builtins.fetchurl {
    url = "https://az764295.vo.msecnd.net/stable/c47d83b293181d9be64f27ff093689e8e7aed054/code_1.42.1-1581432938_amd64.deb";
    sha256 = "0qdbk15f6fl806xmarr1iyln1ydp31z1n5318l322mmbwjykvn8f";
  };

  copy-script = pkgs.writeScriptBin "copy-vscode-deb" ''
    #!/usr/bin/env bash
    cp --no-preserve=mode ${src} .
    echo "Remember to dpkg install vscode"
  '';

in
pkgs.mkShell {
  buildInputs = [ copy-script ];
}
