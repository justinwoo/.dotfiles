alias reload!='. ~/.bashrc'
alias vi='nvim'
alias nv="nvim"
alias pb='pbcopy'
alias po='pbpaste'
alias l='ls -lht --color'
alias rec='recent'
alias recent='ls -lht --color | head -10'
alias first='ls -t | head -1'
alias ll='lstoless'
alias f='fd --type f | fzf'
alias darkest='xbacklight -set 1'
alias emk='pkill emacs'
alias ns='nix-shell'
alias ns2='nix-shell $SHELL_NIX'

if [[ -f $(command -v xclip) ]]
then
  alias pbcopy='xclip -selection clipboard'
  alias pbout='xclip -selection clipboard -o'
  alias pbpaste='xclip -selection clipboard -o'
fi

if [[ -f /bin/open ]]
then
  alias open='xdg-open'
fi
