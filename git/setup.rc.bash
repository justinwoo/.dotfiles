git_master() {
    if git show-ref --verify --quiet refs/remotes/origin/master; then
        echo "master"
    else
        echo "main"
    fi
}

# my own git aliases
alias gpp='git pull --prune'

alias get-git-branch-name='git rev-parse --abbrev-ref HEAD'
alias ggbn='get-git-branch-name'

alias gb='git branch --sort=-authordate'
alias gib='git-branches-details'

alias gs='git status -sb'
alias gis='git status -sb'

alias gid='git diff'
alias gids='git diff --staged'

alias getlastcommit='git show --oneline | awk NR==1'
alias glc='getlastcommit'

alias push-current-branch-to-justinwoo='git push -u justinwoo $(git rev-parse --abbrev-ref HEAD)'
alias push-current-branch-to-origin='git push -u origin $(git rev-parse --abbrev-ref HEAD)'
alias gpj='push-current-branch-to-justinwoo'
alias gpo='push-current-branch-to-origin'
alias gfo='git fetch origin'
alias gfp='gfo -p && dmb'
alias gfu='git fetch upstream'
alias gfj='git fetch justinwoo'

alias delete-merged-branches='git delete-merged-branches'
alias dmb='delete-merged-branches'

# Delete local branches whose commits are already in main (handles squash/rebase merges)
function deep-dmb {
    local main_branch current_branch branches msg commit
    local -a to_delete to_keep

    if ! git rev-parse --show-toplevel > /dev/null 2>&1; then
        echo "Not a git repo!" >&2
        return 1
    fi

    main_branch=$(git_master)
    current_branch=$(git rev-parse --abbrev-ref HEAD)

    git fetch --prune origin 2>/dev/null || true

    branches=$(git branch --format='%(refname:short)' | grep -v "^${main_branch}$" | grep -v "^${current_branch}$" || true)

    if [ -z "$branches" ]; then
        echo "No branches to check."
        return 0
    fi

    to_delete=()
    to_keep=()

    for branch in $branches; do
        msg=$(git log -1 --format="%s" "$branch" 2>/dev/null)
        commit=$(git rev-parse "$branch" 2>/dev/null)

        # Direct ancestor of main
        if git merge-base --is-ancestor "$commit" "$main_branch" 2>/dev/null; then
            to_delete+=("$branch")
            continue
        fi

        # Commit message exists in main (squash/rebase merge)
        if git log "$main_branch" --oneline --grep="$msg" --fixed-strings 2>/dev/null | grep -q .; then
            to_delete+=("$branch")
            continue
        fi

        to_keep+=("$branch")
    done

    if [ ${#to_delete[@]} -eq 0 ]; then
        echo "No merged branches to delete."
        [ ${#to_keep[@]} -gt 0 ] && echo "Keeping: ${to_keep[*]}"
        return 0
    fi

    echo "Branches with commits in $main_branch (will delete):"
    printf "  %s\n" "${to_delete[@]}"
    echo ""

    if [ ${#to_keep[@]} -gt 0 ]; then
        echo "Branches NOT in $main_branch (keeping):"
        printf "  %s\n" "${to_keep[@]}"
        echo ""
    fi

    read -p "Delete ${#to_delete[@]} branch(es)? [y/N] " -n 1 -r
    echo ""

    if [[ $REPLY =~ ^[Yy]$ ]]; then
        for branch in "${to_delete[@]}"; do
            git branch -D "$branch"
        done
        echo "Done."
    else
        echo "Aborted."
    fi
}

alias gc='git commit -v'
alias gcm='git commit -v -m'
alias gca='git commit -v --amend'
alias gcane='git commit --amend --no-edit'
alias .gcane='git add . && gcane'
alias gcanera='git commit --amend --no-edit --reset-author'

alias ga='git add'
alias ga.='git add .'
alias gap='git add -p'

alias grl='git reflog | head -10'

alias git-commits-since-origin-master='git log "origin/$(git_master)..$(ggbn)" --pretty="format:* %s"'

# hub/gh
alias hb='gh repo view --web'
alias hrrou='git remote rename origin upstream'
alias hrrjo='git remote rename justinwoo origin'
alias prv="gh pr view --web"
alias prc="gh pr create --fill --web"
alias pr="prc"
# github cli uses some shit that doesn't use actual defined colors for some reason
export GLAMOUR_STYLE=light
# i wnat to get rid of gh cli
export GH_TELEMETRY=false
export DO_NOT_TRACK=true

# pretty colors
alias gl='git log --graph --pretty=format:'\''%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'\'' --abbrev-commit'
alias gil='git log --decorate=full --stat --graph'
alias gild='git log --decorate'

# git log lines since origin/master
alias gll='git log --pretty=format:%s origin/$(git_master)..'

alias master='gfo -p; git co $(git_master); gupdate;'
alias gupdate='git fetch origin $(git_master) && git rebase origin/$(git_master)'

alias gupstream='git fetch upstream $(git_master) && git rebase FETCH_HEAD'

alias gbupdate='git fetch origin $(ggbn) && git rebase FETCH_HEAD'
alias gbupstream='git fetch upstream $(ggbn) && git rebase FETCH_HEAD'
alias greset='git fetch origin $(ggbn) && git reset --hard FETCH_HEAD'
alias gureset='git fetch upstream $(ggbn) && git reset --hard FETCH_HEAD'
alias gjreset='git fetch justinwoo $(ggbn) && git reset --hard FETCH_HEAD'
# update children
alias gpullallchildren='ls -d */ | xargs -P10 -I{} git -C {} pull'
alias gpac='gpullallchildren'

alias g='git'
if type __git_complete &>/dev/null; then
  __git_complete g __git_main
fi

complete -F _git_pull gpp
complete -F _git_reflog grl
complete -F _git_log gil
complete -F _git_reset greset
complete -F _git_reset gureset
complete -F _git_reset gjreset
complete -F _git_reset gundo
complete -F _git_submodule gsu
