{ pkgs ? import ./pinned.nix {} }:

{

  prefetch-url = import (pkgs.fetchFromGitHub {
    owner = "justinwoo";
    repo = "prefetch-url";
    rev = "71a74a6facfe8bd81ad0e571ef382b9abd887718";
    sha256 = "1qgdpy7qxlz81sf55lyswwjyzn99siy745k3w4y7l26w68zjrjki";
  }) { inherit pkgs; };

  prefetch-github = import (pkgs.fetchFromGitHub {
    owner = "justinwoo";
    repo = "prefetch-github";
    rev = "ecc358529592f403d24a955c293922124c4354f7";
    sha256 = "1wcyzmbrs0rzva7jwnqa4vqr34z1sv1cigpyyiaajkf8bx29pamw";
  }) { inherit pkgs; };

  update-fetch-derivations = import (pkgs.fetchFromGitHub {
    owner = "justinwoo";
    repo = "update-fetch-derivations";
    rev = "7b58debd6cc8dbdcaee81aef7869fecb31d00463";
    sha256 = "1m3g8zrzzhw65qc8spccykasqlw85dl4jw2a7wx3gy0df1a2ympb";
  }) { inherit pkgs; };

}
