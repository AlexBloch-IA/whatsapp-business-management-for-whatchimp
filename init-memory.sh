#!/usr/bin/env bash
# init-memory.sh — create the workspace memory files this skill expects.
#
# Usage:
#   ./init-memory.sh                                 # prompts for workspace dir
#   ./init-memory.sh ~/.openclaw/workspace/whatsapp-acme  # non-interactive
#
# Creates:
#   <workspace>/memory/
#     ├── wa-alerts-sent.md
#     ├── wa-blacklist.md
#     ├── wa-clients-known.md
#     ├── wa-crm-state.md
#     ├── wa-incidents.md
#     ├── wa-learnings.md
#     ├── wa-recaps.md
#     ├── wa-state.md
#     └── wa-template-log.md
#
# Idempotent: existing files are left untouched.

set -euo pipefail

WORKSPACE_DIR="${1:-}"

if [[ -z "${WORKSPACE_DIR}" ]]; then
  read -r -p "Workspace dir (e.g. ~/.openclaw/workspace/whatsapp-acme): " WORKSPACE_DIR
fi

WORKSPACE_DIR="${WORKSPACE_DIR/#\~/$HOME}"
MEMORY_DIR="${WORKSPACE_DIR}/memory"

mkdir -p "${MEMORY_DIR}"

FILES=(
  wa-alerts-sent.md
  wa-blacklist.md
  wa-clients-known.md
  wa-crm-state.md
  wa-incidents.md
  wa-learnings.md
  wa-recaps.md
  wa-state.md
  wa-template-log.md
)

created=0
skipped=0
for f in "${FILES[@]}"; do
  if [[ -f "${MEMORY_DIR}/${f}" ]]; then
    echo "↩  ${f} already exists — left untouched"
    skipped=$((skipped + 1))
  else
    {
      echo "# ${f%.md}"
      echo
      echo "<!-- Appended by whatsapp-business-management-for-whatchimp crons. -->"
    } > "${MEMORY_DIR}/${f}"
    echo "✅ ${f} created"
    created=$((created + 1))
  fi
done

echo
echo "Done. ${created} created, ${skipped} skipped."
echo "Memory dir: ${MEMORY_DIR}"
