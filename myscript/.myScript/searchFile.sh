#!/bin/bash

selected_dir=$(fd -H --base-directory="$HOME"  --type file --ignore-file .myScript/ignoreFile.txt | fzf)
if [ -n "$selected_dir" ]; then
    nvim "$HOME/$selected_dir" || { echo "Failed to open the file" >&2; exit 1; }
fi
