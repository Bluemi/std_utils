#!/bin/bash

EXCLUDE_FILE="$HOME/.local/etc/backup_now/excludes.txt"

if [ -d "$HOME/Backup" ]; then
	mount_strubbel backup  # unmount
fi
rsync -ah --delete --info=progress2 --exclude-from "$EXCLUDE_FILE" "$HOME/" "strubbel:/volume3/Backup/BlackBoxBackup/"
