if [ -e "$HOME/.nix-profile/etc/profile.d/nix.sh" ];
    then "." "$HOME/.nix-profile/etc/profile.d/nix.sh";
fi

export NIXPKGS_ALLOW_UNFREE=1
export RESULT_ENV=$DOT/nix/result-env

export SHELL_NIX="$HOME/.dotfiles/nix/shell.nix"
export BAT_THEME='Monokai Extended Light'
export BASH_COMPLETION_USER_DIR="$DOT/nix/result-env/share/bash-completion/completions"

alias npf='nixpkgs-fmt'
alias nrepl="nix repl --expr 'import $DOT/nix/pinned.nix {}'"
