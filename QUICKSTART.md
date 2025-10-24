# 🚀 Ghostty Config - Quick Start Guide

## 📍 Repository
**GitHub**: https://github.com/YOUR-USERNAME/ghostty-warp

---

## 🆕 Setup on New Machine (First Time)

```bash
# 1. Clone repository
cd ~/Projects/personal/dotfiles
git clone https://github.com/YOUR-USERNAME/ghostty-warp.git
cd ghostty-warp

# 2. Run setup script
chmod +x setup.sh
./setup.sh

# 3. Add aliases to shell
cat zshrc-aliases.sh >> ~/.zshrc
source ~/.zshrc

# 4. Restart Ghostty
# Done! 🎉
```

---

## 🔄 Daily Usage

### Quick Preset Switching

```bash
gcyber      # Cyberpunk Dev (Tokyo Night)
gminimal    # Minimal Focus (Nord)
gcozy       # Cozy Coding (Gruvbox)
gpro        # Professional (Dracula)
```

### View Current Config
```bash
gconfig current
```

### Interactive Configuration
```bash
ghostty-warp
```

---

## 🔄 Syncing Between Machines

### Primary Machine → GitHub (Push Changes)

```bash
cd ~/Projects/personal/dotfiles/ghostty-warp
./sync-to-repo.sh "Your message"
git push
```

### Secondary Machine ← GitHub (Pull Changes)

```bash
cd ~/Projects/personal/dotfiles/ghostty-warp
./sync-from-repo.sh
```

---

## 📝 Common Workflows

### Workflow 1: Made Changes on Primary Machine

```bash
# On Primary Machine
cd ~/Projects/personal/dotfiles/ghostty-warp
./sync-to-repo.sh "Updated theme colors"
git push

# On Secondary Machine
cd ~/Projects/personal/dotfiles/ghostty-warp
./sync-from-repo.sh
# Restart Ghostty
```

### Workflow 2: Create New Preset

```bash
# 1. Edit config
vim ~/.config/ghostty/presets/my-preset.conf

# 2. Test it
gconfig preset my-preset

# 3. Sync to repo
cd ~/Projects/personal/dotfiles/ghostty-warp
./sync-to-repo.sh "Add my-preset"
git push

# 4. Pull on other machine
cd ~/Projects/personal/dotfiles/ghostty-warp
./sync-from-repo.sh
```

### Workflow 3: Update Existing Config

```bash
# 1. Edit main config
vim ~/.config/ghostty/config

# 2. Test changes (restart Ghostty)

# 3. Sync
cd ~/Projects/personal/dotfiles/ghostty-warp
./sync-to-repo.sh "Increased font size"
git push
```

---

## 🛠️ Troubleshooting

### Config not applying?
```bash
# Restart Ghostty completely
# Check current config
gconfig current
```

### Sync conflicts?
```bash
cd ~/Projects/personal/dotfiles/ghostty-warp
git status
git pull
# Resolve conflicts manually
git push
```

### Lost aliases?
```bash
# Re-add to shell
cat ~/Projects/personal/dotfiles/ghostty-warp/zshrc-aliases.sh >> ~/.zshrc
source ~/.zshrc
```

---

## 📂 Important Paths

```
Repository:     ~/Projects/personal/dotfiles/ghostty-warp
Live Config:    ~/.config/ghostty
Active Config:  ~/.config/ghostty/config
Presets:        ~/.config/ghostty/presets/
Themes:         ~/.config/ghostty/themes/
Fonts:          ~/.config/ghostty/fonts/
```

---

## 🎯 Quick Reference

| Command | Description |
|---------|-------------|
| `gcyber` | Load Cyberpunk preset |
| `gminimal` | Load Minimal preset |
| `gcozy` | Load Cozy preset |
| `gpro` | Load Professional preset |
| `gconfig current` | Show active config |
| `ghostty-warp` | Interactive setup |
| `./sync-to-repo.sh` | Push to GitHub |
| `./sync-from-repo.sh` | Pull from GitHub |

---

## 📖 Full Documentation

See `README.md` for complete documentation.
See `CONTRIBUTING.md` for contribution guidelines.

---

**Last Updated**: 2025-10-24
