load_devshells() {
    local path=$(realpath -m "$PWD")
    local projects_dir="/home/jonas/Projects"
    local relative="${path#$projects_dir/}"
    local project="${relative%%/*}"

    #if [[ -f "$DEVSHELL_TMP_FILE" ]] && [[ "$IN_DEVSHELL" != 1 ]]; then
    #    :
    if [[ "$path" == "$projects_dir/"* ]] && [[ "$IN_DEVSHELL" != 1 ]]; then
        export DEVSHELL_TMP_FILE=$(mktemp "${TMPDIR:-/tmp}/load_devshells.XXXXXX")
        export DEVSHELL_PROJECT="$project"
        export IN_DEVSHELL=1

        nix develop "flake:system#$project"

        local new_path="$(cat "$DEVSHELL_TMP_FILE")"
        export IN_DEVSHELL=0
        export DEVSHELL_PROJECT=""
        cd "$new_path"
        rm "$DEVSHELL_TMP_FILE"
        export DEVSHELL_TMP_FILE=""

        if [[ "$new_path" == "$projects_dir/"* ]]; then
            local new_relative="${new_path#$projects_dir/}"
            local new_project="${new_relative%%/*}"
            load_devshells
        fi
    elif [[ "$path" != "$projects_dir/"* ]] && [[ "$IN_DEVSHELL" == 1 ]]; then
        exit
    elif [[ "$path" == "$projects_dir/"* ]] && [[ "$IN_DEVSHELL" == 1 ]]; then
        if [[ "$DEVSHELL_PROJECT" != "$project" ]]; then
            exit
        fi
    fi
}

exit_trap() {
    if [[ "$IN_DEVSHELL" == 1 ]]; then
        touch "$DEVSHELL_TMP_FILE"
        echo "$path" > "$DEVSHELL_TMP_FILE"
    fi
}

# for some reason trap doesn't trigger when manually exiting
set_trap() {
    trap "eval \"$(trap -P EXIT)\"; exit_trap" EXIT
}

set_trap
PROMPT_COMMAND="load_devshells; $PROMPT_COMMAND"
