#!/bin/bash

echo "installing \"op\"..."

mkdir -p $HOME/.local/bin

# installing op

SOURCE_PATH="$PWD/op"
TARGET_PATH="$HOME/.local/bin/op"

if [ -e $TARGET_PATH ]; then
	echo "  ERROR: op already exists at $TARGET_PATH"
	exit 1
fi

echo "  creating symbolic link $SOURCE_PATH -> $TARGET_PATH"

ln -s $SOURCE_PATH $TARGET_PATH

# installing op completer

SOURCE_PATH="$PWD/op_completer.py"
TARGET_PATH="$HOME/.local/bin/op_completer.py"

if [ -e $TARGET_PATH ]; then
	echo "  ERROR: op completer already exists at $TARGET_PATH"
	exit 1
fi

echo "  creating symbolic link $SOURCE_PATH -> $TARGET_PATH"

ln -s $SOURCE_PATH $TARGET_PATH

# info

if ! echo $PATH | grep "$HOME/\.local/bin" > /dev/null; then
	echo "  to make \"op\" work you should add $HOME/.local/bin to \$PATH!"
fi

echo "finished \"op\" installation"
