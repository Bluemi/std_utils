#!/bin/bash

PROMPT="Write a concise conventional commit message based on this diff. If many changes happened find a short title an empty line and bullet-points after that. Output ONLY the raw commit message, no markdown or extra commentary. Keep it short. Don't mention every detail."

if git diff --cached --quiet; then
	echo "No files are staged."
else
	git commit -e -m "$(git diff --staged | opencode run -m llama-local/Qwen36 "$PROMPT")"
fi

