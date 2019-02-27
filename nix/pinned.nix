import (builtins.fetchTarball {
  name = "nixpkgs-justinwoo-fix-gitlab-fetch";
  url = "https://github.com/justinwoo/nixpkgs/archive/06e4e489e637848c2a348eb21f146f1f5572028f.tar.gz";
  sha256 = "17zlggjpqrj2s9k413w8fwgvi9fiym49anczmwh1w0365qh7azpk";
})

# { pkgs ? import <nixpkgs> {} }:

# import (pkgs.fetchFromGitHub {
#   owner = "justinwoo";
#   repo = "nixpkgs";
#   # pinned to fix-gitlab-fetch...
#   rev = "5b0a9ff19b89846c62deb69fb116407cad1ee68d";
#   sha256 = "0ijxg5c45mv2dm1w7h5bqw08r4a140r3540d43spb75nn8lnbf4s";
# }) {}
