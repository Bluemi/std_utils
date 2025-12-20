#!/bin/bash

PACKAGES=$(pacman -Qtdq)
if [ -n "$PACKAGES" ]; then
	sudo pacman -Rns "$PACKAGES"
else
	echo "no packages to clear"
fi
