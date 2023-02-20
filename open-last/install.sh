#!/bin/bash

SCRIPT_NAME="e (edit)"
TARGET_FILE="$HOME/.bashrc"

echo "installing \"$SCRIPT_NAME\"..."

# cat open-last.sh >> "$HOME/.bashrc
if grep "open-last installation" "$TARGET_FILE" &>/dev/null; then
	echo "  e (edit) already installed -> skipping"
else
	cat open-last.sh >> "$TARGET_FILE"
fi

echo "finished \"$SCRIPT_NAME\" installation"
