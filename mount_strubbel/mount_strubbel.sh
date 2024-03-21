#!/bin/bash

print_help() {
	echo "mount_strubbel.sh [DIR] [-l] [-h]"
	echo "DIR       one of f[oto], a[rchiv], b[runo], m[usik], backup"
	echo "-l -h     list DIR options"
}

case "$1" in
	-l|-h|--help)
		print_help
		exit 0
		;;
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
		print_help
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
