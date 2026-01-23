#!/bin/bash

CENTRAL_WORKTREE_DIR="$HOME/.worktree"

if ! command -v fzy &> /dev/null; then
  echo "fzf is not installed. Please install it for better fuzzy finding."
  echo "Falling back to fzy..."
  if ! command -v fzf &> /dev/null; then
    echo "fzy is also not installed. Please install fzf or fzy."
    exit 1
  fi
  FUZZY_FINDER="fzf"
else
  FUZZY_FINDER="fzy"
fi

# Function to get repo name
get_repo_name() {
  repo_path=$(git rev-parse --show-toplevel 2>/dev/null)
  if [ $? -ne 0 ]; then
    echo "Not in a Git repository."
    exit 1
  fi
  basename "$repo_path"
}

# Function to create worktree
create_worktree() {
  repo_name=$(get_repo_name)
  mkdir -p "$CENTRAL_WORKTREE_DIR/$repo_name"

  # List branches
  branches=$(git branch --all | sed 's/*//;s/ //g' | grep -v '^remotes/')

  if [ "$FUZZY_FINDER" = "fzf" ]; then
    selected_branch=$(echo "$branches" | fzf --prompt="Select branch for worktree: ")
  else
    selected_branch=$(echo "$branches" | fzy)
  fi

  if [ -z "$selected_branch" ]; then
    echo "No branch selected."
    exit 1
  fi

  worktree_path="$CENTRAL_WORKTREE_DIR/$repo_name/$selected_branch"

  if git worktree add "$worktree_path" "$selected_branch"; then
    echo "Worktree created: $worktree_path"
    echo "Directory: $worktree_path"
  else
    echo "Failed to create worktree for branch: $selected_branch"
    exit 1
  fi
}

create_worktree
