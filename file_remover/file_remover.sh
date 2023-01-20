#!/bin/bash

directory="."

if [ -n "$1" ]; then
	directory="$1"
fi

for filename in *; do
	case "${filename,,}" in
		*.mp4|*.mp3|*.mov|*.webm|*.opus|*.aac)
			silent vlc "$filename"
			;;
		*.jpg|*.png)
			silent gwenview "$filename"
			;;
		*)
			echo "no fitting program found for $filename"
			;;
	esac

	echo -n "remove file (y[es], n[o], q[uit]): "
	read userinput
	case "$userinput" in
		y|yes)
			rm -v "$filename"
			;;
		n|no)
			;;
		q|quit)
			break
			;;
		*)
			echo "invalid userinput: $userinput"
			;;
	esac
done
