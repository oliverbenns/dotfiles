#!/bin/zsh

BASE_DIR=$(dirname "$0")

function copy {
  TARGET=$1
  cp -r ${BASE_DIR}/../${TARGET} ${HOME}
  echo "Copied ${TARGET}"
}

copy .zshrc
copy .config
copy .editorconfig
copy .gitignore_global
copy .prettierrc.json

# Source the new zsh configuration
source ~/.zshrc
