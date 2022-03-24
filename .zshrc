# shortcut to this dotfiles path is $ZSH
export DOTFILES=$HOME/.dotfiles

# your project folder that we can `c [tab]` to
export PROJECTS=~/Work

#
# Functions
#
_has() {
  return $( whence $1 >/dev/null )
}


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
alias ls='exa'


#
# Completion
#
# matches case insensitive for lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# pasting with tabs doesn't perform completion
zstyle ':completion:*' insert-tab pending


#
# Editor
#
export EDITOR="nvim"                  # $EDITOR opens in terminal
alias vi="nvim"
alias vim="nvim"
alias v="nvim"


#
# FZF
#
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# fzf + ag configuration
if _has fzf && _has ag; then
  export FZF_DEFAULT_COMMAND='ag --nocolor -g ""'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_DEFAULT_OPTS='
    --color=fg:#a1aab8,bg:#011627,hl:#c792ea
    --color=fg+:#d6deeb,bg+:#011627,hl+:#ff5874
    --color=info:#959ead,prompt:#fc514e,pointer:#c792ea
    --color=marker:#a1cd5e,spinner:#21c7a8,header:#7fdbca
  '
fi


#
# Autojump
#
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh


#
# Vim
#
export MYVIMRC="~/.config/nvim/init.vim"


# From my old file:
export TERM="xterm-256color"

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

plugins=(
  evalcache
  aws
  git
  iterm2
  fzf
#  yarn
#  npm
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

export PATH=${PATH}:${GOPATH}/bin

source $HOME/.cargo/env

# eval "$(direnv hook zsh)"
_evalcache direnv hook zsh

eval "$(fnm env --use-on-cd)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/pwalker/.sdkman"
[[ -s "/Users/pwalker/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/pwalker/.sdkman/bin/sdkman-init.sh"

eval "$(starship init zsh)"

