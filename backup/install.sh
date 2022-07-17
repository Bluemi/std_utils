#!/bin/bash

SCRIPT_NAME="backup_now"

echo "installing \"$SCRIPT_NAME\"..."

mkdir -p $HOME/.local/bin

SOURCE_PATH="$PWD/backup_now.sh"
TARGET_PATH="$HOME/.local/bin/backup_now"

if [ -e $TARGET_PATH ]; then
	echo "  ERROR: $SCRIPT_NAME already exists at $TARGET_PATH"
	exit 1
fi

echo "  creating symbolic link $SOURCE_PATH -> $TARGET_PATH"

ln -s $SOURCE_PATH $TARGET_PATH

if ! echo $PATH | grep "$HOME/\.local/bin" > /dev/null; then
	echo "  to make \"$SCRIPT_NAME\" work you should add $HOME/.local/bin to \$PATH!"
fi

# add exclude file
EXCLUDE_FILE="$HOME/.local/etc/backup_now/excludes.txt"
mkdir -p $(dirname "$EXCLUDE_FILE")
if [ ! -e $EXCLUDE_FILE ]; then
	ln -s "$PWD/exclude.txt" "$EXCLUDE_FILE"
	echo "  linked exclude file"
fi


echo "finished \"$SCRIPT_NAME\" installation"
