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
    direnv
    fd
    fzf
    gh
    gnutar
    jq
    neovim
    nix-bash-completions
    nixpkgs-fmt
    nodejs-18_x
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
