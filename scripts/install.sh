#!/bin/zsh

xcode-select --install

defaults write com.apple.finder AppleShowAllFiles YES

# Install nvm, node and global deps
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

nvm install stable

# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"

# Some apps have specific config directories, so cp these. Symlinks don't work.
# Not ideal but this will likely be removed if I transition to standard terminal.
cp -r $BASE_DIR/../.config/iterm2/com.googlecode.iterm2.plist $HOME/Library/Preferences

# See the changes
source ~/.zshrc
