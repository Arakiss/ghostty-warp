#!/usr/bin/env bash

# ==============================================
# Ghostty Configuration - Sync FROM Repository
# ==============================================
# Syncs changes from repository to ~/.config/ghostty
# Usage: ./sync-from-repo.sh

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
GHOSTTY_CONFIG_DIR="$HOME/.config/ghostty"

echo "🔄 Syncing ghostty config FROM repository..."
echo ""

# Pull latest changes
cd "$SCRIPT_DIR"

if [ ! -d ".git" ]; then
    echo "❌ Error: Not a git repository."
    exit 1
fi

echo "📥 Pulling latest changes from GitHub..."
git pull

# Sync files
echo "📋 Copying files from repository to ~/.config/ghostty..."
rsync -av --exclude='.git' --exclude='README.md' --exclude='setup.sh' --exclude='sync-to-repo.sh' --exclude='sync-from-repo.sh' --exclude='zshrc-aliases.sh' "$SCRIPT_DIR/" "$GHOSTTY_CONFIG_DIR/"

# Make scripts executable
chmod +x "$GHOSTTY_CONFIG_DIR"/*.sh
chmod +x "$GHOSTTY_CONFIG_DIR/gconfig"

echo ""
echo "✅ Configuration synced successfully!"
echo "🔄 Restart Ghostty to apply changes."
echo ""
