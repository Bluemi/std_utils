#!/bin/bash

if [ -e "/c" ]; then
	echo '"/c" already exists'
	exit 1
fi

sudo mkdir /c
sudo chown "$USER":"$USER" /c
mkdir -p /c/Windows/Fonts

curl "https://raw.githubusercontent.com/Bluemi/std_utils/master/rokoko_quick_fix/YuGothB.ttc" --output "/c/Windows/Fonts/YuGothB.ttc"

