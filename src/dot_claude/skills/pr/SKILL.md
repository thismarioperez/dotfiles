---
name: pr
description: This skill should be used when the user asks to create a PR, or uses /pr
---

# Create Pull Request

Trigger: user asks to create a PR/pull request, or uses /pr

## Steps

1. Determine the base branch:
    - Default to `master`. If the repo uses `main`, use that instead.
    - Run `git rev-parse --abbrev-ref HEAD` to confirm the current branch.
    - If already on the base branch, tell the user "You're on the base branch — switch to a feature branch first." and stop.

2. Check for uncommitted changes:
    - Run `git status --short` to check.
    - If there are uncommitted changes, tell the user "You have uncommitted changes. Commit or stash them before opening a PR." and stop.

3. Push if needed:
    - Run `git status -sb` to check if the branch is ahead of its remote.
    - If there is no upstream or the branch is ahead, run `git push -u origin HEAD`.

4. Gather context for the PR:
    - Run `git log <base>...HEAD --oneline` to see all commits on this branch.
    - Run `git diff <base>...HEAD --stat` to see changed files.
    - Run `git diff <base>...HEAD` to understand the full scope of changes.

5. Write a PR title and body:
    - **Title**: short (under 70 chars), conventional commit style (`type: description`), lowercase, no period.
    - **Body**: use this structure:

    ```
    ## Summary
    - <bullet points describing what changed and why>

    ## Test plan
    - <bulleted checklist of how to verify the changes>

    ```

6. Show the user the proposed title and body and ask for confirmation before creating the PR.

7. On confirmation, create the PR:

    ```
    gh pr create --title "<title>" --body "$(cat <<'EOF'
    <body>
    EOF
    )"
    ```

8. Return the PR URL to the user.
