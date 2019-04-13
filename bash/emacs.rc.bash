# EMACS="nix-shell $DOT/nix/emacs.nix --run"
EMACS="bash -c"

# start emacs with given argument (usually a directory) or nothing
enc() {
  $EMACS "emacs $1 & disown" 2> /dev/null
}

# start daemon
emd() {
  $EMACS "emacs --daemon"
}

# start a terminal client with arg
em() {
  $EMACS "emacsclient -t $1"
}

# start a gui client with arg
ge() {
  $EMACS "emacsclient -nc $1"
}
