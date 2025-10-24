#!/usr/bin/env bash

# ==============================================
# Ghostty Configuration - Setup Script
# ==============================================
# Installs ghostty configuration on a new machine
# Usage: ./setup.sh

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
GHOSTTY_CONFIG_DIR="$HOME/.config/ghostty"
REPO_NAME="ghostty-warp"

echo "🚀 Ghostty Configuration Setup"
echo "=============================="
echo ""

# Check if ghostty config directory exists
if [ -d "$GHOSTTY_CONFIG_DIR" ]; then
    echo "⚠️  Ghostty config directory already exists: $GHOSTTY_CONFIG_DIR"
    read -p "Do you want to backup and replace it? (y/n) " -n 1 -r
    echo ""
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        BACKUP_DIR="$GHOSTTY_CONFIG_DIR.backup.$(date +%Y%m%d_%H%M%S)"
        echo "📦 Backing up existing config to: $BACKUP_DIR"
        mv "$GHOSTTY_CONFIG_DIR" "$BACKUP_DIR"
    else
        echo "❌ Setup cancelled. Existing configuration preserved."
        exit 0
    fi
fi

# Create config directory
echo "📁 Creating ghostty config directory..."
mkdir -p "$GHOSTTY_CONFIG_DIR"

# Copy all configuration files
echo "📋 Copying configuration files..."
rsync -av --exclude='.git' --exclude='README.md' --exclude='setup.sh' --exclude='sync-to-repo.sh' --exclude='sync-from-repo.sh' --exclude='zshrc-aliases.sh' "$SCRIPT_DIR/" "$GHOSTTY_CONFIG_DIR/"

# Make scripts executable
chmod +x "$GHOSTTY_CONFIG_DIR"/*.sh
chmod +x "$GHOSTTY_CONFIG_DIR/gconfig"

echo ""
echo "✅ Configuration installed successfully!"
echo ""
echo "📝 Next steps:"
echo "   1. Add aliases to your ~/.zshrc:"
echo "      cat ~/Projects/personal/dotfiles/ghostty-warp/zshrc-aliases.sh >> ~/.zshrc"
echo "      source ~/.zshrc"
echo ""
echo "   2. Restart Ghostty to apply changes"
echo ""
echo "   3. Try quick presets:"
echo "      gcyber    - Cyberpunk Dev preset"
echo "      gminimal  - Minimal Focus preset"
echo "      gcozy     - Cozy Coding preset"
echo "      gpro      - Professional Elegant preset"
echo ""
echo "🔄 To sync changes back to repo:"
echo "   cd ~/Projects/personal/dotfiles/ghostty-warp"
echo "   ./sync-to-repo.sh"
echo ""
