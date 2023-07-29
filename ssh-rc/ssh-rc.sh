#!/bin/bash

if [ -z "$1" ]; then
	echo -e "usage:\n\tssh-rc <hostname>"
	exit 1
fi

ssh -YC "$1" -X x2x -to :0.0 -west
