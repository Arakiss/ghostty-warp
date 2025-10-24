#!/usr/bin/env bash

# ==============================================
# Complete Zsh Configuration
# ==============================================
# This file contains the COMPLETE zsh configuration
# that should be added to ~/.zshrc
#
# IMPORTANT: This is meant to be APPENDED, not replace
# your existing .zshrc (keeps Oh My Zsh config)

# ==============================================
# PATH Additions
# ==============================================

# Bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# uv tools
export PATH="$HOME/.local/bin:$PATH"

# ==============================================
# Version Managers
# ==============================================

# mise (universal version manager)
eval "$(mise activate zsh)"

# fnm (Fast Node Manager)
eval "$(fnm env --use-on-cd)"

# ==============================================
# Bun Completions
# ==============================================

[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# ==============================================
# Prompt
# ==============================================

# Starship prompt
eval "$(starship init zsh)"

# ==============================================
# Docker Completions
# ==============================================

fpath=($HOME/.docker/completions $fpath)
autoload -Uz compinit
compinit

# ==============================================
# 🚀 INTELLIGENT AUTOCOMPLETE & SHELL ENHANCEMENTS
# ==============================================

# --- zsh-autosuggestions Configuration ---
# Fish-like autosuggestions based on history
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Optimization: Limit buffer size for better performance
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

# Enable async mode for faster suggestions
export ZSH_AUTOSUGGEST_USE_ASYNC=1

# Customize suggestion color (subtle gray)
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#6c7086"

# Suggest from history and completion
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# --- zsh-syntax-highlighting Configuration ---
# Must be loaded AFTER zsh-autosuggestions
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# --- fzf Configuration ---
# Fuzzy finder for files, history, and more
source <(fzf --zsh)

# fzf key bindings:
# - CTRL-T: Paste selected files/dirs into command line
# - CTRL-R: Search command history (IMPROVED with fzf!)
# - ALT-C:  cd into selected directory

# Custom fzf options for better UX
export FZF_DEFAULT_OPTS="
  --height 40%
  --layout=reverse
  --border
  --preview-window=right:50%
  --bind='ctrl-/:toggle-preview'
"

# Use fd (if available) for better file finding
if command -v fd &> /dev/null; then
  export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
fi

# --- zoxide Configuration ---
# Smart directory navigation (replaces cd with learning capabilities)
eval "$(zoxide init zsh)"

# Usage:
# - z <keyword>    : Jump to a directory matching keyword
# - zi             : Interactive directory search (requires fzf)
# - z -            : Go back to previous directory

# --- Atuin Configuration ---
# Intelligent shell history with search and sync
eval "$(atuin init zsh)"

# Atuin key bindings:
# - CTRL-R: Search through ALL your command history with fuzzy search
# - UP:     Navigate through history with context awareness

# Atuin config location: ~/.config/atuin/config.toml

# ==============================================
# 🎯 Ghostty Configuration Aliases
# ==============================================

alias gconfig="$HOME/.config/ghostty/gconfig"
alias ghostty-warp="$HOME/.config/ghostty/interactive-config.sh"
alias gconfig-interactive="$HOME/.config/ghostty/interactive-config.sh"
alias gconfig-switch="$HOME/.config/ghostty/switch-config.sh"

# Quick preset aliases
alias gcyber="$HOME/.config/ghostty/gconfig cyber"
alias gminimal="$HOME/.config/ghostty/gconfig minimal"
alias gcozy="$HOME/.config/ghostty/gconfig cozy"
alias gpro="$HOME/.config/ghostty/gconfig pro"

# ==============================================
# 🎯 QUICK REFERENCE
# ==============================================
# Auto-suggestions: Type and see gray suggestions → Right arrow to accept
# Syntax highlighting: Valid commands = green, invalid = red
# fzf history: CTRL-R for fuzzy command history search
# fzf files: CTRL-T to find and insert files
# fzf dirs: ALT-C to cd into directory
# zoxide: Use 'z' instead of 'cd' (learns your patterns)
# Atuin: Enhanced CTRL-R with full-text search across all history
# ==============================================
