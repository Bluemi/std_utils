#!/bin/bash

echo "installing \"cmus_wrapper\"..."

mkdir -p $HOME/.local/bin

function make_sym_link() {
	SOURCE_PATH="$PWD/$1"
	TARGET_PATH="$HOME/.local/bin/$1"

	if [ -e $TARGET_PATH ]; then
		echo "  ERROR: $1 already exists at $TARGET_PATH"
		exit 1
	fi

	echo "  creating symbolic link $SOURCE_PATH -> $TARGET_PATH"

	ln -s $SOURCE_PATH $TARGET_PATH
}

make_sym_link cmus_wrapper.sh
make_sym_link mount_cmus.sh

if ! echo $PATH | grep "$HOME/\.local/bin" > /dev/null; then
	echo "  to make \"cmus_wrapper\" work you should add $HOME/.local/bin to \$PATH!"
fi

echo "finished \"cmus_wrapper\" installation"
