#!/bin/bash

echo "installing \"update_all.sh\"..."

mkdir -p $HOME/.local/bin

SOURCE_PATH="$PWD/update_all.sh"
TARGET_PATH="$HOME/.local/bin/update_all"

if [ -e $TARGET_PATH ]; then
	echo "  ERROR: update_all already exists at $TARGET_PATH"
	exit 1
fi

echo "  creating symbolic link $SOURCE_PATH -> $TARGET_PATH"

ln -s $SOURCE_PATH $TARGET_PATH

if ! echo $PATH | grep "$HOME/\.local/bin" > /dev/null; then
	echo "  to make \"update_all\" work you should add $HOME/.local/bin to \$PATH!"
fi

echo "finished \"update_all\" installation"
