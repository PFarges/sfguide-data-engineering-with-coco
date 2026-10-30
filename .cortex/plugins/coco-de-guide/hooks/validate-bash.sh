#!/bin/bash
# validate-bash.sh — PreToolUse hook for the bash tool.
# Blocks dbt commands that target production (--target prod / --target=prod / -t prod).
INPUT=$(cat)

if command -v jq >/dev/null 2>&1; then
  CMD=$(echo "$INPUT" | jq -r '.tool_input.command // empty')
else
  CMD="$INPUT"
fi

if echo "$CMD" | grep -Eq '(^|[^[:alnum:]_])dbt([^[:alnum:]_]|$)' &&
   echo "$CMD" | grep -Eq '(--target[[:space:]=]+|-t[[:space:]]+)["'"'"']?prod([^[:alnum:]_]|$)'; then
  echo "Blocked: direct production dbt runs (--target prod) are not allowed. Use the CI/CD pipeline to deploy to production instead." >&2
  exit 2
fi

exit 0
