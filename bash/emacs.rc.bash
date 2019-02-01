# start emacs with given argument (usually a directory) or nothing
enc() {
  nix-shell -p emacs --run "emacs $1 & disown" 2> /dev/null
}

# TODO
# alias emd='emacs --daemon'
# alias em='emacsclient -t'
# alias ge='emacsclient -nc'
# alias en='nix-shell -p emacs --run "emacsclient -t"'
# alias gn='nix-shell -p emacs --run "emacsclient -nc"'
