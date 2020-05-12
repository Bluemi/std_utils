#!/bin/bash

# Installation script for installing shorter bash prompt

mkdir -p $HOME/.local/bin

ln -s $PWD/src/main.py $HOME/.local/bin/bash_prompt.py

if ! echo $PATH | grep "$HOME/\.local/bin" > /dev/null; then
	echo "to make this work you should add \$HOME/.local/bin to \$PATH!"
fi

echo "add the following lines into your bashrc to make bash prompt working"
echo ""
echo "function prompt_command {"
echo "	CWD_TRIMMED="$(/home/alok/.local/bin/bash_prompt.py)""
echo "}"
echo ""
echo "PROMPT_COMMAND=prompt_command"
echo "PS1='\[\033[33m\]$CWD_TRIMMED\$\[\033[00m\] '"


# Comment for easy copy:

# function prompt_command {
# 	CWD_TRIMMED="$(/home/alok/.local/bin/bash_prompt.py)"
# }
# 
# PROMPT_COMMAND=prompt_command
# PS1='\[\033[33m\]$CWD_TRIMMED\$\[\033[00m\] '
