# shit for slides tooling

let
  pkgs = import <nixpkgs> {};

  src = pkgs.fetchFromGitHub {
    owner = "justinwoo";

    repo = "easy-markdown-beamer-pandoc";

    rev = "3bb267d687dc08f616a8892919a87d558c82eea3";

    sha256 = "00na9h4y90nlml6kyr9i8968951nyc4b562bm68d4mh44f2km504";
  };

  set = import src;

in pkgs.stdenv.mkDerivation {
  name = "slides-tools";

  phases = [ "installPhase" ];

  installPhase = "
    mkdir -p $out
    command -v ${set.texlive}/bin/tex
    command -v ${pkgs.pandoc}/bin/pandoc
  ";
}
