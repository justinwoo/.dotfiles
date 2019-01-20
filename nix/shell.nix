let
  pkg = import <nixpkgs> {};

in pkg.stdenv.mkDerivation {
  name = "my-shell";

  buildInputs = builtins.attrValues (import ./packages.nix);
}
