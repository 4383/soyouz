#detect if not sourced
if ! [[ $_ != $0 ]]; then
    echo "This is supposed to be sourced !"
    exit 1
fi

RootPrompt="\#"
function prompt-git () {
  $(git-status)
  if [ $? -eq 0 ]; then
    echo $(git-status) | grep "\(not staged\|modifié\)" > /dev/null 2>&1
        if [ $? -eq 0 ]; then
          echo "ici"
            LEFTPROMPT=$LEFTPROMPT"\[$Red\]"
        else
          echo "ma"
            LEFTPROMPT=$LEFTPROMPT"\[$Green\]"
        fi
        BRANCH=`git rev-parse --abbrev-ref HEAD`
        export LEFTPROMPT=$LEFTPROMPT" ["$BRANCH"]"
  else
    echo "plop"
  fi
}

function prompt-path() {
    echo "\[$Yellow\]\w"
}

function prompt-eol() {
    echo "\n"
}

function prompt-user() {
    echo "\[$Yellow\]$(whoami)\[$NoColor\]"
}

# Contextual prompt
prompt() {
    #NonRootPrompt="\[$Red\]\$"
    #if [ -f ~/.ssh/anonimized ]; then
    #    NonRootPrompt="\[$Green\]\$"
    #fi
    #    USERNAME=`whoami`
    #    HOSTNAME=`hostname -s`
    #    
    #    # Change the Window title
    #    WINDOWTITLE="$USERNAME@$HOSTNAME"
    #    echo -ne "\033]0;$WINDOWTITLE\007"
    #    
    #    # Change the dynamic prompt
    #    LEFTPROMPT="\[$Cyan\]$USERNAME@$HOSTNAME"
    #
    #    # If python virtualenv activate display it
    #    if [ ! -z $VIRTUAL_ENV ] ; then
    #        LEFTPROMPT="\[$Red\]("`basename $VIRTUAL_ENV`") "$LEFTPROMPT
    #    fi
    #    
    #    $(prompt-git)
    #    LEFTPROMPT="\[$Yellow\]\w\n"$LEFTPROMPT
    #
    #    if [ $EUID -ne 0 ]; then
    #        PS1=$LEFTPROMPT$NonRootPrompt"\[$NoColor\] "
    #    else
    #        PS1=$LEFTPROMPT"\[$BRed\]"$RootPrompt"\[$NoColor\] "
    #    fi
    PS1="$(prompt-path)$(prompt-eol)"
    #PS1="${PS1}$(prompt-venv)$(prompt-user)@soyouz $(prompt-git)"
    PS1="${PS1}$(prompt-user)@soyouz$ "
}

# Define PROMPT_COMMAND if not already defined (fix: Modifying title on SSH connections)
if [ -z "$PROMPT_COMMAND" ]; then
    case $TERM in
        xterm*)
            PROMPT_COMMAND='printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/~}"'
        ;;
        screen)
            PROMPT_COMMAND='printf "\033]0;%s@%s:%s\033\\" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/~}"'
        ;;
    esac
fi
                                     
# Main prompt
PROMPT_COMMAND="prompt;$PROMPT_COMMAND"

if [ $EUID -ne 0 ]; then
    PS1=$NonRootPrompt" "
else
    PS1=$RootPrompt" "
fi
