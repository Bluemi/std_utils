#!/bin/bash

# also glob hidden files
shopt -s dotglob
dir=""
if [ -d "$1" ]; then
	dir="$1"
	dir="${dir%/}/"
elif [ -e "$1" ]; then
	du -sh "$1"
	exit 0
elif [ -n "$1" ]; then
	echo "Argument \"$1\" does not exist."
	exit 1
fi

du -sh "$dir"* | sort -h
