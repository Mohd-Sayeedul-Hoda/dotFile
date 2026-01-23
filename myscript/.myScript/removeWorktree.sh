#!/bin/bash

CENTRAL_WORKTREE_DIR="$HOME/.worktree"

# Ensure fzf is installed
if ! command -v fzy &> /dev/null; then
  echo "fzy is not installed. Please install it for better fuzzy finding."
  echo "Falling back to fzf..."
  if ! command -v fzf &> /dev/null; then
    echo "fzf is also not installed. Please install fzf or fzy."
    exit 1
  fi
  FUZZY_FINDER="fzy"
else
  FUZZY_FINDER="fzf"
fi

# Function to remove worktree
remove_worktree() {
  # List all worktrees from central directory
  worktrees=$(find "$CENTRAL_WORKTREE_DIR" -mindepth 2 -maxdepth 2 -type d)

  if [ -z "$worktrees" ]; then
    echo "No worktrees found in $CENTRAL_WORKTREE_DIR"
    exit 1
  fi

  if [ "$FUZZY_FINDER" = "fzf" ]; then
    selected_worktree=$(echo "$worktrees" | fzf --prompt="Select worktree to remove: ")
  else
    selected_worktree=$(echo "$worktrees" | fzy)
  fi

  if [ -z "$selected_worktree" ]; then
    echo "No worktree selected."
    exit 1
  fi

  repo_name=$(basename "$(dirname "$selected_worktree")")
  branch_name=$(basename "$selected_worktree")

  echo "Removing worktree: $selected_worktree"
  if git worktree remove "$selected_worktree"; then
    echo "Worktree removed successfully."
  else
    echo "Failed to remove worktree: $selected_worktree"
    echo "You may need to force remove it with: git worktree remove -f \"$selected_worktree\""
    exit 1
  fi
}

remove_worktree
