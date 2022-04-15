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

```
git clone https://github.com/kabinspace/AstroVim ~/.config/nvim
```

And grab my user config

```
git clone https://github.com/pwalker/astrovim_config.git ~/.config/nvim/lua/user
```
