#!/usr/bin/env bash

# ==============================================
# Install Nerd Fonts
# ==============================================
# Automatically installs all Nerd Fonts needed
# for the ghostty-warp presets

set -e

echo "🔤 Installing Nerd Fonts"
echo "======================="
echo ""

# Check if Homebrew is installed
if ! command -v brew &> /dev/null; then
    echo "❌ Homebrew not found!"
    echo "📦 Install Homebrew first:"
    echo '   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'
    exit 1
fi

echo "✅ Homebrew found"
echo ""

# Array of fonts to install
FONTS=(
    "font-jetbrains-mono-nerd-font"
    "font-fira-code-nerd-font"
    "font-cascadia-code-nerd-font"
    "font-iosevka-nerd-font"
)

echo "📦 Installing Nerd Fonts..."
echo ""

for FONT in "${FONTS[@]}"; do
    if brew list --cask "$FONT" &>/dev/null; then
        echo "✅ $FONT already installed"
    else
        echo "📥 Installing $FONT..."
        brew install --cask "$FONT"
    fi
done

echo ""
echo "======================="
echo "✅ All Nerd Fonts installed!"
echo ""
echo "📝 Installed fonts:"
echo "   • JetBrains Mono Nerd Font"
echo "   • Fira Code Nerd Font"
echo "   • Cascadia Code Nerd Font"
echo "   • Iosevka Nerd Font"
echo ""
echo "🎨 These fonts are now available for:"
echo "   • Ghostty presets"
echo "   • Any other terminal emulator"
echo "   • VS Code, IDEs, etc."
echo ""
