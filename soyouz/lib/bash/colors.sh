#detect if not sourced
if ! [[ $_ != $0 ]]; then
    echo "This is supposed to be sourced !"
    exit 1
fi

export NoColor="\033[0m"
export Cyan="\033[0;36m"
export Green="\033[0;32m"
export Red="\033[0;31m"
export BRed="\033[0;41m"
export Yellow="\033[0;33m"
export Magenta="\033[0;46m"
export Gras="\033[0;01m"
