#!/bin/bash


# source bashrc-ext.sh in $HOME/.bashrc
grep 3bb1be4b-caab-437e-b631-60acc783a2d1 $HOME/.bashrc >/dev/null 2>&1 \
	|| echo -e "\n# 3bb1be4b-caab-437e-b631-60acc783a2d1\nsource $PWD/bashrc-ext.sh\nsource $PWD/local-bashrc-ext.sh\n" >> $HOME/.bashrc

# create local-bashrc-ext.sh
if [ ! -f $PWD/local-bashrc-ext.sh ]; then
	cp local-bashrc-ext.sh.template local-bashrc-ext.sh
fi

# install tools
for d in */; do
	if [ -f "$d/install.sh" ]; then
		cd "$d"
		./install.sh
		cd ..
	fi
done
