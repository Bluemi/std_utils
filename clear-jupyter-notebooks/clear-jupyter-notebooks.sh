#!/bin/bash

NOTEBOOKS_TO_CLEAR="/tmp/notebooks_to_clear"

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
	git diff --diff-filter=d --cached --name-only | grep ".ipynb$" > "$NOTEBOOKS_TO_CLEAR"
else
	find -name "*.ipynb" > "$NOTEBOOKS_TO_CLEAR"
fi

while read file; do
	echo "clearing notebook output for \"$file\""
	python3 -m nbconvert --clear-output --log-level="CRITICAL" "$file"
	git add "$file"
done < "$NOTEBOOKS_TO_CLEAR"

# rm "$NOTEBOOKS_TO_CLEAR"
