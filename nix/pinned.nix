let
  pkgs = import <nixpkgs> { };
in
import (
  pkgs.fetchFromGitHub {
    owner = "nixos";
    repo = "nixpkgs";
    rev = "76f559ba420d7719e7d2be24c3cf36249c75c554";
    sha256 = "14jcpq1cz5lnvh0j09py8snhk8lsb9v56jir7lk7b1d7aq19dfbq";
  }
)
