#!/bin/bash

SCRIPT_NAME="chattr-wrapper"

echo "installing \"$SCRIPT_NAME\"..."

mkdir -p $HOME/.local/bin

SOURCE_PATH="$PWD/$SCRIPT_NAME.sh"
TARGET_PATH="$HOME/.local/bin/chattr"

if [ -e $TARGET_PATH ]; then
	echo "  ERROR: $SCRIPT_NAME already exists at $TARGET_PATH"
	exit 1
fi

echo "  creating symbolic link $SOURCE_PATH -> $TARGET_PATH"

ln -s $SOURCE_PATH $TARGET_PATH

if ! echo $PATH | grep "$HOME/\.local/bin" > /dev/null; then
	echo "  to make \"$SCRIPT_NAME\" work you should add $HOME/.local/bin to \$PATH!"
fi

echo "finished \"$SCRIPT_NAME\" installation"
