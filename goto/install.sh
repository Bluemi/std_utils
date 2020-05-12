#!/bin/bash

echo "installing \"goto\"..."

mkdir -p $HOME/.local/bin

SOURCE_PATH="$PWD/goto"
TARGET_PATH="$HOME/.local/bin/goto"

if [ -e $TARGET_PATH ]; then
	echo "  ERROR: goto already exists at $TARGET_PATH"
	exit 1
fi

echo "  creating symbolic link $SOURCE_PATH -> $TARGET_PATH"

ln -s $SOURCE_PATH $TARGET_PATH

if ! echo $PATH | grep "$HOME/\.local/bin" > /dev/null; then
	echo "  to make \"goto\" work you should add $HOME/.local/bin to \$PATH!"
fi

echo "  to make goto work add the following line to your .bashrc"
echo ""
echo "  alias goto=\". goto\""
echo "  . goto -c  # for goto autocompletion"

echo "finished \"goto\" installation"
