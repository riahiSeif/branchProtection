#!/bin/bash
# Block pushes to protected branches
protected_branch="protectedBranch"  # Replace with your branch name
current_branch=$(git rev-parse --abbrev-ref HEAD)

if [ "$current_branch" == "$protected_branch" ]; then
  echo "❌ Error: Direct push to $protected_branch is not allowed. Use a pull request."
  exit 1
fi