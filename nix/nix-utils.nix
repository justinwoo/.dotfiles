{ pkgs ? import ./pinned.nix {} }:

{
  prefetch-url = import (
    pkgs.fetchFromGitHub {
      owner = "justinwoo";
      repo = "prefetch-url";
      rev = "71a74a6facfe8bd81ad0e571ef382b9abd887718";
      sha256 = "1qgdpy7qxlz81sf55lyswwjyzn99siy745k3w4y7l26w68zjrjki";
    }
  ) {
    inherit pkgs;
  };

  prefetch-github = import (
    pkgs.fetchFromGitHub {
      owner = "justinwoo";
      repo = "prefetch-github";
      rev = "46da8a320711f49c8f950d590cc821c4eaebde31";
      sha256 = "111qffz5515ak9qdgarvzmfg3pi8afhw5qrydlcrw6f31wsnibsv";
    }
  ) {
    inherit pkgs;
  };
}
