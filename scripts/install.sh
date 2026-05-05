#!/bin/zsh

xcode-select --install

defaults write com.apple.finder AppleShowAllFiles YES

# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"

# See the changes
source ~/.zshrc
