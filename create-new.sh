#!/bin/bash

if [ -z "$1" ]; then
	echo "ERROR: first argument should be script name"
	exit 1
fi

if [ -d "$1" ]; then
	echo "ERROR: script already exists"
	exit 1
fi

mkdir "$1"

cp install_template.sh "$1"/install.sh
sed "s/THE_SCRIPT_NAME/$1/" -i "$1"/install.sh
