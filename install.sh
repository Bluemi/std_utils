#!/bin/bash

# source bashrc-ext.sh in $HOME/.bashrc
INSTALL_TARGET="$HOME/.bashrc"
grep 3bb1be4b-caab-437e-b631-60acc783a2d1 "$INSTALL_TARGET" >/dev/null 2>&1 \
	|| echo -e "\n# 3bb1be4b-caab-437e-b631-60acc783a2d1\nsource $PWD/init_scripts/bashrc-ext.sh\nsource $PWD/init_scripts/local-bashrc-ext.sh\n" >> "$INSTALL_TARGET"

# source profile-ext.sh in $HOME/.profile
INSTALL_TARGET="$HOME/.profile"
grep 81126a94-657d-4d21-bbee-f0cb6b5a8569 "$INSTALL_TARGET" >/dev/null 2>&1 \
	|| echo -e "\n# 81126a94-657d-4d21-bbee-f0cb6b5a8569\nsource $PWD/init_scripts/profile-ext.sh\n" >> "$INSTALL_TARGET"

# create local-bashrc-ext.sh
if [ ! -f init_scripts/local-bashrc-ext.sh ]; then
	cp init_scripts/local-bashrc-ext.sh.template init_scripts/local-bashrc-ext.sh
fi

# install tools
for d in */; do
	if [ -f "$d/install.sh" ]; then
		cd "$d"
		./install.sh
		cd ..
	fi
done
