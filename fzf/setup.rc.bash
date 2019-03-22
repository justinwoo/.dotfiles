# shellcheck source=/dev/null
# Only load in interactive shells, not from a script or from scp
if [ -n "$PS1" ]
then
  source "$NIX_PROFILE"/share/fzf/key-bindings.bash
  source "$NIX_PROFILE"/share/fzf/completion.bash
fi

export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"
