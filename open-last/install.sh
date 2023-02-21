#!/bin/bash

SCRIPT_NAME="e (edit)"
TARGET_FILE="$HOME/.bashrc"

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'

echo -e "installing ${GREEN}$SCRIPT_NAME${NC}"

# cat open-last.sh >> "$HOME/.bashrc
if grep "open-last installation" "$TARGET_FILE" &>/dev/null; then
	echo -e "  ${YELLOW}SKIP:${NC} $SCRIPT_NAME is already installed"
	exit 1
else
	cat open-last.sh >> "$TARGET_FILE"
fi

echo -e "  ${GREEN}SUCCESS:${NC} finished ${GREEN}$SCRIPT_NAME${NC} installation"
