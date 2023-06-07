#!/bin/bash

commit_message="minor changes"

if [ -n "$1" ]; then
	commit_message="$1"
fi

git add -A && git commit -m "$commit_message" && git push

