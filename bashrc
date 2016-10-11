# ----------------------------------------------------------------------
# Preliminaries
# ----------------------------------------------------------------------

PLATFORM=`uname`

# ----------------------------------------------------------------------
# General Bash Settings
# ----------------------------------------------------------------------

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoreboth
export HISTIGNORE="ls:bg:fg:date:clear:c:history:h"
export HISTFILE=

# check the window size after each command and, if necessary, update
shopt -s checkwinsize

# Notify when jobs finish
set -o notify

# Set the keybindings
set -o emacs

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# Some aliases
alias "h=history"
alias "c=clear"
alias "mroe=less"
alias "more=less"
alias "cd..=cd .."
alias "cd...=cd ../.."
alias "sb=source ~/.bashrc"
alias "v=vim"

for f in ~/.bash_completions/*.bash ; do
  . $f
done

# ----------------------------------------------------------------------
# Path
# ----------------------------------------------------------------------

PATH="$HOME/bin:/bin:/usr/bin:/usr/local/bin:/opt/local/bin:$PATH"
PATH="$PATH:/sbin:/usr/sbin:/usr/local/sbin"
PATH="$PATH:/usr/local/mysql/bin"

# ----------------------------------------------------------------------
# Pager, Editor, and More
# ----------------------------------------------------------------------

if [ "$PLATFORM" == 'Darwin' ]; then
  EDITOR="vim"
else
  EDITOR="vim"
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
  echo ${ref#refs/heads/}" "
}

RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
WHITE="\[\033[0;11m\]"
GRAY="\[\033[38;5;244m\]"
PS1="$RED\A \h $GRAY[$RED\w$GRAY] $YELLOW\$(parse_git_branch)$RED\$ $WHITE"

man() {
  env \
    LESS_TERMCAP_mb=$(printf "\e[1;31m") \
    LESS_TERMCAP_md=$(printf "\e[1;31m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[1;32m") \
      man "$@"
}

# ----------------------------------------------------------------------
# rbenv for Ruby
# ----------------------------------------------------------------------

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# ----------------------------------------------------------------------
# Process Local Settings
# ----------------------------------------------------------------------
if [ -f ~/.bash_local ]; then
  . ~/.bash_local
fi
