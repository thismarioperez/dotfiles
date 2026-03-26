---
description: Load a saved context from the local project's .claude/__contexts__/ directory into the current session.
---

# Load Context

Load a previously saved context snapshot into this session.

Usage: /load-context [query]

Arguments: $ARGUMENTS

## Steps

1. List all files in `.claude/__contexts__/` using the Glob tool with pattern `.claude/__contexts__/*.md`.

2. If no files are found, tell the user "No saved contexts found in `.claude/__contexts__/`." and stop.

3. Parse each filename to extract the date and name. Filenames follow the pattern `<date>_<name>.md`.

4. If `$ARGUMENTS` is provided, filter the list to files whose name contains the argument as a substring (case-insensitive). If the filter yields no results, tell the user "No contexts matched '$ARGUMENTS'." and stop.

5. Present the matched contexts as a numbered list, sorted by date descending (newest first), with each entry showing:
   - The number
   - The date
   - The name (human-readable, dashes replaced with spaces)
   - A one-line summary from the file's `## Summary` section if readable

   Example:
   ```
   1. 2026-03-26 — samsung ce demo lifecycle
      Working on the lifecycle hooks for the Samsung CE demo app.
   2. 2026-03-20 — auth refactor
      Refactoring the auth middleware to meet new compliance requirements.
   ```

6. Ask the user to pick a context by number, type a search term to filter further, or press Enter to cancel.

7. Read the selected context file in full and output its contents verbatim in a fenced code block, then summarize the key details (topic, active files, decisions, next steps) so they are loaded into the current session's working memory.

8. Confirm: "Context '<name>' loaded. Continuing from where you left off."
