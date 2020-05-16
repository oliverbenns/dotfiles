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

if [ $1 ] 
then
  if [ ! -f "$1" ]
  then
    echo "File \"${1}\" does not exist."
    exit 1
  else 
    installFile "${1}"
  fi
else 
  while true; do
    read -p "You are about to install all files, do you wish to proceed?" yn
    case $yn in
      [Yy]* ) break;;
      [Nn]* ) exit;;
      * ) echo "Please answer yes or no.";;
    esac
  done
  installFile ".bash_profile"
  installFile ".gitignore_global"
  installFile ".vimrc"
  installFile ".editorconfig"
fi
