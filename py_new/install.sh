#!/bin/bash

echo "installing \"py-new\"..."

mkdir -p $HOME/.local/bin

SOURCE_PATH="$PWD/py_new.sh"
TARGET_PATH="$HOME/.local/bin/py-new"

if [ -e $TARGET_PATH ]; then
	echo "  ERROR: py-new already exists at $TARGET_PATH"
	exit 1
fi

echo "  creating symbolic link $SOURCE_PATH -> $TARGET_PATH"

ln -s $SOURCE_PATH $TARGET_PATH

if ! echo $PATH | grep "$HOME/\.local/bin" > /dev/null; then
	echo "  to make \"py-new\" work you should add $HOME/.local/bin to \$PATH!"
fi

echo "finished \"py-new\" installation"
