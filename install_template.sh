#!/bin/bash

SCRIPT_NAME="THE_SCRIPT_NAME"

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'


echo "installing ${GREEN}\"$SCRIPT_NAME\"${NC}..."

mkdir -p $HOME/.local/bin

SOURCE_PATH="$PWD/$SCRIPT_NAME.sh"
TARGET_PATH="$HOME/.local/bin/$SCRIPT_NAME"

if [ -e $TARGET_PATH ]; then
	echo "  ${RED}ERROR:${NC} $SCRIPT_NAME already exists at $TARGET_PATH"
	exit 1
fi

echo "  creating symbolic link ${YELLOW}${SOURCE_PATH}${NC} -> ${YELLOW}${TARGET_PATH}${NC}"

ln -s $SOURCE_PATH $TARGET_PATH

if ! echo $PATH | grep "$HOME/\.local/bin" > /dev/null; then
	echo "  ${YELLOW}HINT:${NC} to make \"$SCRIPT_NAME\" work you should add ${YELLOW}$HOME/.local/bin${NC} to ${YELLOW}\$PATH!${NC}"
fi

echo "finished ${GREEN}\"$SCRIPT_NAME\"${NC} installation"
