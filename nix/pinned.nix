import (
  builtins.fetchTarball rec {
    url = "https://github.com/NixOS/nixpkgs/archive/refs/tags/25.05-pre.tar.gz";
    sha256 = "0b96wqvk3hs98dhfrmdhqmx9ibac4kjpanpd1pig19jaglanqnxr";
  }
)
