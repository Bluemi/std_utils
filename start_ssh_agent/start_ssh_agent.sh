#!/bin/bash

if ! pidof ssh-agent; then
	eval "$(ssh-agent -s)"
fi
ssh-add "$HOME/.ssh/htw01_ed25519"
