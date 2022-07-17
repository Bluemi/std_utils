#!/bin/bash

case "$1" in
	[Ff]|[Ff]oto)
		dir=Foto
		;;
	[Aa]|[Aa]rchiv17)
		dir=Archiv17
		;;
	[Bb]|[Bb]runo)
		dir=Bruno
		;;
	[Mm]|[Mm]usik)
		dir=Musik
		;;
	Backup|backup)
		dir=Backup
		;;
	*)
		echo "choose between foto, archiv17, bruno"
		exit 1
		;;
esac

if [ -d "$dir"  ]; then
	if [ -z "$(ls -A $dir)" ]; then
		rm -d "$dir"
	else
		if mount | grep "strubbel:/$dir" > /dev/null; then
			fusermount -u "$dir" && rm -d "$dir"
			exit 0
		else
			echo "Directory $dir exists"
			exit 1
		fi
	fi
fi

mkdir "$dir" && sshfs strubbel:/"$dir" "$dir"
