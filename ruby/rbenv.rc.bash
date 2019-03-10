export PATH="$HOME/.rbenv/bin:$PATH"

if [[ -a $(command -v rbenv) ]]
then
  eval "$(rbenv init -)"
fi

alias bui='bundle install'
alias bue='bundle exec'
