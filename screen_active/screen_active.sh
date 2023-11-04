#!/bin/bash

PID_FILE="$HOME/.local/share/screen_active/pid_file"
PID_DIR="$(dirname "$PID_FILE")"

mkdir -p "$PID_DIR"

if [ -f "$PID_FILE" ]; then
	# screen-active is running -> stop it
	pid="$(cat "$PID_FILE")"
	kill -s 15 "$pid"
	rm "$PID_FILE"
	echo "screen-active stopped"
else
	screen-active-impl &
	echo $! > "$PID_FILE"
	echo "screen-active started"
fi
