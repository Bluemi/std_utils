#!/bin/bash

if [ -z "$1" ]; then
	echo "Usage: "$0" <filename>"
	exit 1
fi

if [ -z "$EDITOR" ]; then
	for editor in "nvim" "vim" "vi" "nano"; do
		if which "$editor" &>/dev/null; then
			EDITOR="$editor"
			break;
		fi
	done
fi

"$EDITOR" "$@"
