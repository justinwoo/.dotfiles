{ pkg ? import <nixpkgs> { } }:

pkg.stdenv.mkDerivation {
  name = "my-shell";

  buildInputs = builtins.attrValues (import ./packages.nix { });

  src = "./packages.nix";

  phases = "buildPhase";

  buildPhase = "touch $out";
}
