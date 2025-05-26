{ pkgs ? import ./pinned.nix { } }:
let
  z = import ./z.nix { inherit pkgs; };

  packages = (
    with (pkgs.gitAndTools);
    [
      git
      git-extras
      hub
    ]
  ) ++ (with pkgs; [
    autorandr
    bash-completion
    bat
    black
    colordiff
    direnv
    exiftool
    fd
    fzf
    gh
    jq
    neovim
    nix-bash-completions
    nixpkgs-fmt
    nodejs-18_x
    ripgrep
    shellcheck
    sqlite-interactive
    tig
    tmux
    watchexec
  ] ++ [
    z
  ]);

in
pkgs.buildEnv {
  name = "my-packages";
  paths = packages;
}
