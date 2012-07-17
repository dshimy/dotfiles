# ----------------------------------------------------------------------
# Premininaries
# ----------------------------------------------------------------------

PLATFORM=`uname`

# ----------------------------------------------------------------------
# General Bash settings
# ----------------------------------------------------------------------

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoreboth
export HISTIGNORE="ls:bg:fg:date:clear:c:history:h"

# check the window size after each command and, if necessary, update
shopt -s checkwinsize

# Notify when jobs finish
set -o notify

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# Some aliases
alias "h=history"
alias "md=mkdir"
alias "c=clear"
alias "mroe=less"
alias "pwd=/bin/pwd"
alias "cd..=cd .."
alias "cd...=cd ../.."
alias "sb=source ~/.bashrc"
alias "v=mvim"
alias "s=subl"


# ----------------------------------------------------------------------
# Path
# ----------------------------------------------------------------------

PATH="~/bin:$PATH"
PATH="$PATH:/usr/local/sbin:/usr/sbin:/sbin"
PATH="/usr/local/bin:/opt/local/bin:$PATH"


# ----------------------------------------------------------------------
# Pager, Editor, and More
# ----------------------------------------------------------------------

if [ "$PLATFORM" == 'Darwin' ]; then
  EDITOR="~/bin/subl -w"
else
  # See what we have to work with ...
  HAVE_VIM=$(command -v vim)
  HAVE_GVIM=$(command -v gvim)

  # EDITOR
  test -n "$HAVE_VIM" &&
  EDITOR=vim ||
  EDITOR=vi
fi
export EDITOR

# PAGER
if test -n "$(command -v less)" ; then
    PAGER="less -FirSwX"
    MANPAGER="less -FiRswX"

    if [ -f "/usr/local/bin/src-hilite-lesspipe.sh" ]; then
      export LESSOPEN="| /usr/local/bin/src-hilite-lesspipe.sh %s"
      export LESS=' -R '
    fi

else
    PAGER=more
    MANPAGER="$PAGER"
fi
export PAGER MANPAGER

# Ack
ACK_PAGER="$PAGER"
ACK_PAGER_COLOR="$PAGER"


# ----------------------------------------------------------------------
# Prompt and colors
# ----------------------------------------------------------------------

export CLICOLOR=1
export LSCOLORS=DxFxCxCxBxexexBxBxDxDx

function parse_git_branch {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "("${ref#refs/heads/}") "
}

RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
WHITE="\[\033[0;11m\]"
PS1="$RED\h \A [\w] $YELLOW\$(parse_git_branch)$RED\$ $WHITE"


# ----------------------------------------------------------------------
# RVM for Ruby
# ----------------------------------------------------------------------

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function
PATH=$PATH:$HOME/.rvm/bin

function gemdir {
  if [[ -z "$1" ]] ; then
    echo "gemdir expects a parameter, which should be a valid RVM Ruby selector"
  else
    rvm "$1"
    cd $(rvm gemdir)
    pwd
  fi
}
