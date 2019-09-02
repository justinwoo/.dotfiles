let
  pkgs = import <nixpkgs> {};

in
import (
  pkgs.fetchFromGitHub {
    owner = "nixos";
    repo = "nixpkgs";
    rev = "ddefb5f067f08d0846e82c60ac44a8791930be66";
    sha256 = "04mfniqbfl88i991kqq1h3ki7bpbmfalmxq2ih4zngw7wiq6pfx0";
  }
)
