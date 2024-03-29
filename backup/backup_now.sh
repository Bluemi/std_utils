#!/bin/bash

EXCLUDE_FILE="$HOME/.local/etc/backup_now/excludes.txt"

if [ -d "$HOME/Backup" ]; then
	mount_strubbel backup  # unmount
fi

case $HOSTNAME in
	blackbox)
		dir="BlackBoxBackup"
		;;
	lightbox)
		dir="LightBoxBackup"
		;;
	*)
		echo "ERROR: unknown host"
		exit 1
		;;
esac

rsync -ah --delete --itemize-changes --out-format="%t %o %l %i %f" --exclude-from "$EXCLUDE_FILE" "$HOME/" "strubbel:/volume3/Backup/$dir/" | format_backup_output.py
