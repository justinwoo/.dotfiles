let
  pkgs = import <nixpkgs> {};
in
import (
  pkgs.fetchFromGitHub {
    owner = "nixos";
    repo = "nixpkgs";
    rev = "bf6df7187ebbd1f6614b788de4f5f68f03e4d51a";
    sha256 = "1y4sk57rq0iwz6ymlazin037q6jwv7d31zws235pqg3ssq6si3fr";
  }
)
