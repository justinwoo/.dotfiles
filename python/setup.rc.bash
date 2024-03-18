# uhhh
pip() {
    local pip_command="pip3"
    local my_flag="--break-system-packages"

    if [[ "$1" == "install"* ]]; then
        $pip_command "$@" $my_flag
    elif [[ "$1" == "uninstall"* ]]; then
        $pip_command "$@" $my_flag
    else
        $pip_command "$@"
    fi
}
