#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'

echo -e "installing ${GREEN}\"op\"${NC}"

mkdir -p $HOME/.local/bin

# installing op

SOURCE_PATH="$PWD/op"
TARGET_PATH="$HOME/.local/bin/op"

if [ -e $TARGET_PATH ]; then
	echo -e "  ${YELLOW}SKIP${NC}: op already exists at ${CYAN}$TARGET_PATH${NC}"
	exit 1
fi

echo -e "  creating symbolic link ${CYAN}${SOURCE_PATH}${NC} -> ${CYAN}${TARGET_PATH}${NC}"

ln -s $SOURCE_PATH $TARGET_PATH

# installing op completer

SOURCE_PATH="$PWD/op_completer.py"
TARGET_PATH="$HOME/.local/bin/op_completer.py"

if [ -e $TARGET_PATH ]; then
	echo -e "  ${YELLOW}SKIP${NC}: op completer already exists at ${CYAN}$TARGET_PATH${NC}"
	exit 1
fi

echo -e "  creating symbolic link ${CYAN}${SOURCE_PATH}${NC} -> ${CYAN}${TARGET_PATH}${NC}"

ln -s $SOURCE_PATH $TARGET_PATH

# info

if ! echo $PATH | grep "$HOME/\.local/bin" > /dev/null; then
	echo -e "  ${YELLOW}HINT:${NC} to make \"op\" work you should add ${CYAN}$HOME/.local/bin${NC} to ${CYAN}\$PATH!${NC}"
fi

echo -e "  ${GREEN}SUCCESS:${NC} finished ${GREEN}op${NC} installation"
