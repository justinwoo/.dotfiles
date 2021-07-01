if [[ -a $(command -v direnv) ]]; then
    eval "$(direnv hook bash)"
fi

alias da='direnv allow'
alias rda='rm -rf ./.direnv && direnv allow'
alias dn='direnv deny'
