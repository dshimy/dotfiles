PLATFORM=`uname`
TERM=xterm-256color
EDITOR=nvim

alias h="history"
alias k="kubectl"
alias c="clear"
alias v="vim"
alias vim="nvim"

export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

function parse_git_branch {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "("${ref#refs/heads/}") "
}

RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
WHITE="\[\033[0;11m\]"
GRAY="\[\033[38;5;244m\]"
PS1="$YELLOW\A $GRAY[$RED\w$GRAY] $YELLOW\$(parse_git_branch)$RED\$ $WHITE"

export PATH="$HOME/google-cloud-sdk/bin:$PATH"
eval "$(rbenv init -)"

export PATH="$HOME/bin:$PATH:$HOME/go/bin"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
[ -f $HOME/google-cloud-sdk/completion.bash.inc ] && . $HOME/google-cloud-sdk/completion.bash.inc
