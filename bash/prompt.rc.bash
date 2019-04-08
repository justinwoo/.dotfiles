# BLACK=$(tput setaf 0)
# RED=$(tput setaf 1)
# GREEN=$(tput setaf 2)
# LIME_YELLOW=$(tput setaf 190)
# YELLOW=$(tput setaf 3)
# POWDER_BLUE=$(tput setaf 153)
# BLUE=$(tput setaf 4)
# MAGENTA=$(tput setaf 5)
# CYAN=$(tput setaf 6)
# WHITE=$(tput setaf 7)
# BRIGHT=$(tput bold)
# NORMAL=$(tput sgr0)
# BLINK=$(tput blink)
# REVERSE=$(tput smso)
# UNDERLINE=$(tput smul)

# PS1="\[${WHITE}\](\[${YELLOW}\]\u@\h\[${WHITE}\])\[${NORMAL}\]$ "

export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWSTASHSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWUPSTREAM="verbose"
export GIT_PS1_HIDE_IF_PWD_IGNORED=true
export GIT_PS1_SHOWCOLORHINTS=true

function my_prompt {
    local git_info=''
    if git rev-parse --git-dir > /dev/null 2>&1; then
        git_info=$(git rev-parse --abbrev-ref HEAD)

        # dirty
        if [ "$(git config --bool bash.showDirtyState)" != "false" ]; then
            git diff --no-ext-diff --quiet || git_info+="*"
            git diff --no-ext-diff --cached --quiet || git_info+="+"
        fi

        # untracked
        if [ "$(git config --bool bash.showUntrackedFiles)" != "false" ] &&
               git ls-files --others --exclude-standard --directory --no-empty-directory --error-unmatch -- ':/*' \
                   >/dev/null 2>/dev/null; then
            git_info+=" 異物"
        fi

        # stash has trash
        if git rev-parse --verify --quiet refs/stash >/dev/null; then
            git_info+=" 在庫"
        fi

        __git_ps1_show_upstream
        # shellcheck disable=2154
        diff=$p
        if [[ $diff != *=* ]]; then
            git_info+="$diff"
        fi

        git_info+=' '
    fi
    local prefix

    if [ -z "$IN_NIX_SHELL"  ]
    then
        prefix=bash
    else
        prefix=nix
    fi

    PS1="$prefix \w $git_info$ "
}

export PROMPT_COMMAND=my_prompt
