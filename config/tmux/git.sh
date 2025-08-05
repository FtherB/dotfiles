#!/bin/bash

# colors
YELLOW="#[fg=#ffff00]"
GREEN="#[fg=#00ff00]"
RED="#[fg=#ff4444]"
WHITE="#[fg=#ffffff]"
GREY="#[fg=#888888]"
RESET="#[default]"

# Check git repository
if ! git rev-parse --is-inside-work-tree &>/dev/null; then
    echo "${WHITE}not a git repo"
    exit 0
fi

plus=0
tilde=0
minus=0

# get name
branch=$(git symbolic-ref --short HEAD 2>/dev/null || git describe --tags --exact-match 2>/dev/null || echo "detached")
repo_root=$(git rev-parse --show-toplevel)
repo_name=$(basename "$repo_root")

# git status
while read -r status file; do
    case "$status" in
        A*|*A|??)  ((plus++)) ;;       # Added / Untracked
        M*|*M)     ((tilde++)) ;;      # Modified
        D*|*D)     ((minus++)) ;;      # Deleted
    esac
done < <(git status --porcelain)

staged=0
while read -r status file; do
    index_status="${status:0:1}"
    [[ "$index_status" =~ [AMD] ]] && ((staged++))
done < <(git status --porcelain)

diff_output=$( (git diff --shortstat; git diff --cached --shortstat) 2>/dev/null )
insertions=0
deletions=0
while read -r line; do
    [[ $line =~ ([0-9]+)\ insertions? ]] && ((insertions += ${BASH_REMATCH[1]}))
    [[ $line =~ ([0-9]+)\ deletions? ]] && ((deletions += ${BASH_REMATCH[1]}))
done <<< "$diff_output"

# Git push/pull diff
arrow=""
if git rev-parse --abbrev-ref --symbolic-full-name @{u} &>/dev/null; then
    # upstream
    ahead_behind=$(git rev-list --left-right --count HEAD...@{u} 2>/dev/null)
    ahead=${ahead_behind%%	*}
    behind=${ahead_behind##*	}

    # push
    if [[ $ahead -gt 0 ]]; then
        arrow+="${WHITE}↑"
    else
        arrow+="${GREY}↑"
    fi

    # pull
    if [[ $behind -gt 0 ]]; then
        arrow+="${WHITE}↓"
    else
        arrow+="${GREY}↓"
    fi
    arrow+=""
else
    arrow+="${GREY}xx"
fi


# format
[[ $tilde -eq 0 ]] && CHANGED_OUT="${GREY}~0" || CHANGED_OUT="${YELLOW}~${tilde}"
[[ $plus -eq 0 ]] && ADDED_OUT="${GREY}+0" || ADDED_OUT="${GREEN}+${plus}"
[[ $minus -eq 0 ]] && REMOVED_OUT="${GREY}-0" || REMOVED_OUT="${RED}-${minus}"
[[ $staged -eq 0 ]] && STAGED_OUT="${GREY}*0" || STAGED_OUT="${WHITE}*${staged}"
[[ $insertions -eq 0 ]] && INSERT_OUT="${GREY}⊕0" || INSERT_OUT="${GREEN}⊕${insertions}"
[[ $deletions -eq 0 ]] && DELETE_OUT="${GREY}⊖0" || DELETE_OUT="${RED}⊖${deletions}"

# status
output="${WHITE}[${repo_name}] ${branch}: "
output+="${CHANGED_OUT} ${ADDED_OUT} ${REMOVED_OUT} ${STAGED_OUT} ${INSERT_OUT} ${DELETE_OUT}"
[[ -n "$arrow" ]] && output+=" $arrow"

# [[ $staged -gt 0 ]] && output+=" ${WHITE}*${staged}"
# [[ $insertions -gt 0 ]] && output+=" ${GREEN}⊕${insertions}"
# [[ $deletions -gt 0 ]] && output+=" ${RED}⊖${deletions}"

echo -n "$output"
