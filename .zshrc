#
# Functions
#
_has() {
  return $( whence $1 >/dev/null )
}

# Clone antidote if necessary.
[[ -e ${ZDOTDIR:-~}/.antidote ]] ||
  git clone https://github.com/mattmc3/antidote.git ${ZDOTDIR:-~}/.antidote

# Source antidote.
source ${ZDOTDIR:-~}/.antidote/antidote.zsh

# Initialize antidote's dynamic mode, which changes `antidote bundle`
# from static mode.
source <(antidote init)

antidote bundle zsh-users/zsh-completions
antidote bundle mattmc3/zephyr path:plugins/completions

antidote bundle zsh-users/zsh-syntax-highlighting
antidote bundle mroth/evalcache
antidote bundle zsh-users/zsh-autosuggestions
antidote bundle wfxr/forgit

antidote bundle ohmyzsh/ohmyzsh path:plugins/yarn
antidote bundle ohmyzsh/ohmyzsh path:plugins/aws/aws.plugin.zsh
antidote bundle ohmyzsh/ohmyzsh path:plugins/fzf

antidote bundle thirteen37/fzf-alias

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
alias vi="$EDITOR"
alias vim="$EDITOR"
alias v="$EDITOR"


#
# FZF
#
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# fzf + ag configuration
if _has fzf && _has ag; then
  export FZF_DEFAULT_COMMAND='ag --nocolor --hidden -g ""'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_DEFAULT_OPTS='
    --color=fg:#a1aab8,bg:#011627,hl:#c792ea
    --color=fg+:#d6deeb,bg+:#011627,hl+:#ff5874
    --color=info:#959ead,prompt:#fc514e,pointer:#c792ea
    --color=marker:#a1cd5e,spinner:#21c7a8,header:#7fdbca
  '
fi


# From my old file:
export TERM="xterm-256color"

export PATH=${PATH}:${GOPATH}/bin

if [[ -a $HOME/.cargo/env ]]
then
  source $HOME/.cargo/env
fi


# eval "$(direnv hook zsh)"
_evalcache direnv hook zsh

#eval "$(fnm env --use-on-cd)"
_evalcache fnm env --use-on-cd

#eval "$(zoxide init --cmd j zsh)"
_evalcache zoxide init --cmd j zsh

eval "$(starship init zsh)"


#
# Aliases
#
alias dotfiles="git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME"
alias ls='exa'

# Stash your environment variables in ~/.localrc. This means they'll stay out
# of your main dotfiles repository (which may be public, like this one), but
# you'll have access to them in your scripts.
if [[ -a ~/.localrc ]]
then
  source ~/.localrc
fi


