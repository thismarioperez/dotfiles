---
name: pr-feedback
description: This skill should be used when the user asks to address PR feedback, respond to review comments, or uses /pr-feedback. Identifies the target PR, distills review feedback into discrete items, walks through each with the user, and produces a flexible action plan.
---

# Address PR Feedback

Trigger: user asks to address PR feedback / respond to review comments, or uses /pr-feedback.

Usage: /pr-feedback [PR number or URL]

Arguments: $ARGUMENTS

## Tools

- `AskUserQuestion` — required at steps 1, 5, and 7 to present structured choices to the user.

## Steps

1. Determine the target PR:
    - If `$ARGUMENTS` contains a PR number or URL, use that.
    - Otherwise, run `git rev-parse --abbrev-ref HEAD` and `gh pr view --json number,url,title,state` to find a PR for the current branch.
    - If no PR exists for the current branch:
        - Run `gh pr list --state open --json number,title,headRefName,author,updatedAt --limit 30`.
        - If the list is empty, tell the user "No open PRs found." and stop.
        - Use `AskUserQuestion` to ask which PR to address feedback for. Present each PR as an option with label = title and description = `#<number> · <headRefName>`.
    - If `gh` is not installed or not authenticated, tell the user and stop.

2. Gather all feedback. Run in parallel:
    - `gh pr view <num> --json title,url,state,reviewDecision,isDraft`
    - `gh api repos/{owner}/{repo}/pulls/<num>/reviews` — review summaries (state, body, author)
    - `gh api repos/{owner}/{repo}/pulls/<num>/comments` — inline review comments (path, line, body, in_reply_to_id)
    - `gh api repos/{owner}/{repo}/issues/<num>/comments` — issue-level conversation
    - `gh pr checks <num>` — failing checks worth surfacing
    - For thread resolution state, prefer the GraphQL `pullRequestReviewThreads` query if precision matters; otherwise treat comments on `OUTDATED` diff hunks as likely-resolved.

3. Distill feedback into discrete actionable items:
    - One item per distinct request, question, suggestion, or required change.
    - Collapse near-duplicate comments referencing the same concern into a single item.
    - Drop pure approvals and "LGTM" noise. Surface CHANGES_REQUESTED reviews prominently.
    - For each item capture: `id`, `author`, `where` (file:line or "general"), `quote` (short verbatim excerpt), `category` (blocking / change-requested / suggestion / question / nit).
    - List likely-resolved or outdated threads in a separate section the user can confirm.

4. Show the distilled list as a numbered table:

    ```
    #  where               who        category    summary
    1  src/foo.ts:42       @alice     blocking    null check missing on line 42
    2  general             @bob       question    why drop the retry?
    ...
    ```

    Include the short quote under each row, indented.

5. Walk through items with the user. For each item (or small batch), use `AskUserQuestion` with header = `"Item #<n>"` and these options:

    - **Fix** — make the change (ask for clarification if intent is ambiguous)
    - **Push back** — disagree; draft a reply explaining why
    - **Clarify** — ask the reviewer a question; draft it
    - **Defer** — note as follow-up issue/PR
    - **Skip** — ignore (already addressed, irrelevant, out of scope)

    The "Other" escape hatch covers **Custom** instructions and batched shorthand like "1-3 fix, 4 skip, 5 clarify: <text>". When the user selects "Other", parse their free-text response and apply it.

6. Produce a plan grouped by action:

    ```
    ## Code changes
    - [#1] src/foo.ts:42 — add null check before deref

    ## Replies (no code change)
    - [#2] @bob: <draft reply text>

    ## Follow-ups
    - [#7] open issue: refactor retry policy

    ## Skipped
    - [#5] already addressed in commit abc123
    ```

7. After presenting the plan, use `AskUserQuestion` with header = `"Next step"` and these options:

    - **Confirm** — plan is ready; proceed to step 8
    - **Move item** — move an item to a different section (user specifies via "Other")
    - **Edit reply** — revise a draft reply for a specific item (user specifies via "Other")
    - **Add item** — add a new item the user just thought of

    Loop back to update the plan and re-prompt until the user selects **Confirm**.

8. On confirmation, return the final plan. Do not start executing changes unless the user explicitly asks — the plan is the deliverable.

## Notes

- Always anchor inline items with `path:line` (use `line` or fall back to `original_line`).
- Keep review-summary bodies separate from inline comments when distilling.
- Threads marked resolved or on outdated hunks: list under "Likely resolved" rather than dropping silently.
- If the PR is in draft or already merged/closed, surface that up front before walking through items.
