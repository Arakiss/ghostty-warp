#!/usr/bin/env bash

# ==============================================
# Complete Environment Setup
# ==============================================
# Sets up Ghostty + Complete Zsh environment
# with all plugins and configurations

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
GHOSTTY_CONFIG_DIR="$HOME/.config/ghostty"

echo "🚀 Complete Environment Setup"
echo "=============================="
echo ""

# ==============================================
# Step 1: Install Dependencies
# ==============================================

echo "📦 Step 1: Dependencies"
echo ""

read -p "Install/update Homebrew dependencies? (y/n) " -n 1 -r
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]; then
    bash "$SCRIPT_DIR/install-deps.sh"
fi

echo ""

# ==============================================
# Step 2: Setup Ghostty Configuration
# ==============================================

echo "🎨 Step 2: Ghostty Configuration"
echo ""

# Backup existing config if present
if [ -d "$GHOSTTY_CONFIG_DIR" ]; then
    BACKUP_DIR="$GHOSTTY_CONFIG_DIR.backup.$(date +%Y%m%d_%H%M%S)"
    echo "📦 Backing up existing config to: $BACKUP_DIR"
    mv "$GHOSTTY_CONFIG_DIR" "$BACKUP_DIR"
fi

# Create config directory
mkdir -p "$GHOSTTY_CONFIG_DIR"

# Copy configuration files
echo "📋 Installing Ghostty configuration..."
rsync -av --exclude='.git' \
    --exclude='README*.md' \
    --exclude='QUICKSTART.md' \
    --exclude='MAC-MINI-SETUP.md' \
    --exclude='CLAUDE.md' \
    --exclude='Brewfile' \
    --exclude='*.sh' \
    --exclude='zshrc-*' \
    "$SCRIPT_DIR/" "$GHOSTTY_CONFIG_DIR/"

# Make scripts executable
chmod +x "$GHOSTTY_CONFIG_DIR"/*.sh 2>/dev/null || true
chmod +x "$GHOSTTY_CONFIG_DIR/gconfig"

echo "✅ Ghostty configuration installed"
echo ""

# ==============================================
# Step 3: Setup Zsh Configuration
# ==============================================

echo "🐚 Step 3: Zsh Configuration"
echo ""

ZSHRC="$HOME/.zshrc"

# Backup .zshrc
if [ -f "$ZSHRC" ]; then
    BACKUP_ZSHRC="$ZSHRC.backup.$(date +%Y%m%d_%H%M%S)"
    echo "📦 Backing up .zshrc to: $BACKUP_ZSHRC"
    cp "$ZSHRC" "$BACKUP_ZSHRC"
fi

# Check if configuration already exists
if grep -q "INTELLIGENT AUTOCOMPLETE & SHELL ENHANCEMENTS" "$ZSHRC" 2>/dev/null; then
    echo "⚠️  Zsh enhancements already present in .zshrc"
    read -p "Replace with new configuration? (y/n) " -n 1 -r
    echo ""
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        # Remove old configuration section
        sed -i.tmp '/# 🚀 INTELLIGENT AUTOCOMPLETE/,/# ==============================================/{//!d;}' "$ZSHRC"
        rm -f "$ZSHRC.tmp"

        # Append new configuration
        echo "" >> "$ZSHRC"
        cat "$SCRIPT_DIR/zshrc-complete.sh" >> "$ZSHRC"
        echo "✅ Zsh configuration updated"
    fi
else
    echo "📋 Adding complete zsh configuration to .zshrc..."
    echo "" >> "$ZSHRC"
    echo "# =============================================" >> "$ZSHRC"
    echo "# Added by ghostty-warp setup" >> "$ZSHRC"
    echo "# $(date)" >> "$ZSHRC"
    echo "# =============================================" >> "$ZSHRC"
    cat "$SCRIPT_DIR/zshrc-complete.sh" >> "$ZSHRC"
    echo "✅ Zsh configuration added"
fi

echo ""

# ==============================================
# Summary
# ==============================================

echo "=============================="
echo "✅ Setup Complete!"
echo "=============================="
echo ""
echo "📝 What was configured:"
echo "   ✅ Ghostty configuration installed"
echo "   ✅ Zsh plugins configured"
echo "   ✅ Shell aliases added"
echo "   ✅ All scripts made executable"
echo ""
echo "🎯 Quick preset commands:"
echo "   gcyber     - Cyberpunk Dev preset"
echo "   gminimal   - Minimal Focus preset"
echo "   gcozy      - Cozy Coding preset"
echo "   gpro       - Professional Elegant preset"
echo ""
echo "🔄 Sync commands:"
echo "   cd $SCRIPT_DIR"
echo "   ./sync-to-repo.sh    - Push changes to GitHub"
echo "   ./sync-from-repo.sh  - Pull changes from GitHub"
echo ""
echo "⚠️  IMPORTANT: Restart your terminal for changes to take effect!"
echo ""
echo "📖 Documentation:"
echo "   README.md           - Main documentation"
echo "   QUICKSTART.md       - Quick reference"
echo "   CLAUDE.md           - AI assistant instructions"
echo ""
