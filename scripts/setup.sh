#!/bin/zsh

BASE_DIR=$(dirname "$0")

$BASE_DIR/copy.sh

xcode-select --install

defaults write com.apple.finder AppleShowAllFiles YES

# https://git-scm.com/book/en/v2/Git-Basics-Git-Aliases
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status
# Always set same upstream name
git config --global push.default current

# Gitignore global
git config --global core.excludesfile '~/.gitignore_global'

# Install nvm, node and global deps
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

nvm install stable
nvm install-latest-npm

# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"

# Some apps have specific config directories, so cp these. Symlinks don't work.
# Not ideal but this will likely be removed if I transition to standard terminal.
cp -r $BASE_DIR/../.config/iterm2/com.googlecode.iterm2.plist $HOME/Library/Preferences

# See the changes
source ~/.zshrc
