let
  pkgs = import <nixpkgs> { };
in
import (
  pkgs.fetchFromGitHub {
    owner = "nixos";
    repo = "nixpkgs";
    rev = "efa5fc967fcef9ab68d8db19ddc8dce439f224d8";
    sha256 = "k17IBE6ERmJKhvmCN6ZYPw4ERFNh7v9XpGqlm4uFtA0=";
  }
)
