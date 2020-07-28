#!/bin/bash

BASE_DIR=$(dirname "$0")

function copy {
  TARGET=$1
  cp -r ${BASE_DIR}/../${TARGET} ${HOME}
  echo "Copied ${TARGET}"
}

copy .bash_profile
copy .config
copy .editorconfig
copy .gitignore_global
copy .vimrc

# See the bash changes
source ~/.bashrc
