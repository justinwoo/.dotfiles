{ pkgs ? import <nixpkgs> { } }:

import
  (
    pkgs.fetchFromGitHub {
      owner = "justinwoo";
      repo = "my-st";
      rev = "67557e8dacebc5b154b732f9497768a560525300";
      sha256 = "1ysjj35ngxna07wa93nbfv1aa28qkzgasj23p0q5jn5pypk8vb63";
    }
  )
{ inherit pkgs; }
