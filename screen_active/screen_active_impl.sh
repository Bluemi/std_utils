#!/bin/bash

echo $$

while true; do
	sleep $((60*5))
	xdotool mousemove_relative 1 0
	xdotool mousemove_relative -- -1 0
done
