#!/bin/zsh

BASE_DIR=$(dirname "$0")

function copy {
  TARGET=$1
  cp -r ${BASE_DIR}/../${TARGET} ${HOME}
  echo "Copied ${TARGET}"
}

copy .config

# Root
copy .gitignore_global
copy .hushlogin
copy .zshrc

# Source the new zsh configuration
source ~/.zshrc
