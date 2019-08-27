{ pkgs ? import <nixpkgs> {} }:

import (
  pkgs.fetchFromGitHub {
    owner = "justinwoo";
    repo = "my-nixpkgs-fmt";
    rev = "44fdb18c25bc1de31fb23f49bc51d03bb70718f6";
    sha256 = "17c5wazag1csr9i0kh5qglv1v007q05bq71dx8cbdsvm6vs71k0l";
  }
) {}
