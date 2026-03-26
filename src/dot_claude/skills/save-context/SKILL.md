---
name: save-context
description: Save the current conversation context to a dated markdown file in .claude/__contexts__/. Use when the user wants to snapshot, save, or capture the current context for future sessions.
user-invokable: true
---

# Save Context

Snapshot the current conversation context to a markdown file so it can be loaded in a future session.

Usage: /save-context [name]

Arguments: $ARGUMENTS

## Steps

1. Parse `$ARGUMENTS` for an optional context name.

2. If no name was provided, synthesize a short descriptive name from the current conversation:

   - Use the main topic, feature, or files being discussed
   - Format as kebab-case (e.g. `samsung-ce-demo-lifecycle`, `auth-refactor`, `api-integration`)
   - Keep it under 5 words

3. Run `date +%Y-%m-%d` to get today's date.

4. Build the filename: `<date>_<name>.md` (e.g. `2026-03-26_samsung-ce-demo-lifecycle.md`)

5. Write the file to `.claude/__contexts__/<filename>` with this structure:

```
---
topic: <name>
date: <date>
---

# <name>

## Summary

<2-4 sentences describing what was being worked on and why>

## Active Files

<bullet list of files opened, discussed, or modified in this session>

## Key Decisions

<bullet list of any choices made, patterns identified, or approaches agreed on — omit section if none>

## Next Steps

<bullet list of what remains to be done — omit section if nothing pending>
```

6. Confirm the file was written by reporting the full path.
