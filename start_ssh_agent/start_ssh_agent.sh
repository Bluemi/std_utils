#!/bin/bash

eval "$(ssh-agent -s)"
ssh-add "$HOME/.ssh/htw01_ed25519"
