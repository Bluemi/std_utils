#!/bin/bash

EXCLUDE_FILE="$HOME/.local/etc/backup_now/excludes.txt"
TARGET_DIR="./Backup/BlackBoxBackup"

if [ ! -d "$TARGET_DIR" ]; then
	mount_strubbel backup
fi
rsync -ah --delete --info=progress2 --exclude-from "$EXCLUDE_FILE" $HOME "$TARGET_DIR"
if [ -d "$TARGET_DIR" ]; then
	mount_strubbel backup  # unmount
fi
