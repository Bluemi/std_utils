#!/bin/bash

REPO_NAME="$(basename "$PWD")"

git init
git remote add origin "git@github.com:Bluemi/$REPO_NAME.git"
git fetch origin
if git branch -a | grep "master"; then
	git reset --hard origin/master
else
	git reset --hard origin/main
fi
