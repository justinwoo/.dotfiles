# shellcheck source=/dev/null
# Only load in interactive shells, not from a script or from scp
if [ -n "$PS1" ]
then
  source "$DOT/nix/result-env/share/fzf/key-bindings.bash"
  source "$DOT/nix/result-env/share/fzf/completion.bash"
fi

export FZF_CTRL_T_COMMAND="fd --type f"
export FZF_ALT_C_COMMAND="fd --type d"
