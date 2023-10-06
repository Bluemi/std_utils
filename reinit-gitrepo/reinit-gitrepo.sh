#!/bin/bash

set -e

REPO_NAME="$(basename "$PWD")"
BACKUP_DIR="/tmp/reinit_gitrepo/$REPO_NAME"

mkdir -p "/tmp/reinit_gitrepo"

echo "creating backup at \"$BACKUP_DIR\""
cp -r . "$BACKUP_DIR"

git init
git remote add origin "git@github.com:Bluemi/$REPO_NAME.git"
git fetch origin
if git branch -a | grep "master"; then
	git reset --hard origin/master
else
	git reset --hard origin/main
fi

echo "######### showing diff between backup and original #########"
diff -r . "$BACKUP_DIR"
