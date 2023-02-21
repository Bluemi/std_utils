#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'

echo -e "installing ${GREEN}goto${NC}"

mkdir -p $HOME/.local/bin
mkdir -p $HOME/.local/etc/goto

SOURCE_PATH="$PWD/goto"
TARGET_PATH="$HOME/.local/bin/goto"

if [ -e $TARGET_PATH ]; then
	echo -e "  ${YELLOW}SKIP:${NC} goto already exists at ${CYAN}$TARGET_PATH${NC}"
	exit 1
fi

echo -e "  creating symbolic link ${CYAN}${SOURCE_PATH}${NC} -> ${CYAN}${TARGET_PATH}${NC}"

ln -s $SOURCE_PATH $TARGET_PATH

if ! echo $PATH | grep "$HOME/\.local/bin" > /dev/null; then
	echo -e "  ${YELLOW}HINT:${NC} to make ${GREEN}goto${NC} work you should add ${CYAN}$HOME/.local/bin${NC} to ${CYAN}\$PATH!${NC}"
fi

echo -e "  ${YELLOW}HINT:${NC} to make goto work add the following two lines to your ${GREEN}.bashrc${NC}:"
echo "  alias goto=\". goto\""
echo "  . goto -c  # for goto autocompletion"

echo -e "  ${GREEN}SUCCESS:${NC} finished ${GREEN}goto${NC} installation"
