#!/bin/bash

echo "installing \"cpp-new\"..."

mkdir -p $HOME/.local/bin

SOURCE_PATH="$PWD/cpp_new.py"
TARGET_PATH="$HOME/.local/bin/cpp-new"

if [ -e $TARGET_PATH ]; then
	echo "  ERROR: cpp-new already exists at $TARGET_PATH"
	exit 1
fi

echo "  creating symbolic link $SOURCE_PATH -> $TARGET_PATH"

ln -s $SOURCE_PATH $TARGET_PATH

if ! echo $PATH | grep "$HOME/\.local/bin" > /dev/null; then
	echo "  to make \"cpp-new\" work you should add $HOME/.local/bin to \$PATH!"
fi

echo "finished \"cpp-new\" installation"
