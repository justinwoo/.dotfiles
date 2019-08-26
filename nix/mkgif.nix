{ pkgs ? import <nixpkgs> {} }:

import (pkgs.fetchFromGitHub {
  owner = "justinwoo";
  repo = "mkgif";
  rev = "a262bda325839bfc7a2d9ff81923b38a53ab15b4";
  sha256 = "0z86kwcsba470yvm8cykz16dkx73l2ih5ilnl0jxh4cv2mmzwn8s";
}) {
  inherit pkgs;
}
