#!/usr/bin/env bash
# Installs the Chiron FDE Dojo agent persona into a dedicated project folder.
# Safe: does not touch any existing global OpenCode config.
set -e

TARGET_DIR="${1:-$HOME/fde-dojo}"
REPO_RAW_URL="https://raw.githubusercontent.com/mchellappa/chiron/main/agent/chiron-fde-dojo.md"

echo "FDE Dojo - Chiron agent installer"
echo "Target folder: $TARGET_DIR"

mkdir -p "$TARGET_DIR"

if command -v curl >/dev/null 2>&1; then
  curl -fsSL "$REPO_RAW_URL" -o "$TARGET_DIR/AGENTS.md"
elif command -v wget >/dev/null 2>&1; then
  wget -q "$REPO_RAW_URL" -O "$TARGET_DIR/AGENTS.md"
else
  echo "Error: need curl or wget installed." >&2
  exit 1
fi

echo ""
echo "Done. Chiron's persona is now at: $TARGET_DIR/AGENTS.md"
echo ""
echo "To start your first session:"
echo "  cd \"$TARGET_DIR\""
echo "  opencode"
echo ""
echo "Then say: Chiron, I'm starting the FDE Dojo, Track A Unit 0."
