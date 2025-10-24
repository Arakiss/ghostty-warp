#!/usr/bin/env bash

# ==============================================
# Ghostty Configuration - Sync TO Repository
# ==============================================
# Syncs changes from ~/.config/ghostty to repository
# Usage: ./sync-to-repo.sh [commit-message]

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
GHOSTTY_CONFIG_DIR="$HOME/.config/ghostty"

echo "🔄 Syncing ghostty config TO repository..."
echo ""

# Check if source directory exists
if [ ! -d "$GHOSTTY_CONFIG_DIR" ]; then
    echo "❌ Error: Ghostty config directory not found: $GHOSTTY_CONFIG_DIR"
    exit 1
fi

# Sync files
echo "📋 Copying files from ~/.config/ghostty to repository..."
rsync -av --delete --exclude='.git' --exclude='README.md' --exclude='setup.sh' --exclude='sync-to-repo.sh' --exclude='sync-from-repo.sh' --exclude='zshrc-aliases.sh' "$GHOSTTY_CONFIG_DIR/" "$SCRIPT_DIR/"

# Git operations
cd "$SCRIPT_DIR"

if [ ! -d ".git" ]; then
    echo "❌ Error: Not a git repository. Run setup first."
    exit 1
fi

# Check for changes
if git diff-index --quiet HEAD --; then
    echo "✅ No changes to commit."
    exit 0
fi

# Add all changes
git add .

# Get commit message
COMMIT_MSG="${1:-Update ghostty configuration}"

# Commit changes
git commit -m "$COMMIT_MSG"

echo ""
echo "✅ Changes committed: $COMMIT_MSG"
echo ""
echo "🚀 Push to GitHub:"
echo "   git push"
echo ""
