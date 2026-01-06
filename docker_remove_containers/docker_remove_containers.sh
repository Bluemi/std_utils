#!/bin/bash

CONTAINERS=$(docker ps -a -q)
if [ -n "$CONTAINERS" ]; then
	docker stop -t 1 "$CONTAINERS"
fi

CONTAINERS=$(docker ps -a -q)
if [ -n "$CONTAINERS" ]; then
	docker rm $(docker ps -a -q)
fi
