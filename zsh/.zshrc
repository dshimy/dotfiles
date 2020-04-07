# zsh configuration file
# -------------------------------------------------------------------

# I use vi, but will default to emacs
#
bindkey -e

# Important ENV variables
#
export EDITOR=nvim
export KUBE_EDITOR=nvim

# Handy Aliases
#
alias ls="ls -G"
alias h="history"
alias k="kubectl"
alias c="clear"
alias v="nvim"
alias vi="nvim"
alias vim="nvim"
alias r="rails"
alias dc="docker-compose"

# Made our ls and tree commands look good
#
test -e ~/.dircolors && eval `dircolors -b ~/.dircolors`
# PS1=$'%T [%~] $ ' # Not used as we have the SpaceShip

export PATH="$HOME/google-cloud-sdk/bin:$PATH"
export PATH="$HOME/bin:$PATH:$HOME/go/bin"

# Set up rbenv (Ruby environments)
#
# - https://github.com/rbenv/rbenv
#
export PATH="$HOME/.rbenv/bin:${PATH}"
eval "$(rbenv init -)"

# Set Spaceship ZSH prompt
#
# - https://github.com/denysdovhan/spaceship-prompt
# - https://github.com/denysdovhan/spaceship-prompt/blob/master/docs/Options.md
#
autoload -U promptinit; promptinit
prompt spaceship

export SPACESHIP_PROMPT_ADD_NEWLINE=false
export SPACESHIP_PROMPT_SEPARATE_LINE=false
export SPACESHIP_KUBECONTEXT_SHOW=false
export SPACESHIP_RUBY_SHOW=false
export SPACESHIP_NODE_SHOW=false
export SPACESHIP_DOCKER_SHOW=false
export SPACESHIP_GIT_STATUS_SHOW=false
export SPACESHIP_VI_MODE_SHOW=false

