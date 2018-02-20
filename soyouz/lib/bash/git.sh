#detect if not sourced
if ! [[ $_ != $0 ]]; then
    echo "This is supposed to be sourced !"
    exit 1
fi

function git-status () {
    $(git status 2> /dev/null)
    exit $?
}

function git-is-repo {
    git-status
    if [ $? -ne 0 ]; then
      exit 1
    fi
    exit 0
}
