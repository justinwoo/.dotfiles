let
  pkgs = import <nixpkgs> {};

in
import (
  pkgs.fetchFromGitHub {
    owner = "justinwoo";
    repo = "easy-dhall-nix";
    rev = "735ad924fd829c9bbee0a167e0b2bbbf91e2cad5";
    sha256 = "1r3sqs1cz0mcfwfvaq1d21vnppg5sqzqdl6w9krsw5ad5czkk190";
  }
) {}
