#!/bin/bash

SCRIPT_NAME="clear-jupyter-notebooks"

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'


echo -e "installing ${GREEN}$SCRIPT_NAME${NC}"

mkdir -p $HOME/.local/bin

SOURCE_PATH="$PWD/$SCRIPT_NAME.sh"
TARGET_PATH="$HOME/.local/bin/$SCRIPT_NAME"

if [ -e $TARGET_PATH ]; then
	echo -e "  ${YELLOW}SKIP:${NC} $SCRIPT_NAME already exists at ${CYAN}$TARGET_PATH${NC}"
	exit 1
fi

echo -e "  creating symbolic link ${CYAN}${SOURCE_PATH}${NC} -> ${CYAN}${TARGET_PATH}${NC}"

ln -s $SOURCE_PATH $TARGET_PATH

if ! echo $PATH | grep "$HOME/\.local/bin" > /dev/null; then
	echo -e "  ${YELLOW}HINT:${NC} to make ${GREEN}$SCRIPT_NAME${NC} work you should add ${CYAN}$HOME/.local/bin${NC} to ${CYAN}\$PATH!${NC}"
fi

# check virtualenv
VIRTUAL_ENV_NAME="clear_notebook"
if [ -f "$HOME/.virtualenvs/$VIRTUAL_ENV_NAME/bin/activate" ]; then
	source "$HOME/.virtualenvs/$VIRTUAL_ENV_NAME/bin/activate"
else
	source "$HOME/.local/bin/virtualenvwrapper.sh"
	mkvirtualenv "$VIRTUAL_ENV_NAME"
	echo -e "  created virtual env ${GREEN}\"$VIRTUAL_ENV_NAME\"${NC}"
fi

# check nbconvert installation
if ! python3 -m nbconvert --version >/dev/null 2>/dev/null; then
	python3 -m pip install nbconvert -q --disable-pip-version-check
	echo -e "  installed ${GREEN}nbconvert${NC}"
fi

echo -e "  ${GREEN}SUCCESS:${NC} finished ${GREEN}$SCRIPT_NAME${NC} installation"
