#!/bin/bash

echo "installing \"silent\"..."

mkdir -p $HOME/.local/bin

SOURCE_PATH="$PWD/silent.sh"
TARGET_PATH="$HOME/.local/bin/silent"

if [ -e $TARGET_PATH ]; then
	echo "  ERROR: silent already exists at $TARGET_PATH"
	exit 1
fi

echo "  creating symbolic link $SOURCE_PATH -> $TARGET_PATH"

ln -s $SOURCE_PATH $TARGET_PATH

if ! echo $PATH | grep "$HOME/\.local/bin" > /dev/null; then
	echo "  to make \"silent\" work you should add $HOME/.local/bin to \$PATH!"
fi

echo "finished \"silent\" installation"
