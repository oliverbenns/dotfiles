#!/bin/bash

BASE_DIR=$(dirname "$0")

GREEN="\033[0;32m"
CYAN="\033[0;36m"
CLEAR="\033[0m"

function installFile {
  FILE_NAME=$1

  printf "$FILE_NAME: "

  if git diff --quiet ~/$FILE_NAME $BASE_DIR/$FILE_NAME
  then
    echo "${CYAN}no changes${CLEAR}"
    return
  fi

  if [ -f ~/$FILE_NAME ]
  then
    echo "${GREEN}updated${CLEAR}"

  else
    echo "${GREEN}added${CLEAR}"
  fi

  cp $BASE_DIR/$FILE_NAME ~/$FILE_NAME
}

installFile ".bash_profile"
installFile ".gitignore_global"
