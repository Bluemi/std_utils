#!/bin/bash

echo "installing \"sh-new\"..."

mkdir -p $HOME/.local/bin

SOURCE_PATH="$PWD/sh_new.sh"
TARGET_PATH="$HOME/.local/bin/sh-new"

if [ -e $TARGET_PATH ]; then
	echo "  ERROR: sh-new already exists at $TARGET_PATH"
	exit 1
fi

echo "  creating symbolic link $SOURCE_PATH -> $TARGET_PATH"

ln -s $SOURCE_PATH $TARGET_PATH

if ! echo $PATH | grep "$HOME/\.local/bin" > /dev/null; then
	echo "  to make \"sh-new\" work you should add $HOME/.local/bin to \$PATH!"
fi

echo "finished \"sh-new\" installation"
