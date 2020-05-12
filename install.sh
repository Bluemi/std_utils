#!/bin/bash

# installs all the underlying tools

for d in "*/"; do
	if [ -f "$1/install.sh" ]; then
		cd "$1"
		./install.sh
		cd ..
	fi
done
