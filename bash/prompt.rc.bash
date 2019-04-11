# BLACK=$(tput setaf 0)
RED="\[$(tput setaf 1)\]"
GREEN="\[$(tput setaf 2)\]"
YELLOW="\[$(tput setaf 3)\]"
BLUE="\[$(tput setaf 4)\]"
MAGENTA="\[$(tput setaf 5)\]"
# WHITE="\[$(tput setaf 7)\]"
# BRIGHT="\[$(tput bold)\]"
NORMAL="\[$(tput sgr0)\]"
# BLINK="\[$(tput blink)\]"
# REVERSE="\[$(tput smso)\]"
# UNDERLINE="\[$(tput smul)\]"

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
        git_info=$(git rev-parse --abbrev-ref HEAD 2> /dev/null)

        # shellcheck disable=2181
        if [ $? -ne 0 ]
        then
            git_info="新"
            git_color=$RED
        fi

        # dirty
        if [ "$(git config --bool bash.showDirtyState)" != "false" ]; then
            if ! git diff --no-ext-diff --quiet; then
                git_info+="*"
                git_color=$RED
            fi
            if ! git diff --no-ext-diff --cached --quiet; then
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

        # https://github.com/nojhan/liquidprompt/blob/eda83efe4e0044f880370ed5e92aa7e3fdbef971/liquidprompt#L864-L876
        local gitdir
        gitdir="$(\git rev-parse --git-dir 2>/dev/null)"
        if [[ -f "${gitdir}/MERGE_HEAD" ]]; then
            git_info+=" MERGING"
            git_color=$RED
        elif [[ -d "${gitdir}/rebase-apply" || -d "${gitdir}/rebase-merge" ]]; then
            git_info+=" REBASING"
            git_color=$RED
        elif [[ -f "${gitdir}/CHERRY_PICK_HEAD" ]]; then
            git_info+=" CHERRY-PICKING"
            git_color=$RED
        fi

        __git_ps1_show_upstream
        # shellcheck disable=2154
        diff=$p
        if [[ $diff != *=* ]]; then
            git_info+="$MAGENTA$diff"
        fi

        git_info+=' '
    fi
    local prefix

    if [ -z "$IN_NIX_SHELL"  ]
    then
        prefix="$NORMAL馬"
    else
        prefix="$BLUE肉"
    fi

    local jobs_info
    local jobs_count
    jobs_count=$(($(jobs -r | wc -l)+$(jobs -s | wc -l)))
    if [[ $jobs_count -ne 0 ]];
    then
        jobs_info="$jobs_count "
    fi

    local dir="$BLUE\w"
    local git="$git_color$git_info"
    local usr="$NORMAL\$"
    local jobs_="$MAGENTA$jobs_info"
    PS1="$jobs_$prefix $dir $git$usr "
}

export PROMPT_COMMAND=my_prompt
