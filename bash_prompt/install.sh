#!/bin/bash

# Installation script for installing shorter bash prompt

echo "installing \"bash_prompt\"..."

TARGET_PATH="$HOME/.local/bin/bash_prompt.py"

mkdir -p $HOME/.local/bin

if [ -e "$TARGET_PATH" ]; then
	echo "  ERROR: target $TARGET_PATH already exists"
	exit 1
fi

echo "  creating symbolic link $PWD/src/main.py -> $TARGET_PATH"

ln -s $PWD/src/main.py $TARGET_PATH

if ! echo $PATH | grep "$HOME/\.local/bin" > /dev/null; then
	echo "  to make shorter bash prompt work you should add \$HOME/.local/bin to \$PATH!"
fi

echo "  add the following lines into your bashrc to make bash prompt working:"
echo ""
echo 'function prompt_command {'
echo '    CWD_TRIMMED="$(/home/alok/.local/bin/bash_prompt.py)"'
echo '}'
echo ''
echo 'PROMPT_COMMAND=prompt_command'
echo 'PS1=\'\[\033[33m\]$CWD_TRIMMED\$\[\033[00m\] \''


# Comment for easy copy:

# function prompt_command {
# 	CWD_TRIMMED="$(/home/alok/.local/bin/bash_prompt.py)"
# }
# 
# PROMPT_COMMAND=prompt_command
# PS1='\[\033[33m\]$CWD_TRIMMED\$\[\033[00m\] '

echo "finished \"bash_prompt\" installation"
