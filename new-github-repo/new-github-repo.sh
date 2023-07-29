#!/bin/bash

name="$1"
if [ -z "$name" ]; then
	echo -n "Name: "
	read name
fi

echo -n "Description: "
read description
gh repo create "$name" --add-readme --clone --license "gpl-3.0" --description "$description" --public
