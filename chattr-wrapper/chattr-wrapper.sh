#!/bin/bash

for arg in "$@"; do
	path=$(realpath "$arg")
	if [ "$path" == "/etc/hosts" ]; then
		exit 1
	fi
done

chattr "${@}"
