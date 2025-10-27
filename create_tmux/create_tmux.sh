#!/bin/bash

SESSION="brunos_session"

if ! tmux has-session -t "$SESSION" 2>/dev/null; then
  tmux new-session -d -s "$SESSION" -n sh1
  tmux new-window -t "$SESSION" -n sh2
  tmux new-window -t "$SESSION" -n sh3
  tmux new-window -t "$SESSION" -n root
  tmux new-window -t "$SESSION" -n btop
fi

tmux attach-session -t "$SESSION"

