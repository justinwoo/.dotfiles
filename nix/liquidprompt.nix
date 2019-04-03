{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation {
  name = "liquidprompt";

  src = pkgs.fetchFromGitHub {
    owner = "nojhan";

    repo = "liquidprompt";

    rev = "eda83efe4e0044f880370ed5e92aa7e3fdbef971";

    sha256 = "1p7ah3x850ajpq07xvxxd7fx2i67cf0n71ww085g32k9fwij4rd4";
  };

  phases = "unpackPhase installPhase";

  installPhase = ''
    mkdir -p $out/liquidprompt
    cp -R $src/* $out/liquidprompt
  '';
}
