# 🚀 Ghostty Configuration - Dotfiles

Complete configuration system for **Ghostty** terminal with bidirectional sync between MacBook Pro and Mac Mini.

## ✨ Features

- **4 Optimized Presets**: Cyberpunk Dev, Minimal Focus, Cozy Coding, Professional Elegant
- **5 Premium Themes**: Tokyo Night, Catppuccin Mocha, Dracula, Nord, Gruvbox
- **4 Pro Fonts**: JetBrains Mono, Fira Code, Cascadia Code, Iosevka
- **Interactive Switcher**: Quick preset/theme/font switching
- **Bidirectional Sync**: Easy sync between machines via GitHub
- **Auto-install**: One-command setup on new machines

## 🚀 Quick Start

### First-Time Setup (New Machine)

```bash
# Clone repository
cd ~/Projects/personal/dotfiles
gh repo clone Arakiss/ghostty-config
cd ghostty-config

# Run setup
chmod +x setup.sh
./setup.sh

# Add aliases to shell
cat zshrc-aliases.sh >> ~/.zshrc
source ~/.zshrc

# Restart Ghostty
```

### Using Presets

```bash
gcyber      # Cyberpunk Dev (Tokyo Night + JetBrains Mono Nerd Font)
gminimal    # Minimal Focus (Nord + Iosevka)
gcozy       # Cozy Coding (Gruvbox + JetBrains Mono)
gpro        # Professional Elegant (Dracula + Cascadia Code)
```

## 🔄 Syncing Between Machines

### Push Changes (MacBook → GitHub)

```bash
cd ~/Projects/personal/dotfiles/ghostty-config
./sync-to-repo.sh "Your commit message"
git push
```

### Pull Changes (Mac Mini ← GitHub)

```bash
cd ~/Projects/personal/dotfiles/ghostty-config
./sync-from-repo.sh
```

## 📁 Structure

```
ghostty-config/
├── config                    # Active configuration
├── presets/                  # Optimized combinations
│   ├── cyberpunk-dev.conf
│   ├── minimal-focus.conf
│   ├── cozy-coding.conf
│   └── professional-elegant.conf
├── themes/                   # Color schemes
├── fonts/                    # Font configs
├── setup.sh                  # First-time install
├── sync-to-repo.sh           # Push to GitHub
├── sync-from-repo.sh         # Pull from GitHub
└── zshrc-aliases.sh          # Shell aliases
```

## 🎨 Presets Overview

| Preset | Theme | Font | Best For |
|--------|-------|------|----------|
| **Cyberpunk Dev** | Tokyo Night | JetBrains Mono NF | Modern dev, night coding |
| **Minimal Focus** | Nord | Iosevka | Distraction-free work |
| **Cozy Coding** | Gruvbox | JetBrains Mono | Long sessions |
| **Professional** | Dracula | Cascadia Code | Corporate work |

## 🛠️ Advanced Usage

### View Current Config
```bash
gconfig current
```

### Interactive Configuration
```bash
ghostty-config
# or
gconfig-interactive
```

### Manual Switching
```bash
gconfig preset cyberpunk-dev
gconfig theme tokyo-night
gconfig font fira-code
```

### Create Custom Preset

```bash
# 1. Copy existing preset
cd ~/.config/ghostty/presets
cp cyberpunk-dev.conf my-custom.conf

# 2. Edit configuration
# Modify theme, font, transparency, etc.

# 3. Sync to repository
cd ~/Projects/personal/dotfiles/ghostty-config
./sync-to-repo.sh "Add custom preset"
git push
```

## 📝 Complete Workflow Example

**On MacBook (after making changes):**
```bash
# 1. Make changes to ~/.config/ghostty
vim ~/.config/ghostty/config

# 2. Test changes (restart Ghostty)

# 3. Sync to repository
cd ~/Projects/personal/dotfiles/ghostty-config
./sync-to-repo.sh "Updated transparency settings"

# 4. Push to GitHub
git push
```

**On Mac Mini (to get latest changes):**
```bash
# 1. Pull from repository
cd ~/Projects/personal/dotfiles/ghostty-config
./sync-from-repo.sh

# 2. Restart Ghostty to apply
```

## 🔧 Configuration Options

### Transparency & Visual Effects
```conf
background-opacity = 0.92    # 0.0 (transparent) - 1.0 (opaque)
background-blur = 15         # 0 (no blur) - 50+ (intense blur)
```

### Typography
```conf
font-family = "JetBrains Mono"
font-size = 13               # Recommended: 11-16
font-thicken = true          # Better on retina
font-feature = +calt,+liga   # Enable ligatures
```

### Window & Cursor
```conf
cursor-style = bar           # bar, block, underline
window-padding-x = 16
window-padding-y = 12
window-decoration = true
```

## 🚨 Important Notes

- **Restart Required**: Ghostty must be restarted after config changes
- **Backup**: First-time setup backs up existing config automatically
- **Sync Direction**: `sync-to-repo.sh` = config → repo, `sync-from-repo.sh` = repo → config
- **Compatibility**: Tested on macOS Sonoma & Sequoia

## 📦 Requirements

- **Ghostty**: Terminal emulator
- **Git**: Version control
- **GitHub CLI**: `gh` for repo management
- **Nerd Fonts**: For proper icon rendering (recommended)

## 🔗 Repository Commands

```bash
# Check status
git status

# View changes
git diff

# Commit history
git log --oneline

# Push to remote
git push

# Pull from remote
git pull
```

## 📖 Additional Documentation

See `README-original.md` for detailed configuration explanations, theme characteristics, and advanced customization guide.

---

**Maintained by**: [@Arakiss](https://github.com/Arakiss)
**Last Updated**: 2025-10-24
**Ghostty Version**: Compatible with latest stable releases
