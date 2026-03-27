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

## Dotfiles

- My home directory (`~`) is a dotfiles repo using a bare git repo at `~/.cfg/`
- The alias `config` maps to `git --git-dir=$HOME/.cfg/ --work-tree=$HOME` — use this instead of plain `git` when operating on dotfiles in `~`

## Context saving

- When wrapping up significant work (finishing a feature, reaching a milestone, or if I mention stopping/closing), remind me to run `/save-context` to save a snapshot before ending the session

## Git rules

- Never push to a git remote without asking me first — this applies every time, even if I approved a push earlier in the conversation
