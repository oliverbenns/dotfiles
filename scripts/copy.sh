#!/bin/bash

BASE_DIR=$(dirname "$0")

function copy {
  TARGET=$1
  cp -r ${BASE_DIR}/../${TARGET} ${HOME}
  echo "Copied ${TARGET}"
}

copy .bash_profile
copy .bashrc
copy .config
copy .editorconfig
copy .gitignore_global
copy .hushlogin
copy .prettierrc.json

# See the bash changes
source ~/.bashrc
