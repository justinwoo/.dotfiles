{ pkg ? import <nixpkgs> {} }:

pkg.stdenv.mkDerivation {
  name = "my-shell";

  buildInputs = builtins.attrValues (import ./packages.nix {});
}
