#!/bin/bash

filename=

while true; do
	if [ -z "$1" ]; then
		break
	fi

	case "$1" in
		*)
			if [ -n "$filename" ]; then
				echo "To many positional arguments: $1"
				exit 1
			fi
			filename="$1"
			;;
	esac
	shift
done

if [ -z "$filename" ]; then
	filename="main.py"
fi

if [ -f "$filename" ]; then
	echo "ERROR: file $filename already exists"
	exit 1
fi

echo "#!/usr/bin/env python3" > "$filename"
echo "" >> "$filename"
echo "" >> "$filename"
echo "def main():" >> "$filename"
echo "    print('hello world!')" >> "$filename"
echo "" >> "$filename"
echo "" >> "$filename"
echo "if __name__ == '__main__':" >> "$filename"
echo "    main()" >> "$filename"
echo "" >> "$filename"

chmod u+x "$filename"

open-editor "$filename"
