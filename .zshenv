function exists() {
    command -v $1 >/dev/null 2>&1
}

function mkcd() {
    mkdir -p "$@" && cd "$_";
}
