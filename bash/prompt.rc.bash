if [[ $- = *i* ]]
then
    # BLACK=$(tput setaf 0)
    # BLINK="\[$(tput blink)\]"
    # BRIGHT="\[$(tput bold)\]"
    # REVERSE="\[$(tput smso)\]"
    # UNDERLINE="\[$(tput smul)\]"
    # WHITE="\[$(tput setaf 7)\]"
    BLUE="\[$(tput setaf 4)\]"
    GREEN="\[$(tput setaf 2)\]"
    MAGENTA="\[$(tput setaf 5)\]"
    NORMAL="\[$(tput sgr0)\]"
    RED="\[$(tput setaf 1)\]"
    YELLOW="\[$(tput setaf 3)\]"
fi

export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWSTASHSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWUPSTREAM="verbose"
export GIT_PS1_HIDE_IF_PWD_IGNORED=true
export GIT_PS1_SHOWCOLORHINTS=true

function my_prompt {
    local LOCAL_PS1_PREFIX="${LOCAL_PS1_PREFIX:-}"
    local EXIT=$?
    local git_info=''
    local git_color=$GREEN
    if git rev-parse --git-dir &> /dev/null; then
        git_info=$(git rev-parse --abbrev-ref HEAD 2> /dev/null)

        # shellcheck disable=2181
        if ! git rev-parse --abbrev-ref HEAD &> /dev/null; then
            git_info="新"
            git_color=$RED
        fi

        # dirty
        if ! git diff --no-ext-diff --cached --quiet; then
            git_info+="+"
            git_color=$YELLOW
        fi
        if ! git diff --no-ext-diff --quiet; then
            git_info+="*"
            git_color=$RED
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

        # shellcheck disable=2154
        if [[ -z $MACOS ]]
        then
            __git_ps1_show_upstream
            diff=$p
        else
            GIT_PS1=$(__git_ps1)
            if [[ $GIT_PS1 == *"|"* ]]; then
                diff=" $(__git_ps1  | cut -d '(' -f 2 | cut -d '|' -f 2 | cut -d ')' -f 1)"
            else
                diff=""
            fi
        fi
        if [[ $diff != *=* ]]; then
            git_info+="$MAGENTA$diff"
        fi

        git_info+=' '
    fi
    local prefix

    if [ -z "$IN_NIX_SHELL"  ]
    then
        prefix="$NORMAL"馬
    else
        prefix="$BLUE"肉
    fi

    local jobs_info
    local jobs_count
    jobs_count=$(($(jobs -r | wc -l)+$(jobs -s | wc -l)))
    if [[ $jobs_count -ne 0 ]];
    then
        jobs_info="$jobs_count "
    fi

    local exit
    if [[ $EXIT -ne 0 ]]
    then
        exit="$RED($EXIT) "
    fi

    local dir="$BLUE\w"
    local git="$git_color$git_info"
    local usr="$NORMAL\$"
    local jobs_="$MAGENTA$jobs_info"
    PS1="$LOCAL_PS1_PREFIX$jobs_$prefix $dir $git$exit$usr "
}

export PROMPT_COMMAND="my_prompt;$PROMPT_COMMAND"
