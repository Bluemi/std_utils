#!/bin/bash

FILES_TO_CLEAR="/tmp/notebooks_to_clear"

# activate virtual env
VIRTUAL_ENV_NAME="clear_notebook"
if [ ! -f "$HOME/.virtualenvs/$VIRTUAL_ENV_NAME/bin/activate" ]; then
	echo "No virtual env named \"$VIRTUAL_ENV_NAME\". Failed to clear notebooks"
	exit 1
fi

if [ -z "$VIRTUAL_ENV" ] || [ "$VIRTUAL_ENV_NAME" != "$VIRTUAL_ENV" ]; then
	source "$HOME/.virtualenvs/$VIRTUAL_ENV_NAME/bin/activate"
fi

git_root="$(git rev-parse --show-toplevel 2>/dev/null)"
if [ -n "$git_root" ]; then
	cd "$git_root"
	git diff --diff-filter=d --cached --name-only | grep ".ipynb$" > "$FILES_TO_CLEAR"
else
	find . -name "*.ipynb" > "$FILES_TO_CLEAR"
fi

while read file; do
	echo "clearing notebook output for \"$file\""
	python3 -m nbconvert --clear-output --log-level="CRITICAL" "$file"
	if [ -n "$git_root" ]; then
		git add "$file"
	fi
done < "$FILES_TO_CLEAR"

# remove .ipy
find . -type d -name ".ipynb_checkpoints" > "$FILES_TO_CLEAR"

while IFS= read -r -u 10 file; do
	echo "removing ipynb checkpoints \"$file\""
	rm -ir "$file"
done 10< "$FILES_TO_CLEAR"

# remove __pycache__
find . -type d -name "__pycache__" > "$FILES_TO_CLEAR"

while IFS= read -r -u 10 file; do
	echo "removing pycache \"$file\""
	rm -ir "$file"
done 10< "$FILES_TO_CLEAR"

# rm "$FILES_TO_CLEAR"
