{ pkgs ? import ./pinned.nix { } }:
let
  z = import ./z.nix { inherit pkgs; };

  packages = (with pkgs;
    [
      git
      git-extras
      hub
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
      nodejs_24
      ripgrep
      shellcheck
      shfmt
      sqlite-interactive
      tig
      tmux
      uv
      ty
      vivid
      watchexec
      d2
      mermaid-cli
      lazydocker
      difftastic
      delta
      pi-coding-agent
      aws-iam-authenticator
      awscli2
    ] ++ [
      z
    ]);

in
pkgs.buildEnv {
  name = "my-packages";
  paths = packages;
}
