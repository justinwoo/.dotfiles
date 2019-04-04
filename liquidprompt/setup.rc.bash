export LP_MARK_DEFAULT="$"
export LP_MARK_GIT="$"
export LP_MARK_BATTERY="電"
export LP_MARK_ADAPTER="充"
export LP_MARK_UNTRACKED="異物"
export LP_MARK_STASH="在庫"
export LP_MARK_SHORTEN_PATH="･･"
export LP_MARK_PERM=" "
export LP_MARK_BRACKET_OPEN="​"  # open bracket
export LP_MARK_BRACKET_CLOSE="​" # close bracket
export LP_MARK_PREFIX=" "        # prompt mark prefix
export LP_PS1_PREFIX=""
export LP_PS1_POSTFIX=""

# Only load Liquid Prompt in interactive shells, not from a script or from scp
if [ -n "$PS1" ]
then
  # shellcheck source=/dev/null
  source "$HOME/.nix-profile/liquidprompt/liquidprompt";

  if [ -z "$IN_NIX_SHELL"  ]
  then
    export LP_USER=bash
  else
    export LP_USER="${LP_COLOR_TIME}nix"
  fi
fi
