#!/bin/bash

mkdir -p $HOME/.local/bin

ln -s $PWD/timer $HOME/.local/bin/timer

if ! echo $PATH | grep "$HOME/\.local/bin" > /dev/null; then
	echo "to make timer work you should add \$HOME/.local/bin to \$PATH!"
fi
