#!/bin/zsh

BASE_DIR=$(dirname "$0")

$BASE_DIR/copy.sh

defaults write com.apple.finder AppleShowAllFiles YES

# Move cursor faster when vim editing
defaults write -g InitialKeyRepeat -int 25
defaults write -g KeyRepeat -int 2

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
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.2/install.sh | bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

nvm install stable
nvm install-latest-npm

npm install -g http-server
npm install -g kill-port
npm install -g typescript-language-server
npm install -g prettier
npm install -g typescript
npm install -g vercel
npm install -g vscode-langservers-extracted

# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"

brew install direnv
brew install gh
brew install go

# Nvim
brew install fzf
brew install the_silver_searcher
brew install fd
brew install ripgrep
brew install neovim

# Apps
brew install --cask brave-browser
brew install --cask cursor
brew install --cask discord
brew install --cask docker-desktop
brew install --cask google-chrome
brew install --cask google-cloud-sdk
brew install --cask google-drive
brew install --cask imageoptim
brew install --cask iterm2
brew install --cask kap
brew install --cask karabiner-elements
brew install --cask postico
brew install --cask postman
brew install --cask qbittorrent
brew install --cask raycast
brew install --cask rectangle
brew install --cask send-to-kindle
brew install --cask slack
brew install --cask sourcetree
brew install --cask spotify
brew install --cask telegram
brew install --cask the-unarchiver
brew install --cask vlc
brew install --cask whatsapp
brew install --cask zoom

# Cursor agent
curl https://cursor.com/install -fsS | bash

curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Some apps have specific config directories, so cp these. Symlinks don't work.
# Not ideal but this will likely be removed if I transition to vim and standard terminal.
cp -r $BASE_DIR/../.config/iterm2/com.googlecode.iterm2.plist $HOME/Library/Preferences

# See the changes
source ~/.zshrc
