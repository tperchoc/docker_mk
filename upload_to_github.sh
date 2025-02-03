#!/bin/bash

# Define variables
REPO_DIR=~/Bureau/docker_mk
BRANCH=main
COMMIT_MESSAGE="Automated commit: Synchronize local changes with GitHub"

# Navigate to the repository directory
cd $REPO_DIR || { echo "Failed to navigate to repository directory"; exit 1; }

# Check if the remote URL is set correctly
REMOTE_URL=$(git remote get-url origin)
EXPECTED_URL="git@github.com:tperchoc/docker_mk.git"

if [ "$REMOTE_URL" != "$EXPECTED_URL" ]; then
  echo "Setting the correct remote URL"
  git remote set-url origin $EXPECTED_URL
fi

# Pull the latest changes from the remote repository
git pull origin $BRANCH --rebase || { echo "Failed to pull latest changes"; exit 1; }

# Add all changes to the staging area
git add . || { echo "Failed to add changes to staging area"; exit 1; }

# Commit the changes
git commit -m "$COMMIT_MESSAGE" || { echo "Failed to commit changes"; exit 1; }

# Push the changes to the remote repository
git push origin $BRANCH || { echo "Failed to push changes to remote repository"; exit 1; }

# Print a success message
echo "Changes have been successfully pushed to GitHub."