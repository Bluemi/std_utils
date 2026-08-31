#!/bin/bash

git commit -e -m "$(git diff --staged | opencode run -m llama-local/Qwen36 "Write a concise conventional commit message based on this diff. If many changes happened find a short title an empty line and bullet-points after that. Output ONLY the raw commit message, no markdown or extra commentary.")"
