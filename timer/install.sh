#!/bin/bash

echo "installing \"timer\"..."

mkdir -p $HOME/.local/bin

TARGET_PATH="$HOME/.local/bin/timer"

if [ -e $TARGET_PATH ]; then
	echo "  ERROR: timer already exists at $TARGET_PATH"
	exit 1
fi

echo "  creating symbolic link $PWD/timer -> $TARGET_PATH"

ln -s $PWD/timer $TARGET_PATH

if ! echo $PATH | grep "$HOME/\.local/bin" > /dev/null; then
	echo "  to make \"timer\" work you should add $HOME/.local/bin to \$PATH!"
fi

echo "finished \"timer\" installation"
