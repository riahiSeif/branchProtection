# Git: Block Pushes to Protected Branches
This guide explains how to use a Git pre-push hook to prevent direct pushes to specific branches, like protectedBranch. This ensures better workflow management by enforcing pull requests for critical branches.
## 📖 Steps to Set Up the Pre-Push Hook
## 1️⃣ Navigate to the Git Hooks Directory
Run the following command in your repository:


```
 cd .git/hooks
```

## 2️⃣ Create or Edit the pre-push Hook File
Open or create the pre-push file for editing:
```
nano pre-push
```
## 3️⃣ Add the Pre-Push Script
Copy the following script into the pre-push file:
```
#!/bin/bash
# Block pushes to protected branches
protected_branch="protectedBranch"  # Replace with your branch name
current_branch=$(git rev-parse --abbrev-ref HEAD)

if [ "$current_branch" == "$protected_branch" ]; then
  echo "❌ Error: Direct push to $protected_branch is not allowed. Use a pull request."
  exit 1
fi
```
What This Script Does:

* protected_branch: Replace "protectedBranch" with the name of your branch to protect, e.g., main or develop.
* git rev-parse --abbrev-ref HEAD: Fetches the current branch name.
* If the current branch matches protected_branch, the script prevents the push and displays an error message.
## 4️⃣ Go Back to the Repository Root
Return to the repository’s root directory:
```
cd ../..
```
## 5️⃣ Make the Hook Executable
Enable the script by making it executable:
```
chmod +x .git/hooks/pre-push
```
