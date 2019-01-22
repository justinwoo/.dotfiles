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

  lsp-mode-local = mkLocalPackageDrv "lsp-mode-local"
  (pkgs.fetchFromGitHub {
    owner = "emacs-lsp";
    repo = "lsp-mode";
    rev = "6c13f29b8020d2327991eb0b7468deefaf108541";
    sha256 = "05glsn4ianqj8i4m5naha21vrh6qf4v5r3g6l64kkq0v8qppz406";
  });

  lsp-ui-local = mkLocalPackageDrv "lsp-ui-local"
  (pkgs.fetchFromGitHub {
    owner = "emacs-lsp";
    repo = "lsp-ui";
    rev = "a8c50a93952afae3cd8948fecf4c1a3dc7f3e094";
    sha256 = "1r4327fd8cvjxfwkddp5c4bdskyncbs4sx9m3z2w4d773y2jrakc";
  });

  company-lsp-local = mkLocalPackageDrv "company-lsp-local"
  (pkgs.fetchFromGitHub {
    owner = "tigersoldier";
    repo = "company-lsp";
    rev = "7167fa4547a83d6e07196ebf0b05c384b0a9a2c6";
    sha256 = "1gxcj8mir4mdf4m4hh9napjaszcps00iyxq1rp01hnhq71iqzsms";
  });

  nix-mode = mkLocalPackageDrv "nix-mode"
  (pkgs.fetchFromGitHub {
    owner = "nixos";
    repo = "nix-mode";
    rev = "01c53b7ff1b91d65e2ee7db47f6190f3dd89bae9";
    sha256 = "0vcb29d6xv8c1kx3q9hq3bfkrdgm7qlin5753c6cnnk1vra1ksxn";
  });

}
