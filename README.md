# Ghostty Warp - Modern Terminal Configuration

My personal terminal setup using **Ghostty terminal emulator** with modern shell enhancements. Inspired by Warp Terminal, but open source and privacy-focused.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Platform: macOS](https://img.shields.io/badge/Platform-macOS-blue.svg)]()

## Why I Built This

I wanted Warp's features without:
- Proprietary software
- Telemetry
- Cloud dependency
- Bloat

So I configured Ghostty with the best open-source terminal tools.

## Features

### Productivity
- **Auto-suggestions** (zsh-autosuggestions) - Fish-like command suggestions
- **Syntax highlighting** (zsh-syntax-highlighting) - Real-time validation
- **Fuzzy search** (fzf) - Fast history and file search
- **Smart navigation** (zoxide) - Jump to directories
- **Advanced history** (atuin) - Cross-session search
- **Beautiful prompt** (starship) - Git integration

### Customization
- **4 Presets**: Cyberpunk Dev, Minimal Focus, Cozy Coding, Professional
- **5 Themes**: Tokyo Night, Catppuccin Mocha, Dracula, Nord, Gruvbox
- **4 Fonts**: JetBrains Mono, Fira Code, Cascadia Code, Iosevka (Nerd Fonts)
- **Auto Font Installation**: Nerd Fonts install automatically with setup

### Tools
- **mise** - Universal version manager
- **fnm** - Fast Node.js manager
- **fd** - Better find
- **ripgrep** - Faster grep

## Quick Start

```bash
# Clone
git clone https://github.com/Arakiss/ghostty-warp.git
cd ghostty-warp

# Install dependencies (Homebrew packages)
./install-deps.sh

# Setup everything
./setup-complete.sh

# Restart terminal
```

**Prerequisites**: macOS, [Ghostty](https://ghostty.org), [Homebrew](https://brew.sh)

## Usage

Switch presets instantly:
```bash
gcyber      # Tokyo Night + JetBrains Mono
gminimal    # Nord + Iosevka
gcozy       # Gruvbox + JetBrains Mono
gpro        # Dracula + Cascadia Code
```

Key features:
- `CTRL-R` - Fuzzy history search
- `z <dir>` - Jump to directory
- Type command → see gray suggestion → press `→` to accept

### Keyboard Shortcuts

All presets include comprehensive keybindings:

**Text & Clipboard**
- `Shift+Enter` - Multiline commands
- `Cmd+C` / `Cmd+V` - Copy/Paste

**Navigation**
- `Cmd+K` - Clear screen
- `Cmd+T` - New tab
- `Cmd+1-9` - Jump to tab

**Splits**
- `Cmd+D` - Vertical split
- `Cmd+Shift+D` - Horizontal split
- `Cmd+Shift+Enter` - Toggle zoom

**Font Size**
- `Cmd++` / `Cmd+-` - Increase/Decrease
- `Cmd+0` - Reset

## Sync Across Machines

```bash
# Machine 1: Push changes
./sync-to-repo.sh "Update config"
git push

# Machine 2: Pull changes
./sync-from-repo.sh
```

No cloud needed. Just git.

## Customization

Create your own preset:
```bash
cd ~/.config/ghostty/presets
cp cyberpunk-dev.conf custom.conf
# Edit custom.conf
gconfig preset custom
```

All configs are in `~/.config/ghostty/` - modify freely.

## Comparison with Warp

| Feature | Warp | This Setup |
|---------|------|------------|
| Auto-suggestions | ✅ | ✅ |
| Syntax highlighting | ✅ | ✅ |
| History search | ✅ Cloud | ✅ Local |
| Fuzzy finder | ✅ | ✅ |
| Open source | ❌ | ✅ |
| Offline | ❌ | ✅ |
| Telemetry | ⚠️ | ✅ None |
| Customization | ⚠️ Limited | ✅ Full |

## Documentation

- **[QUICKSTART.md](QUICKSTART.md)** - Quick reference
- **[FEATURE_COMPARISON.md](FEATURE_COMPARISON.md)** - Warp vs this setup analysis
- **[IMPROVEMENTS.md](IMPROVEMENTS.md)** - Recent updates and improvements
- **[CONTRIBUTING.md](CONTRIBUTING.md)** - Contributions welcome

## Tech Stack

- [Ghostty](https://ghostty.org) - Terminal emulator
- [Oh My Zsh](https://ohmyz.sh) - Zsh framework
- [Starship](https://starship.rs) - Prompt
- [fzf](https://github.com/junegunn/fzf) - Fuzzy finder
- [zoxide](https://github.com/ajeetdsouza/zoxide) - Smart cd
- [atuin](https://atuin.sh) - History

## License

MIT - Use however you want.

---

**Personal project.** Built for my own use. Shared in case it's useful to you.
