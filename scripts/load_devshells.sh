load_devshells() {
    local path=$(realpath -m "$PWD")
    local projects_dir="/home/jonas/Projects"
    #echo "$IN_DEVSHELL"

    if [[ -f "$DEVSHELL_TMP_FILE" ]] && [[ "$IN_DEVSHELL" != 1 ]]; then
        echo "no"
    elif [[ "$path" == "$projects_dir/"* ]] && [[ "$IN_DEVSHELL" != 1 ]]; then
        local relative="${path#$projects_dir/}"
        local project="${relative%%/*}"
        #local env="$(
        #    nix develop "/home/jonas/NixOS#$project" --command bash -c 'export -p' 2>/dev/null | grep '^declare #-x '
        #)"
        #env_exports="$(echo "$env" | cut -c 12-)" # remove "declare -x " part
        #eval "$env_exports"

        export DEVSHELL_TMP_FILE=$(mktemp "${TMPDIR:-/tmp}/load_devshells.XXXXXX")
        export IN_DEVSHELL=1
        nix develop "/home/jonas/NixOS#$project"
        export IN_DEVSHELL=0
        cd $(cat "$DEVSHELL_TMP_FILE")
        rm "$DEVSHELL_TMP_FILE"
        export DEVSHELL_TMP_FILE=""
    elif [[ "$path" != "$projects_dir/"* ]] && [[ "$IN_DEVSHELL" == 1 ]]; then
        touch "$DEVSHELL_TMP_FILE"
        echo $path > "$DEVSHELL_TMP_FILE"
        exit
    fi
}

PROMPT_COMMAND="load_devshells; $PROMPT_COMMAND"
