---
name: load-context
description: Load a previously saved context dump to restore project knowledge in a new conversation. Run with no arguments to list available contexts.
argument-hint: [name]
disable-model-invocation: true
allowed-tools: Read, Glob, Bash(ls *), Bash(date *), Bash(git *)
---

# /load-context — Load Saved Project Context

Restore a previously saved context snapshot from `~/.claude/contexts/`.

Arguments: `$ARGUMENTS`

## If no arguments provided

List all available context files:

1. Read the contents of `~/.claude/contexts/` (handle the directory not existing
   gracefully — tell the user no contexts have been saved yet).
2. For each `.md` file found, read its YAML frontmatter to extract `name`, `project`,
   and `saved_at`.
3. Present a formatted table:

   | Name | Project | Saved |
   |------|---------|-------|
   | finance-app | ~/repos/personal-finance | 2026-03-25 |
   | wedding-site | ~/repos/wedding | 2026-03-20 |

4. Tell the user to run `/load-context {name}` to load one.
5. Stop here — do not load anything.

## If a name is provided

1. Look for `~/.claude/contexts/{name}.md`. If not found, check if the name is a
   partial match against available context files. If still not found, list available
   contexts and stop.

2. Read the entire context file.

3. Present the context to the conversation by restating it clearly. Structure the
   output as:

   **Project**: {project path}
   **Saved**: {saved_at timestamp, with relative time like "2 days ago"}
   **Working directory**: {working_directory}

   Then present each section from the context file, preserving the detail and
   specificity of what was saved. Do not summarize or compress — the whole point is
   to restore full context.

4. After presenting, check if the project directory still exists. If it does and it's
   a git repo, note whether there have been git changes since the context was saved
   (compare `saved_at` against recent `git log --oneline --since`). Mention any
   significant changes briefly.

5. Ask the user what they would like to work on, offering to continue where the
   context left off.
