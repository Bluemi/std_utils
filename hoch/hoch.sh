#!/bin/bash

commit_message="minor changes"

if [ -n "$1" ]; then
	commit_message="$1"
fi

echo "$commit_message"

# git add -A && git commit -m "$commit_message" && git push

