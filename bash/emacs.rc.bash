# EMACS="nix-shell $DOT/nix/emacs.nix --run"
# EMACS="bash -c"

# start emacs with given argument (usually a directory) or nothing
enc() {
  emacs "${1:-$PWD}" & disown 2> /dev/null
}

encp() {
  emacs "$PWD" & disown 2> /dev/null
}

# start daemon
emd() {
  emacs --daemon "${1:-$PWD}"
}

# start a terminal client with arg
em() {
  emacsclient -t "${1:-$PWD}"
}

# start a gui client with arg
ge() {
  emacsclient -nc "${1:-$PWD}"
}
