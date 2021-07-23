#!/bin/bash

# screen -D -R -S cmus /home/alok/.local/bin/mount_cmus.sh
tmux -u -2 new-session -A -D -s cmus /home/alok/.local/bin/mount_cmus.sh
