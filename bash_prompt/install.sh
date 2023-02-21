#!/bin/bash

# Installation script for installing shorter bash prompt

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'

echo -e "installing ${GREEN}bash_prompt${NC}"

TARGET_PATH="$HOME/.local/bin/bash_prompt.py"

mkdir -p $HOME/.local/bin

if [ -e "$TARGET_PATH" ]; then
	echo -e "  ${YELLOW}SKIP:${NC} bash_prompt already exists at ${CYAN}$TARGET_PATH${NC}"
	exit 1
fi

echo -e "  creating symbolic link ${CYAN}${SOURCE_PATH}${NC} -> ${CYAN}${TARGET_PATH}${NC}"

ln -s $PWD/src/main.py $TARGET_PATH

if ! echo $PATH | grep "$HOME/\.local/bin" > /dev/null; then
	echo -e "  ${YELLOW}HINT:${NC} to make ${GREEN}bash_prompt${NC} work you should add ${CYAN}$HOME/.local/bin${NC} to ${CYAN}\$PATH!${NC}"
fi

echo -e "  ${YELLOW}HINT:${NC} add the following lines into your ${GREEN}.bashrc${NC} to make bash prompt work:"
echo 'function prompt_command {'
echo '    CWD_TRIMMED="$(/home/alok/.local/bin/bash_prompt.py)"'
echo '}'
echo 'PROMPT_COMMAND=prompt_command'
# echo 'PS1=\'\[\033[33m\]$CWD_TRIMMED\$\[\033[00m\] \''


# Comment for easy copy:

# function prompt_command {
# 	CWD_TRIMMED="$(/home/alok/.local/bin/bash_prompt.py)"
# }
# 
# PROMPT_COMMAND=prompt_command
# PS1='\[\033[33m\]$CWD_TRIMMED\$\[\033[00m\] '

echo -e "  ${GREEN}SUCCESS:${NC} finished ${GREEN}bash_prompt${NC} installation"
