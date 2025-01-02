set -x

# https://discourse.nixos.org/t/macos-15-sequoia-update-clobbers-nixbld1-4-users/52223

curl --proto '=https' --tlsv1.2 -sSf -L https://github.com/NixOS/nix/raw/master/scripts/sequoia-nixbld-user-migration.sh | bash -
