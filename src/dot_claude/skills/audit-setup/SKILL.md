---
name: audit-setup
description: This skill should be used when the user asks to "audit my Claude setup", "review my CLAUDE.md", "check my instructions for conflicts", "clean up my setup", "find redundant rules", or "review my skills". Audits Claude instructions, skills, and context files for redundancy, conflicts, and dead weight.
---

# Audit Setup

Audit Claude's full configuration — CLAUDE.md, skills, context files, and any other instruction files — then report on what to cut, what conflicts exist, and provide a cleaned-up CLAUDE.md.

## Process

1. Read `~/.claude/CLAUDE.md` and any project-level `CLAUDE.md` files in scope
2. Glob and read every skill (`skills/*/SKILL.md`) visible in the setup
3. Read any context files (e.g. `context/`, `.claude/`) that contain instructions or preferences
4. For each rule, instruction, and preference found, evaluate:
    - Is this something Claude already does by default without being told?
    - Does this contradict or conflict with another rule elsewhere in the setup?
    - Does this repeat something already covered by a different rule or file?
    - Does this read like a fix for one specific bad output rather than a general improvement?
    - Is this so vague it would be interpreted differently each time (e.g. "be more natural")?

## Output

Provide three sections:

**Cut list** — everything to remove, with a one-line reason per item

**Conflicts** — any contradictions or tensions found between files

**Cleaned CLAUDE.md** — a revised version with dead weight removed, preserving only rules that are specific, non-default, and non-redundant
