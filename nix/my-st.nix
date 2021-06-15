{ pkgs ? import <nixpkgs> {} }:

import
  (
    pkgs.fetchFromGitHub {
      owner = "justinwoo";
      repo = "my-st";
      rev = "1dc0beaba7077c9bfb03fc0df2d58614be5c7f4e";
      sha256 = "1siwg26vndkv28plhg8k20hs1zqyi7w8mbzdykq3j72y6jfv1vb6";
    }
  )
  { inherit pkgs; }
