#!/bin/bash

echo "installing \"completer\"..."

mkdir -p $HOME/.local/bin


# installing completer.py

TARGET_PATH="$HOME/.local/bin/completer.py"

if [ -e $TARGET_PATH ]; then
	echo "  ERROR: completer already exists at $TARGET_PATH"
	exit 1
fi

echo "  creating symbolic link $PWD/completer.py -> $TARGET_PATH"

ln -s $PWD/completer.py $TARGET_PATH


# installing completer

TARGET_PATH="$HOME/.local/bin/completer"

if [ -e $TARGET_PATH ]; then
	echo "  ERROR: completer already exists at $TARGET_PATH"
	exit 1
fi

echo "  creating symbolic link $PWD/completer -> $TARGET_PATH"

ln -s $PWD/completer $TARGET_PATH


if ! echo $PATH | grep "$HOME/\.local/bin" > /dev/null; then
	echo "  to make \"completer\" work you should add $HOME/.local/bin to \$PATH!"
fi

echo "finished \"completer\" installation"
