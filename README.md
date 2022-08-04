# dotfiles

This repo is best used as a bare checkout into your home folder.

The following alias is in the `.zshrc` file, and is used in the place of git commands:

```zsh
# ~/.zshrc
alias dotfiles="git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME"
```

Adding and removing files works like normal commands:

```
dotfiles add .somerrc
dotfiles commit -m "added .somerc"
```

## Installing other things:

### AstroVim

https://astronvim.github.io/

```sh
git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim
nvim +PackerSync
```

And grab my user config

```
git clone https://github.com/pwalker/astrovim_config.git ~/.config/nvim/lua/user
```

### Fonts & Terminal Stuff

#### Fonts

https://github.com/Homebrew/homebrew-cask-fonts

```sh
brew tap homebrew/cask-fonts
brew install --cask font-fira-code-nerd-font font-fira-code font-hack-nerd-font font-ubuntu-nerd-font
```
