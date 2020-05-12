#!/bin/bash

# installs all the underlying tools

for d in */; do
	if [ -f "$d/install.sh" ]; then
		cd "$d"
		./install.sh
		cd ..
	fi
done
