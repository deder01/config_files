---
name: save-context
description: Save a structured context dump about the current project and conversation so it can be restored in a new session with /load-context.
argument-hint: [name]
disable-model-invocation: true
allowed-tools: Read, Write, Glob, Grep, Bash(git *), Bash(ls *), Bash(pwd), Bash(date *), Bash(mkdir *)
---

# /save-context — Save Project Context

Save a structured snapshot of the current project and conversation state to
`~/.claude/contexts/` so a future session can pick up where this one left off.

Arguments: `$ARGUMENTS`

## Determine the context name

- If `$ARGUMENTS` is non-empty, use it as the context name (lowercase, hyphens for
  spaces, strip special characters).
- If `$ARGUMENTS` is empty, derive a short name from the project directory or git
  repo name. If ambiguous, ask the user.

The file will be saved to `~/.claude/contexts/{name}.md`.

## Gather context

Review the full conversation history and use tools to verify details. Gather:

1. **Project overview** — What is this project? Tech stack, purpose, repo layout.
   Check for `package.json`, `tsconfig.json`, `CLAUDE.md`, `README.md`, or similar
   files to confirm details. If in a git repo, note the remote URL and current branch.

2. **Current work** — What has the user been working on in this session? Summarize
   the task, feature, or investigation. Be specific: name the feature, the bug, the
   refactor — not just "working on the project."

3. **Key files and areas** — Which files and code areas are most relevant to the
   current work? List absolute paths. Include files that were read, edited, or
   discussed. Group by purpose if there are many.

4. **Recent decisions** — What design choices, trade-offs, or architectural decisions
   were made? Include the reasoning, not just the outcome.

5. **Current state** — What is done, what is in progress, what remains? If there are
   uncommitted changes, note what they are.

6. **Open questions and blockers** — Anything unresolved, uncertain, or blocked on
   external input.

7. **Additional context** — Conventions, gotchas, non-obvious setup steps, relevant
   URLs, anything a fresh session would need to avoid re-discovering.

## Write the context file

Create `~/.claude/contexts/` if it does not exist. Write the context file using this
template:

```
---
name: {name}
project: {absolute path to project root}
saved_at: {ISO 8601 timestamp from `date -u +%Y-%m-%dT%H:%M:%SZ`}
working_directory: {cwd at time of save}
---

# Context: {name}

## Project Overview
{project overview}

## Current Work
{what the user is working on}

## Key Files and Areas
{files and code areas, as absolute paths}

## Recent Decisions
{decisions and rationale}

## Current State
{what's done, in progress, remaining}

## Open Questions and Blockers
{unresolved items}

## Additional Context
{anything else relevant}
```

Write thoughtful, specific prose — not vague summaries. A future Claude session
reading this file should be able to understand the project and resume work without
asking the user to re-explain anything.

If a context file with this name already exists, inform the user and ask whether to
overwrite or pick a different name.

## Confirm

After writing, tell the user the file path and give a brief summary of what was
captured. Mention they can restore it with `/load-context {name}`.
