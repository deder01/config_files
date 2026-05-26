#!/usr/bin/env bash
# PreToolUse(Bash) guard: force a confirmation prompt before any gws
# (Google Workspace CLI) WRITE operation. Reads the hook JSON on stdin and
# emits an "ask" permission decision for gws writes; stays silent otherwise
# so reads flow through normal permission handling.

input="$(cat)"
cmd="$(printf '%s' "$input" | jq -r '.tool_input.command // ""')"

# Only act on gws invocations.
case "$cmd" in
  *gws*) ;;
  *) exit 0 ;;
esac

# Strip quoted regions so write-verb words inside --params/--json JSON values
# (e.g. a search query containing "delete") do not cause false matches.
dq="$(printf '%s' "$cmd" | sed "s/'[^']*'//g; s/\"[^\"]*\"//g")"

is_write=0

# Write method names in the command structure.
if printf '%s' "$dq" | grep -qE '\b(send|insert|create|update|patch|delete|trash|untrash|modify|batchUpdate|batchModify|batchDelete|append|clear|copy|move|import|quickAdd|emptyTrash)\b'; then
  is_write=1
fi

# gws "+" write helpers (+read/+triage/+agenda are reads and are NOT listed).
if printf '%s' "$dq" | grep -qE '\+(send|reply|reply-all|forward|insert)\b'; then
  is_write=1
fi

# A request body (--json) implies a POST/PATCH/PUT write.
if printf '%s' "$dq" | grep -qE '(^|[[:space:]])--json([[:space:]]|=|$)'; then
  is_write=1
fi

if [ "$is_write" -eq 1 ]; then
  printf '%s' '{"hookSpecificOutput":{"hookEventName":"PreToolUse","permissionDecision":"ask","permissionDecisionReason":"gws Google Workspace WRITE detected - confirm before executing (CLAUDE.md write-safety rule)."}}'
fi

exit 0
