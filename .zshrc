# shortcut to this dotfiles path is $ZSH
export DOTFILES=$HOME/.dotfiles

# your project folder that we can `c [tab]` to
export PROJECTS=~/Work

# Stash your environment variables in ~/.localrc. This means they'll stay out
# of your main dotfiles repository (which may be public, like this one), but
# you'll have access to them in your scripts.
if [[ -a ~/.localrc ]]
then
  source ~/.localrc
fi

#
# Aliases
#
alias dotfiles="git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME"

# From my old file:
export TERM="xterm-256color"

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

plugins=(
  aws
  git
  iterm2
  zsh_reload
  fzf
  zsh-nvm
  yarn
  npm
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/pwalker/.sdkman"
[[ -s "/Users/pwalker/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/pwalker/.sdkman/bin/sdkman-init.sh"

export PATH=${PATH}:${GOPATH}/bin

eval "$(starship init zsh)"
