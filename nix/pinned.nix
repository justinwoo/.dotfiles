import (builtins.fetchTarball {
  name = "nixpkgs-justinwoo-fix-gitlab-fetch";
  url = "https://github.com/justinwoo/nixpkgs/archive/655ca3cd8c46f37aaf2b1b4469580d26616174a3.tar.gz";
  sha256 = "0520ymim9w6q38k4m1rcmqbdiahc7jw5qvs6vlpkd1sfc5mswnr5";
})

# { pkgs ? import <nixpkgs> {} }:

# import (pkgs.fetchFromGitHub {
#   owner = "justinwoo";
#   repo = "nixpkgs";
#   # pinned to fix-gitlab-fetch...
#   rev = "5b0a9ff19b89846c62deb69fb116407cad1ee68d";
#   sha256 = "0ijxg5c45mv2dm1w7h5bqw08r4a140r3540d43spb75nn8lnbf4s";
# }) {}
