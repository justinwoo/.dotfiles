{ pkgs ? import ../nix/pinned.nix {} }:

let
  mkLocalPackageDrv = name: src:
  pkgs.runCommand name {
    inherit src;
  } ''
    TARGET=$out/elisp/${name}
    mkdir -p $TARGET
    cp -vR $src/* $TARGET
  '';
in {

  psc-ide-local = mkLocalPackageDrv "psc-ide-local"
  (pkgs.fetchFromGitHub {
    owner = "justinwoo";
    repo = "psc-ide-emacs";
    # warning: uses my-changes
    rev = "13fd6bc538b86650037933c11c75ec341c6d9b04";
    sha256 = "191zj51fqfikqzf44f35vhx5d1dbp99m7kkhd75r3p3nmdvnn8i8";
  });

  nix-mode = mkLocalPackageDrv "nix-mode"
  (pkgs.fetchFromGitHub {
    owner = "nixos";
    repo = "nix-mode";
    rev = "01c53b7ff1b91d65e2ee7db47f6190f3dd89bae9";
    sha256 = "0vcb29d6xv8c1kx3q9hq3bfkrdgm7qlin5753c6cnnk1vra1ksxn";
  });

}
