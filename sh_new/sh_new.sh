#!/bin/bash

filename=
execute_permissions=

while true; do
	if [ -z "$1" ]; then
		break
	fi

	case "$1" in
		-x|--execute-permissions)
			execute_permissions=1
			;;
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
	filename="run.sh"
fi

if [ -f "$filename" ]; then
	echo "ERROR: file $filename already exists"
	exit 1
fi

echo "#!/bin/bash" > "$filename"
echo "" >> "$filename"
echo "" >> "$filename"

if [ -n "$execute_permissions" ]; then
	chmod u+x "$filename"
fi

nvim "$filename"
