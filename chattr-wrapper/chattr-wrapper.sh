#!/bin/bash

for arg in "$@"; do
	if [ -f "$arg" ]; then
		path=$(realpath "$arg")
		if [ "$path" == "/etc/hosts" ]; then
			exit 1
		fi
	fi
done

chattr "${@}"
