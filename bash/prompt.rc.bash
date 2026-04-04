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

    if git rev-parse --is-inside-work-tree &> /dev/null; then
        local git_path_blacklist=("nixpkgs")
        local git_blacklisted=false
        for pattern in "${git_path_blacklist[@]}"; do
            if [[ $PWD == *"$pattern"* ]]; then
                git_blacklisted=true
                break
            fi
        done

        if [[ $git_blacklisted == true ]]; then
            git_info=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
            if [[ -z $git_info ]]; then
                git_info="新"
                git_color=$RED
            fi
        else
            local git_status
            git_status=$(git status --porcelain=v2 --branch 2>/dev/null)

            git_info=$(echo "$git_status" | grep '^# branch.head' | awk '{print $3}')
            if [[ -z $git_info ]]; then
                git_info="新"
                git_color=$RED
            fi

            # Check for changes from git status output (much faster than git diff --quiet)
            # Format: "1 XY ..." where X=staged status, Y=unstaged status
            if echo "$git_status" | grep -q '^1 .[^.]'; then
                # Unstaged changes detected (Y != '.')
                git_info+="*"
                git_color=$RED
            elif echo "$git_status" | grep -q '^1'; then
                # Only staged changes
                git_info+="+"
                git_color=$YELLOW
            fi

            if echo "$git_status" | grep -q '^?'; then
                git_info+=" 汚"
                git_color=$RED
            fi

            if git rev-parse --verify --quiet refs/stash >/dev/null; then
                git_info+=" 庫"
                git_color=$YELLOW
            fi

            # shellcheck disable=2154
            local diff=""
            local ps1_result=$(__git_ps1)
            if [[ $ps1_result == *"|"* ]]; then
                diff=" $(echo "$ps1_result" | cut -d '(' -f 2 | cut -d '|' -f 2 | cut -d ')' -f 1)"
            fi
            if [[ $diff != *=* ]]; then
                git_info+="$MAGENTA$diff"
            fi
        fi

        git_info+=' '
    fi

    local jobs_info
    local jobs_count
    jobs_count=$(($(jobs -r | wc -l) + $(jobs -s | wc -l)))
    if [[ $jobs_count -ne 0 ]]; then
        jobs_info="$jobs_count "
    fi

    local exit
    if [[ $EXIT -ne 0 ]]; then
        exit="$RED($EXIT) "
    fi

    local dir="$BLUE\w"
    local git="$git_color$git_info"
    local usr="$NORMAL\$"
    local jobs_="$MAGENTA$jobs_info"

    PS1="$LOCAL_PS1_PREFIX$jobs_$dir $git$exit$usr "
}

# Only add my_prompt if not already present
if [[ $PROMPT_COMMAND != *my_prompt* ]]; then
    export PROMPT_COMMAND="my_prompt;$PROMPT_COMMAND"
fi
