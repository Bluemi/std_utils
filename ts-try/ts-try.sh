#!/usr/bin/env bash

TARGET="/tmp/index.ts"

# Ensure the file exists
touch "$TARGET"

# Open in vim
"$EDITOR" "$TARGET"

# If vim exited successfully, execute the code
if [ $? -eq 0 ]; then
    echo -e "\n--- Running TypeScript File ---"
    npx tsx "$TARGET"
fi


