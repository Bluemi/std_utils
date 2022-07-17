#!/bin/bash

echo "installing \"pling\"..."

mkdir -p $HOME/.local/bin

SOURCE_PATH="$PWD/pling.sh"
TARGET_PATH="$HOME/.local/bin/pling"

if [ -e $TARGET_PATH ]; then
	echo "  ERROR: pling already exists at $TARGET_PATH"
	exit 1
fi

echo "  creating symbolic link $SOURCE_PATH -> $TARGET_PATH"

ln -s $SOURCE_PATH $TARGET_PATH

if ! echo $PATH | grep "$HOME/\.local/bin" > /dev/null; then
	echo "  to make \"pling\" work you should add $HOME/.local/bin to \$PATH!"
fi

echo "finished \"pling\" installation"
