# BLACK=$(tput setaf 0)
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
# LIME_YELLOW=$(tput setaf 190)
YELLOW=$(tput setaf 3)
# POWDER_BLUE=$(tput setaf 153)
BLUE=$(tput setaf 4)
# MAGENTA=$(tput setaf 5)
# CYAN=$(tput setaf 6)
# WHITE=$(tput setaf 7)
# BRIGHT=$(tput bold)
NORMAL=$(tput sgr0)
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
    local git_color=$GREEN
    if git rev-parse --git-dir > /dev/null 2>&1; then
        git_info=$(git rev-parse --abbrev-ref HEAD)

        # dirty
        if [ "$(git config --bool bash.showDirtyState)" != "false" ]; then
            if [ -n "$(git diff --no-ext-diff --quiet)" ]; then
                git_info+="*"
                git_color=$YELLOW
            fi
            if [ -n "$(git diff --no-ext-diff --cached --quiet)" ]; then
                git_info+="+"
                git_color=$YELLOW
            fi
        fi

        # untracked
        if [ "$(git config --bool bash.showUntrackedFiles)" != "false" ] &&
               git ls-files --others --exclude-standard --directory --no-empty-directory --error-unmatch -- ':/*' \
                   >/dev/null 2>/dev/null; then
            git_info+=" 異物"
            git_color=$RED
        fi

        # stash has trash
        if git rev-parse --verify --quiet refs/stash >/dev/null; then
            git_info+=" 在庫"
            git_color=$YELLOW
        fi

        __git_ps1_show_upstream
        # shellcheck disable=2154
        diff=$p
        if [[ $diff != *=* ]]; then
            git_info+="\[$RED\]$diff"
        fi

        git_info+=' '
    fi
    local prefix

    if [ -z "$IN_NIX_SHELL"  ]
    then
        prefix=bash
    else
        prefix="\[$BLUE\]nix"
    fi

    local dir="\[$BLUE\]\w"
    local git="\[$git_color\]$git_info"
    local usr="\[$NORMAL\]\$"
    PS1="$prefix $dir $git$usr "
}

export PROMPT_COMMAND=my_prompt
