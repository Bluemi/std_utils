#!/bin/bash

OUTDIR="pages"

if [ -e "$OUTDIR" ]; then
	echo "$OUTDIR already exists. Exiting."
	exit 1
fi

index=1
xdotool key super+3  # switch to firefox

while [ "$index" -lt 125 ]; do
	filename=$(printf "page%04d.jpg" "$index")
	echo "capturing $filename"
	spectacle -f -b -n -o "pages/$filename"
	xdotool key Right
	sleep 0.1
	index=$((index + 1))
done

# convert pages/*.jpg Title.pdf
