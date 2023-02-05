#!/bin/bash

from=wav
to=mp3
verbose=

while [ -n "$1" ]; do
	case "$1" in
		--from)
			shift
			if [ -z "$1" ]; then
				echo "argument for --from is needed"
				exit 1
			fi
			from="$1"
			shift
			;;
		--to)
			shift
			if [ -z "$1" ]; then
				echo "argument for --to is needed"
				exit 1
			fi
			to="$1"
			shift
			;;
		-v|--verbose)
			verbose=1
			shift
			;;
		*)
			echo "got unknown argument: $1"
			exit 1
			;;
	esac
done


filenames=()
num_files=0
while IFS='' read -r -d '' filename; do
	filenames[$num_files]="$filename"
	num_files=$[$num_files + 1]
done < <(find . -name "*.${from}" -print0)

counter=1
for filename in "${filenames[@]}"; do
	if [ -n "$verbose" ]; then
		echo "[$counter/$num_files]: $filename -> ${filename%.$from}.$to"
	fi
	ffmpeg -i "$filename" "${filename%.$from}.$to" 2>/dev/null >/dev/null && rm "$filename"
	counter=$[$counter + 1]
done
