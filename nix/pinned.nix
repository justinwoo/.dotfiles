import (builtins.fetchTarball {
  name = "nixpkgs-justinwoo-fix-gitlab-fetch";
  url = "https://github.com/justinwoo/nixpkgs/archive/b12c3bb050c42ca63a77907b2271446b74b59ca3.tar.gz";
  sha256 = "01xhh5d0msn112zk3yvq6pr59asxxv4yqkyccxrpdb22wlcl9mhi";
})

# { pkgs ? import <nixpkgs> {} }:

# import (pkgs.fetchFromGitHub {
#   owner = "justinwoo";
#   repo = "nixpkgs";
#   # pinned to fix-gitlab-fetch...
#   rev = "5b0a9ff19b89846c62deb69fb116407cad1ee68d";
#   sha256 = "0ijxg5c45mv2dm1w7h5bqw08r4a140r3540d43spb75nn8lnbf4s";
# }) {}
