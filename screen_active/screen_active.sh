#!/bin/bash

while true; do
	sleep $((60*5))
	xdotool mousemove_relative 10 0
	sleep $((60*5))
	xdotool mousemove_relative -- -10 0
done
