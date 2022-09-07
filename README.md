# dotfiles

This repo is best used as a bare checkout into your home folder.

## Installing

The best way to install this on a new machine is with a git clone.  A caveat with this approach is that it will straight-up overwrite files you've currently got.  I'd recommend making some backups before you clone.

```zsh
git clone --separate-git-dir=.dotfiles.git git@github.com:pwalker/dotfiles.git .
```

## Using

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

### CLI Tools

```sh
brew install bat exa fzf git-delta neovim direnv fnm zoxide
```

### AstroNvim

https://astronvim.github.io/

```sh
git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim
nvim +PackerSync
```

And grab my user config

```
git clone https://github.com/pwalker/astrovim_config.git ~/.config/nvim/lua/user
```

Chances are if you use this user config, you also need to install a couple of extra things:

```sh
npm install -g prettier
brew install stylua
```

### Fonts & Terminal Stuff

#### Fonts

https://github.com/Homebrew/homebrew-cask-fonts

```sh
brew tap homebrew/cask-fonts
brew install --cask font-fira-code-nerd-font font-fira-code font-hack-nerd-font font-ubuntu-nerd-font
```
