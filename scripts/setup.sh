#!/bin/bash

chsh -s /bin/bash

BASE_DIR=$(dirname "$0")

$BASE_DIR/copy.sh

defaults write com.apple.finder AppleShowAllFiles YES

# Move cursor faster when editing
defaults write -g InitialKeyRepeat -int 25
defaults write -g KeyRepeat -int 2

# https://git-scm.com/book/en/v2/Git-Basics-Git-Aliases
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status
# Always set same upstream name
git config --global push.default current

# Auto-complete git cmds/branch names etc
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash

# Install nvm, node and global deps
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

nvm install node
nvm install-latest-npm

npm install -g http-server
npm install -g prettier
npm install -g svgo
npm install -g typescript
npm install -g tldr

# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

brew install git
brew install vim
brew install fzf
brew install go
brew install the_silver_searcher

brew install --cask alfred
brew install --cask blender
brew install --cask brave-browser
brew install --cask discord
brew install --cask docker
brew install --cask epic-games
brew install --cask evernote
brew install --cask gimp
brew install --cask google-backup-and-sync
brew install --cask iterm2
brew install --cask kap
brew install --cask karabiner-elements
brew install --cask obs
brew install --cask openemu
brew install --cask postico
brew install --cask postman
brew install --cask qbittorrent
brew install --cask rectangle
brew install --cask sequel-pro
brew install --cask slack
brew install --cask sourcetree
brew install --cask spotify
brew install --cask steam
brew install --cask sublime-text
brew install --cask the-unarchiver
brew install --cask virtualbox
brew install --cask vlc
brew install --cask zoom

# Some apps have specific config directories, so cp these. Symlinks don't work.
# Not ideal but this will likely be removed if I transition to vim and standard terminal.
cp -r $BASE_DIR/../.config/sublime/Preferences.sublime-settings $HOME/Library/Application\ Support/Sublime\ Text\ 3/Packages/User
cp -r $BASE_DIR/../.config/sublime/Package\ Control.sublime-settings $HOME/Library/Application\ Support/Sublime\ Text\ 3/Packages/User
cp -r $BASE_DIR/../.config/iterm2/com.googlecode.iterm2.plist $HOME/Library/Preferences

# See the bash changes
source ~/.bashrc
