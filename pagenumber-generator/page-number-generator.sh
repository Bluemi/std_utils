#!/bin/bash


NUM_PAGES=33

# setup
i3-msg workspace 3
xdotool mousemove 1600 900
xdotool click 1
xdotool key ctrl+c

# write page number
xdotool mousemove 1600 920

for page_number in $(seq 2 "$NUM_PAGES"); do
	xdotool key Page_Down
	xdotool key ctrl+v
	xdotool click 1
	xdotool click 1
	xdotool key ctrl+a
	xdotool type "$page_number / $NUM_PAGES"
done
