{ pkgs ? import ./pinned.nix { } }:
let
  packages = import ./packages.nix { inherit pkgs; };
in
pkgs.buildEnv {
  name = "my-packages";
  paths = builtins.attrValues packages;
}
