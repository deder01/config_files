# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) as a user-level config across all my projects.

## About me

- Personal computer used for personal projects
- Primarily work in TypeScript building personal apps
- Often trying out new things / experimenting

## Preferences

- Keep responses concise — I'm comfortable reading code
- Default to TypeScript for new projects
- Prefer modern ES syntax (const, arrow functions, async/await)

## Python

- Before running Python scripts, check for a `.venv` directory in the project and activate it (`source .venv/bin/activate`) — system Python often lacks required packages

## Dotfiles

- My home directory (`~`) is a dotfiles repo using a bare git repo at `~/.cfg/`
- The alias `config` maps to `git --git-dir=$HOME/.cfg/ --work-tree=$HOME` — use this instead of plain `git` when operating on dotfiles in `~`

## Context saving

- When wrapping up significant work (finishing a feature, reaching a milestone, or if I mention stopping/closing), remind me to run `/save-context` to save a snapshot before ending the session

## Google Workspace (gws CLI)

- For all Google Workspace services — Gmail, Drive, Sheets, Calendar, Docs — use the `gws` CLI (`@googleworkspace/cli`) via Bash. Do NOT use the `claude.ai` MCP connectors; they've been removed because their Gmail connector lacks the `gmail.modify` scope, so archive/label/write operations fail with "insufficient authentication scopes".
- ⚠️ WRITE OPERATIONS ALWAYS REQUIRE MY EXPLICIT CONFIRMATION FIRST. Before running ANY gws command that creates, sends, modifies, or deletes data — including `send`, `insert`, `create`, `update`, `patch`, `delete`, `trash`, `untrash`, `modify`, `batchUpdate`, `append`, `clear`, `copy`, `move`, and the `+send`/`+reply`/`+reply-all`/`+forward`/`+insert` helpers — across Gmail, Drive, Sheets, Calendar, or Docs, you MUST state exactly what you are about to do and WAIT for my explicit go-ahead. This applies EVEN WHEN I requested the action in the same message — ask first, every time. Read-only commands (`list`, `get`, `+read`, `+triage`, `+agenda`) need NO confirmation.
- OAuth2 is already configured (`gws auth status` to verify); credentials live in `~/.config/gws/`. Granted scopes: drive, spreadsheets, gmail.modify, calendar, documents.
- Command shape: `gws <service> <resource> [sub-resource] <method> --params '<JSON>' [--json '<body>'] --format json`
  - Read mail: `gws gmail users messages list --params '{"userId":"me","maxResults":10}'`
  - Read sheet: `gws sheets spreadsheets values get --params '{"spreadsheetId":"ID","range":"A1:D20"}'`
  - Write sheet: `gws sheets spreadsheets values update --params '{"spreadsheetId":"ID","range":"A1","valueInputOption":"USER_ENTERED"}' --json '{"values":[["x"]]}'`
- Gmail has ergonomic `+` helpers: `+triage` (unread summary), `+read`, `+send`, `+reply`, `+reply-all`, `+forward`.
- gws prints `Using keyring backend: keyring` to stderr — redirect `2>/dev/null` when parsing JSON from stdout.

## Email rules

- Never send an email without explicit user approval — drafting is fine, sending requires confirmation every time. Use `--draft` to draft; omit it to send.
- Send/reply via the gws Gmail helpers with `--html` so the body renders as HTML (plain text causes hard line breaks at ~76 characters / RFC 2822 wrapping, creating ugly mid-sentence breaks):
  - New: `gws gmail +send --to a@b.com --subject '...' --body '<p>...</p>' --html [--draft]`
  - Reply (auto-threads): `gws gmail +reply --message-id <ID> --body '<p>...</p>' --html [--draft]`
- Wrap each paragraph in `<p>` tags; do not use `<br>` for paragraph spacing. With `--html`, use fragment tags only — no `<html>`/`<body>` wrapper.

## Git rules

- Never push to a git remote without asking me first — this applies every time, even if I approved a push earlier in the conversation
