#!/bin/bash

# Define variables
REPO_DIR=~/Bureau/docker_mk
BRANCH=main
COMMIT_MESSAGE="Automated commit: Synchronize local changes with GitHub"

# Navigate to the repository directory
cd $REPO_DIR

# Pull the latest changes from the remote repository
git pull origin $BRANCH --rebase

# Add all changes to the staging area
git add .

# Commit the changes
git commit -m "$COMMIT_MESSAGE"

# Push the changes to the remote repository
git push origin $BRANCH

# Print a success message
echo "Changes have been successfully pushed to GitHub."