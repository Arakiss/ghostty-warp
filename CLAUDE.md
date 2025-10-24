# CLAUDE.md - AI Assistant Instructions

**Purpose**: Instructions for Claude (or other AI assistants) to help maintain and sync this terminal environment across multiple machines.

---

## 🎯 System Overview

This repository contains a **complete terminal environment** including:
- **Ghostty** terminal configuration (themes, fonts, presets)
- **Zsh** complete configuration with all plugins
- **Homebrew** dependencies (Brewfile)
- **Sync scripts** for bidirectional synchronization between machines

### Use Cases

1. **Personal** - Sync between home and work computers
2. **Team** - Share consistent environment across team members
3. **Backup** - Version control for terminal configurations

---

## 🔧 Complete Stack

### Terminal Emulator
- **Ghostty** - GPU-accelerated terminal

### Shell Configuration
- **Oh My Zsh** - Framework
- **Starship** - Modern prompt

### Shell Enhancements (Homebrew)
```
zsh-autosuggestions      # Fish-like suggestions
zsh-syntax-highlighting  # Command validation
fzf                      # Fuzzy finder
fd                       # Fast find (used by fzf)
zoxide                   # Smart cd
atuin                    # Shell history search
mise                     # Universal version manager
fnm                      # Fast Node Manager
```

---

## 📂 Repository Structure

```
ghostty-warp/
├── config                    # Active Ghostty config
├── presets/                  # 4 complete presets
├── themes/                   # 5 color themes
├── fonts/                    # 4 font configs
├── Brewfile                  # All Homebrew dependencies
├── zshrc-complete.sh         # Complete zsh config to append
├── install-deps.sh           # Install all dependencies
├── setup-complete.sh         # Master setup script
├── sync-to-repo.sh           # Push changes to GitHub
├── sync-from-repo.sh         # Pull changes from GitHub
├── README.md                 # Main documentation
├── QUICKSTART.md             # Quick reference
├── CONTRIBUTING.md           # Contribution guidelines
└── CLAUDE.md                 # This file (AI instructions)
```

---

## 🤖 AI Assistant Workflows

### Workflow 1: "Sync my environment to repo"

**Context**: User made changes to Ghostty or Zsh config and wants to push to repository

**Steps:**

```bash
# 1. Navigate to repository
cd ~/path/to/ghostty-warp

# 2. Sync Ghostty config from ~/.config/ghostty to repository
./sync-to-repo.sh "Description of changes"

# 3. If zsh config changed, update zshrc-complete.sh
# Extract relevant sections from ~/.zshrc
# Update zshrc-complete.sh with new configuration

# 4. Commit and push
git add .
git commit -m "Sync: [description]"
git push
```

**What to sync:**
- Ghostty: `~/.config/ghostty/*` → repository root
- Zsh: Extract plugin configs from `~/.zshrc` → `zshrc-complete.sh`

### Workflow 2: "Setup on new machine"

**Context**: User wants to setup this environment on a fresh machine

**Steps:**

```bash
# 1. Clone repository
git clone https://github.com/USERNAME/ghostty-warp.git
cd ghostty-warp

# 2. Install dependencies
chmod +x install-deps.sh
./install-deps.sh

# 3. Run complete setup
chmod +x setup-complete.sh
./setup-complete.sh

# 4. Restart terminal
# Done!
```

**What this does:**
- Installs all Homebrew packages
- Installs Oh My Zsh (if not present)
- Copies Ghostty config to `~/.config/ghostty/`
- Appends zsh config to `~/.zshrc`
- Makes all scripts executable

### Workflow 3: "Pull latest changes"

**Context**: Another machine was updated, now sync this machine

**Steps:**

```bash
# 1. Navigate to repository
cd ~/path/to/ghostty-warp

# 2. Pull and sync
./sync-from-repo.sh

# 3. Restart Ghostty (and terminal if zsh changed)
```

**What this does:**
- Pulls latest from GitHub
- Syncs repository → `~/.config/ghostty/`
- Does NOT modify `~/.zshrc` (manual update if needed)

---

## 🔄 Common Operations

### Check Environment Status

```bash
# Check installed Homebrew packages
brew list | grep -E "zsh-|fzf|zoxide|atuin|starship|mise|fnm"

# Check Ghostty config exists
ls -la ~/.config/ghostty/

# Check current Ghostty preset
gconfig current

# Check zsh plugins loaded
cat ~/.zshrc | grep "source.*zsh"
```

### Sync Ghostty Config Changes

```bash
cd ~/path/to/ghostty-warp

# After editing ~/.config/ghostty/config or presets
./sync-to-repo.sh "Updated theme transparency"
git push
```

### Sync Zsh Config Changes

```bash
cd ~/path/to/ghostty-warp

# 1. Extract changes from ~/.zshrc (relevant sections)
# Lines with plugin configs, aliases, PATH additions

# 2. Update zshrc-complete.sh with new config
# Test: source zshrc-complete.sh in new terminal

# 3. Commit
git add zshrc-complete.sh
git commit -m "Update zsh configuration: [description]"
git push
```

### Add New Homebrew Dependency

```bash
cd ~/path/to/ghostty-warp

# 1. Add to Brewfile
echo 'brew "new-tool"  # Description' >> Brewfile

# 2. Test installation
brew bundle

# 3. Update documentation if needed
# Add to README.md "What You Get" section

# 4. Commit
git add Brewfile
git commit -m "Add dependency: new-tool"
git push
```

---

## 🚨 Critical Paths

### Standard Locations

```
Repository:      ~/path/to/ghostty-warp (user-defined)
Ghostty Config:  ~/.config/ghostty/
Zsh Config:      ~/.zshrc
Oh My Zsh:       ~/.oh-my-zsh/
Homebrew:        /opt/homebrew/ (Apple Silicon)
                 /usr/local/ (Intel Mac)
```

### Syncing Rules

**FROM Local TO Repo:**
- Ghostty: `~/.config/ghostty/` → `repository/`
- Zsh: Extract from `~/.zshrc` → `repository/zshrc-complete.sh`

**FROM Repo TO Local:**
- Ghostty: `repository/` → `~/.config/ghostty/`
- Zsh: Append `repository/zshrc-complete.sh` → `~/.zshrc`

---

## 🔍 Configuration Structure

### Zsh Config in ~/.zshrc

Typical structure:
```bash
# Lines 1-75: Oh My Zsh standard config
# Lines 100-125: User additions (version managers, tools)
# Lines 150-250: Shell enhancements (IMPORTANT SECTION)
  # - zsh-autosuggestions
  # - zsh-syntax-highlighting
  # - fzf configuration
  # - zoxide initialization
  # - atuin initialization
  # - Ghostty aliases
```

**What to extract**: Everything after Oh My Zsh base config

### Ghostty Config Structure

```
~/.config/ghostty/
├── config                    # Active config (sync)
├── presets/                  # All presets (sync)
├── themes/                   # All themes (sync)
├── fonts/                    # All fonts (sync)
├── *.sh scripts              # Management scripts (sync)
└── gconfig                   # Quick switcher (sync)
```

---

## 🧪 Testing Commands

### Test Ghostty Configuration

```bash
# Open Ghostty and verify
ghostty

# Check current preset
gconfig current

# Try switching presets
gcyber      # Cyberpunk Dev
gminimal    # Minimal Focus
gcozy       # Cozy Coding
gpro        # Professional
```

### Test Zsh Plugins

```bash
# Open new terminal and verify:

# 1. Auto-suggestions work?
# Type command → see gray suggestion → press → to accept

# 2. Syntax highlighting works?
# Valid command = green, invalid = red

# 3. fzf works?
# Press CTRL-R → see fuzzy history search

# 4. zoxide works?
# Type: z projects → jumps to ~/Projects

# 5. atuin works?
# Press CTRL-R → enhanced history search
```

---

## 🔧 Troubleshooting

### Issue: Aliases not working

**Diagnosis:**
```bash
# Check if aliases defined
cat ~/.zshrc | grep "alias gcyber"

# Check if sourced
echo $ZSH
```

**Solution:**
```bash
# Re-source zshrc
source ~/.zshrc

# Or restart terminal
```

### Issue: Plugins not loading

**Diagnosis:**
```bash
# Check if installed
brew list zsh-autosuggestions
brew list zsh-syntax-highlighting

# Check if sourced
cat ~/.zshrc | grep "source.*autosuggestions"
```

**Solution:**
```bash
# Reinstall plugins
brew reinstall zsh-autosuggestions zsh-syntax-highlighting

# Verify source lines in .zshrc
```

### Issue: Sync script errors

**Diagnosis:**
```bash
# Check permissions
ls -la *.sh

# Check git status
git status
```

**Solution:**
```bash
# Fix permissions
chmod +x *.sh

# Reset git if needed
git reset --hard origin/main
```

### Issue: Ghostty config not applying

**Diagnosis:**
```bash
# Verify config exists
ls -la ~/.config/ghostty/config

# Check for syntax errors
cat ~/.config/ghostty/config
```

**Solution:**
```bash
# Verify config syntax
# Restart Ghostty completely (Cmd+Q, then reopen)
# Re-sync if needed
./sync-from-repo.sh
```

---

## 📋 Maintenance Checklist

When assisting with full environment sync:

- [ ] Ghostty config synced (`./sync-to-repo.sh`)
- [ ] Zsh config extracted and updated (`zshrc-complete.sh`)
- [ ] Brewfile updated (if new dependencies added)
- [ ] Scripts are executable (`chmod +x *.sh`)
- [ ] Documentation updated (if structure changed)
- [ ] Committed with descriptive message
- [ ] Pushed to remote repository
- [ ] Verified on GitHub (web interface)

---

## 🎓 Understanding the Environment

### Sync Philosophy

- **Primary machine** = Source of truth (development machine)
- **Secondary machines** = Sync targets (pull changes)
- **Repository** = Central source
- **Forked repos** = Independent customizations

### What NOT to Sync

- **Secrets** (API keys, tokens) → Use separate `.env` files
- **Machine-specific paths** → Use `$HOME` variables
- **Personal git config** → Username/email stays local
- **SSH keys** → Never sync these
- **History files** → Let atuin handle sync if needed

### What TO Sync

- **Ghostty presets, themes, fonts**
- **Zsh plugin configurations**
- **Shell aliases and functions**
- **Tool configurations** (fzf, zoxide, etc.)
- **Brewfile** (dependencies)

---

## 🎯 Quick Command Reference

### Setup Commands

```bash
# First-time setup
./install-deps.sh
./setup-complete.sh

# Update dependencies
brew bundle

# Reinstall everything
./setup-complete.sh
```

### Sync Commands

```bash
# Push local changes to repo
./sync-to-repo.sh "message"
git push

# Pull repo changes to local
./sync-from-repo.sh

# Full backup
./sync-to-repo.sh "Full backup $(date +%Y-%m-%d)"
git push
```

### Ghostty Commands

```bash
# Switch presets
gcyber / gminimal / gcozy / gpro

# View current config
gconfig current

# Interactive config
ghostty-warp

# Switch theme only
gconfig theme tokyo-night

# Switch font only
gconfig font fira-code
```

---

## 📖 Additional Resources

### Official Documentation

- **Ghostty**: https://ghostty.org
- **Oh My Zsh**: https://ohmyz.sh
- **Starship**: https://starship.rs
- **fzf**: https://github.com/junegunn/fzf
- **zoxide**: https://github.com/ajeetdsouza/zoxide
- **atuin**: https://atuin.sh
- **mise**: https://mise.jdx.dev
- **fnm**: https://github.com/Schniz/fnm

### Repository Files

- **README.md** - Main documentation, installation guide
- **QUICKSTART.md** - Quick reference for daily use
- **CONTRIBUTING.md** - How to contribute improvements

---

## ✅ Best Practices for AI Assistants

1. **Always check current directory** before running commands
2. **Test changes locally** before committing
3. **Use descriptive commit messages** following conventional format
4. **Verify scripts are executable** (`chmod +x`)
5. **Never commit secrets** (check before commit)
6. **Ask for clarification** if requirements are ambiguous
7. **Document changes** in commit messages and code comments
8. **Test on clean environment** when possible
9. **Keep configurations generic** (no hardcoded paths)
10. **Update documentation** when adding features

---

## 🆘 When to Ask User

- **Breaking changes** to configuration structure
- **Adding new dependencies** that aren't optional
- **Modifying core scripts** that affect all users
- **Removing features** that might be in use
- **Making repository public** (privacy concerns)
- **Major version changes** to dependencies

---

**Last Updated**: 2025-10-24
**Version**: 2.0.0 (Generic/Shareable)
**Repository**: https://github.com/YOUR-USERNAME/ghostty-warp
