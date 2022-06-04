{ pkgs ? import <nixpkgs> { } }:

import
  (
    pkgs.fetchFromGitHub {
      owner = "justinwoo";
      repo = "update-fetch";
      rev = "1d5444d4d44195877ec19a18ba777bae5a366390";
      sha256 = "152bwggnrq5qdzvhf9ra6xs9q3v6i5nwbr2xjbmbidpp8gan5d05";
    }
  )
{
  inherit pkgs;
}
