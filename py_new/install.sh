#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'

echo -e "installing ${GREEN}py-new${NC}"

mkdir -p $HOME/.local/bin

SOURCE_PATH="$PWD/py_new.sh"
TARGET_PATH="$HOME/.local/bin/py-new"

if [ -e $TARGET_PATH ]; then
	echo -e "  ${YELLOW}SKIP:${NC} py-new already exists at ${CYAN}$TARGET_PATH${NC}"
	exit 1
fi

echo -e "  creating symbolic link ${CYAN}${SOURCE_PATH}${NC} -> ${CYAN}${TARGET_PATH}${NC}"

ln -s $SOURCE_PATH $TARGET_PATH

if ! echo $PATH | grep "$HOME/\.local/bin" > /dev/null; then
	echo -e "  ${YELLOW}HINT:${NC} to make ${GREEN}py-new${NC} work you should add ${CYAN}$HOME/.local/bin${NC} to ${CYAN}\$PATH!${NC}"
fi

echo -e "  ${GREEN}SUCCESS:${NC} finished ${GREEN}py-new${NC} installation"
