#!/bin/bash

echo "installing \"timer\"..."

mkdir -p $HOME/.local/bin
mkdir -p $HOME/.local/etc/timer

# install timer

SOURCE_PATH="$PWD/timer"
TARGET_PATH="$HOME/.local/bin/timer"

if [ -e $TARGET_PATH ]; then
	echo "  ERROR: timer already exists at $TARGET_PATH"
	exit 1
fi

echo "  creating symbolic link $SOURCE_PATH -> $TARGET_PATH"

ln -s $SOURCE_PATH $TARGET_PATH


# copy complete.oga

SOURCE_PATH="$PWD/complete.oga"
TARGET_PATH="$HOME/.local/etc/timer/complete.oga"

if [ -e $TARGET_PATH ]; then
	echo "  ERROR: complete.oga already exists at $TARGET_PATH"
	exit 1
fi

echo "  creating symbolic link $SOURCE_PATH -> $TARGET_PATH"

ln -s $SOURCE_PATH $TARGET_PATH

# info

if ! echo $PATH | grep "$HOME/\.local/bin" > /dev/null; then
	echo "  to make \"timer\" work you should add $HOME/.local/bin to \$PATH!"
fi

echo "finished \"timer\" installation"
