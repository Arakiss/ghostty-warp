#!/usr/bin/env bash

# ==============================================
# Install All Dependencies
# ==============================================
# Installs all Homebrew packages and sets up
# Oh My Zsh for complete environment

set -e

echo "🚀 Installing Complete Ghostty + Zsh Environment"
echo "================================================"
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

# Install packages from Brewfile
echo "📦 Installing Homebrew packages..."
echo ""

if [ -f "Brewfile" ]; then
    brew bundle --file=Brewfile
    echo ""
    echo "✅ Homebrew packages installed"
else
    echo "⚠️  Brewfile not found, installing packages manually..."

    brew install gh git
    brew install zsh-autosuggestions zsh-syntax-highlighting
    brew install fzf fd
    brew install zoxide atuin
    brew install starship
    brew install mise fnm

    echo "✅ Packages installed"
fi

echo ""

# Install Oh My Zsh if not present
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "📦 Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    echo "✅ Oh My Zsh installed"
else
    echo "✅ Oh My Zsh already installed"
fi

echo ""

# Setup fzf
echo "🔧 Setting up fzf..."
if command -v fzf &> /dev/null; then
    $(brew --prefix)/opt/fzf/install --key-bindings --completion --no-update-rc
    echo "✅ fzf configured"
fi

echo ""

# Install Bun (optional)
if ! command -v bun &> /dev/null; then
    echo "📦 Bun not found. Install with:"
    echo "   curl -fsSL https://bun.sh/install | bash"
    echo ""
fi

# Check for Ghostty
if ! command -v ghostty &> /dev/null; then
    echo "⚠️  Ghostty not found. Install from:"
    echo "   https://ghostty.org"
    echo ""
fi

echo "================================================"
echo "✅ Dependencies installed successfully!"
echo ""
echo "📝 Next steps:"
echo "   1. Run ./setup-complete.sh to configure everything"
echo "   2. Restart your terminal"
echo "   3. Enjoy your enhanced environment!"
echo ""
