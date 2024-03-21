#!/bin/bash

pid=$(pgrep -f "screen-active-impl")

if [ -z "$pid" ]; then
	screen-active-impl &
	echo "screen-active started"
else
	kill -s 15 "$pid"
	echo "screen-active stopped with pid $pid"
fi
