# shellcheck source=/dev/null
source "$NIX_PROFILE"/share/fzf/key-bindings.bash
source "$NIX_PROFILE"/share/fzf/completion.bash

export FZF_DEFAULT_COMMAND='fd --type f'
