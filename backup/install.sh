#!/bin/bash

SCRIPT_NAME="backup-now"

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'

echo -e "installing ${GREEN}$SCRIPT_NAME${NC}"

mkdir -p $HOME/.local/bin

# ---- install backup-now ----
SOURCE_PATH="$PWD/backup_now.sh"
TARGET_PATH="$HOME/.local/bin/backup-now"

if [ -e $TARGET_PATH ]; then
	echo -e "  ${YELLOW}SKIP:${NC} $SCRIPT_NAME already exists at ${CYAN}$TARGET_PATH${NC}"
else
	echo -e "  creating symbolic link ${CYAN}${SOURCE_PATH}${NC} -> ${CYAN}${TARGET_PATH}${NC}"
	ln -s $SOURCE_PATH $TARGET_PATH
fi

# ---- install format backup output ----
SOURCE_PATH="$PWD/format_backup_output.py"
TARGET_PATH="$HOME/.local/bin/format_backup_output.py"

if [ -e $TARGET_PATH ]; then
	echo -e "  ${YELLOW}SKIP:${NC} format_backup_output.py already exists at ${CYAN}$TARGET_PATH${NC}"
else
	echo -e "  creating symbolic link ${CYAN}${SOURCE_PATH}${NC} -> ${CYAN}${TARGET_PATH}${NC}"
	ln -s $SOURCE_PATH $TARGET_PATH
fi

# ---- check PATH ----
if ! echo $PATH | grep "$HOME/\.local/bin" > /dev/null; then
	echo -e "  ${YELLOW}HINT:${NC} to make ${GREEN}$SCRIPT_NAME${NC} work you should add ${CYAN}$HOME/.local/bin${NC} to ${CYAN}\$PATH!${NC}"
fi

# add exclude file
EXCLUDE_FILE="$HOME/.local/etc/backup_now/excludes.txt"
mkdir -p $(dirname "$EXCLUDE_FILE")
if [ ! -e $EXCLUDE_FILE ]; then
	ln -s "$PWD/exclude.txt" "$EXCLUDE_FILE"
	echo -e "  linked exclude file ${GREEN}${EXCLUDE_FILE}${NC}"
fi

echo -e "  ${GREEN}SUCCESS:${NC} finished ${GREEN}$SCRIPT_NAME${NC} installation"
