import (builtins.fetchTarball {
  name = "nixpkgs-justinwoo-fix-gitlab-fetch";

  url = "https://github.com/justinwoo/nixpkgs/archive/6e5ed122e4785ae1ead7a0df1184bc790ba0e0bc.tar.gz";

  sha256 = "01xhh5d0msn112zk3yvq6pr59asxxv4yqkyccxrpdb22wlcl9mhi";
})

# { pkgs ? import <nixpkgs> {} }:

# import (pkgs.fetchFromGitHub {

#   owner = "justinwoo";

#   repo = "nixpkgs";

#   # pinned to fix-gitlab-fetch...

#   rev = "69d0465e50531b1c1ea81911f619acec1252c4d3";

#   sha256 = "0ih046w3q8h1safl68lrgh97xyvscqip77lyrfamx34ps1azaani";

# }) {}
