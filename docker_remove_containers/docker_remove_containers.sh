#!/bin/bash

CONTAINERS=$(docker ps -a -q)
if [ -n "$CONTAINERS" ]; then
	echo "stopping containers:"
	docker stop -t 1 "$CONTAINERS"
fi

CONTAINERS=$(docker ps -a -q)
if [ -n "$CONTAINERS" ]; then
	echo "removing containers:"
	docker rm $(docker ps -a -q)
fi
