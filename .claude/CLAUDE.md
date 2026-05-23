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

## MCP servers

- For Gmail, always use the npm `gmail` MCP server (`@gongrzhe/server-gmail-autoauth-mcp`), NOT the built-in `claude.ai Gmail` — the built-in one has persistent auth issues. If both are available, prefer the npm server's tools.
- Install: `claude mcp add gmail -s user -- npx -y @gongrzhe/server-gmail-autoauth-mcp`

## Email rules

- Never send an email without explicit user approval — drafting is fine, sending requires confirmation every time
- Always use `htmlBody` with `mimeType: "text/html"` when drafting or sending emails — plain text mode causes hard line breaks at ~76 characters (RFC 2822 wrapping), creating ugly mid-sentence breaks in delivered emails
- Wrap each paragraph in `<p>` tags; do not use `<br>` for paragraph spacing

## Git rules

- Never push to a git remote without asking me first — this applies every time, even if I approved a push earlier in the conversation
