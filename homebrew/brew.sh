#!/usr/bin/env bash

# This install GUI applications

echo "Installing applications through brew casks..."

# Make sure we’re using the latest Homebrew.
brew update

brew install neovim

# Upgrade any already-installed casks
brew cask upgrade

# Time for some action
brew cask install iterm2
brew cask install flux

# https://github.com/tonsky/FiraCode/wiki/Installing
brew tap homebrew/cask-fonts
brew cask install font-fira-code