Git Hook: Block Pushes to Protected Branches
This guide explains how to use a Git pre-push hook to prevent direct pushes to specific branches, like protectedBranch. This ensures better workflow management by enforcing pull requests for critical branches.

📖 Steps to Set Up the Pre-Push Hook
1️⃣ Navigate to the Git Hooks Directory
Run the following command in your repository:

bash
Copier le code
cd .git/hooks
Explanation: The .git/hooks directory contains Git hook scripts that are triggered by various Git actions.

2️⃣ Create or Edit the pre-push Hook File
Open or create the pre-push file for editing:

bash
Copier le code
nano pre-push
Explanation: Use a text editor like nano to write the logic for your Git hook.

3️⃣ Add the Pre-Push Script
Copy the following script into the pre-push file:

bash
Copier le code
#!/bin/bash
# Block pushes to protected branches
protected_branch="protectedBranch"  # Replace with your branch name
current_branch=$(git rev-parse --abbrev-ref HEAD)

if [ "$current_branch" == "$protected_branch" ]; then
  echo "❌ Error: Direct push to $protected_branch is not allowed. Use a pull request."
  exit 1
fi
What This Script Does:

protected_branch: Replace "protectedBranch" with the name of your branch to protect, e.g., main or develop.
git rev-parse --abbrev-ref HEAD: Fetches the current branch name.
If the current branch matches protected_branch, the script prevents the push and displays an error message.
4️⃣ Go Back to the Repository Root
Return to the repository’s root directory:

bash
Copier le code
cd ../..
Explanation: Exits the .git/hooks directory.

5️⃣ Make the Hook Executable
Enable the script by making it executable:

bash
Copier le code
chmod +x .git/hooks/pre-push
Explanation: The chmod +x command grants execution permissions to the pre-push script.

⚙️ How It Works
Whenever you attempt to push changes, Git will run this hook:

If the current branch matches the protected branch, the push is blocked with the message:
bash
Copier le code
❌ Error: Direct push to protectedBranch is not allowed. Use a pull request.
If the current branch is not protected, the push proceeds as usual.
📝 Example Use Case
Let’s say your protected_branch is set to main:

Allowed Push:
Pushing from a branch like feature/login:
bash
Copier le code
git push origin feature/login
Blocked Push:
Attempting to push directly to main:
bash
Copier le code
git push origin main
Output:
vbnet
Copier le code
❌ Error: Direct push to main is not allowed. Use a pull request.
🛠️ Customization
Replace "protectedBranch" with the branch you want to protect.
Extend the script to protect multiple branches by adding additional checks.
By following this guide, you can enforce better version control practices and protect critical branches from direct changes.
