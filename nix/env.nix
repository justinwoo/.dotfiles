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
    bash-completion
    bat
    colordiff
    coreutils
    direnv
    fd
    fzf
    gh
    gnutar
    gnused
    jq
    neovim
    nix-bash-completions
    nixpkgs-fmt
    nodejs_22
    ripgrep
    shellcheck
    shfmt
    sqlite-interactive
    tig
    tmux
    vivid
    watchexec
  ] ++ [
    z
  ]);

in
pkgs.buildEnv {
  name = "my-packages";
  paths = packages;
}
