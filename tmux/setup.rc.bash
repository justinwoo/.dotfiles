#!/usr/bin/env bash

alias tks="tmux kill-session"
alias tkS="tmux kill-server"

tm() {
    if [ $# == 1 ]
    then
        tmux attach -t "$1"
    elif [ $# == 0 ]
    then
        tmux ls
    else
        echo "tm only takes one argument, for tmux session to attach to";
    fi
}

_tm() {
    local cur opts
    COMPREPLY=()
    if [ "$COMP_CWORD" == 1 ]
    then
        cur="${COMP_WORDS[COMP_CWORD]}"
        opts=$(tmux ls -F '#S')

        # shellcheck disable=2207
        COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
    fi
}

tk() {
    if [ $# == 1 ]
    then
        tmux kill-session -t "$1"
    elif [ $# == 0 ]
    then
        tmux ls
    else
        echo "tk only takes one argument, for tmux session to kill";
    fi
}

if [[ -f $(command -v complete) ]]
then
    complete -F _tm tm
    complete -F _tm tk
fi