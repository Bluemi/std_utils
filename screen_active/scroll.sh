#!/bin/bash

while true; do
	for i in $(seq 1 4); do
		sleep 6
		xdotool key Right
	done
	sleep 0.1
	xdotool key Right
done
