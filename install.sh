#!/bin/bash
# ==============================================
# GHOSTTY CONFIGURATION SYSTEM INSTALLER
# ==============================================
# Automated installation and setup script
# Sets up aliases and makes everything ready to use

GHOSTTY_DIR="$HOME/.config/ghostty"

# Colors for beautiful output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
GRAY='\033[0;90m'
NC='\033[0m'

# Unicode symbols
CHECKMARK="✅"
ARROW="➤"
STAR="⭐"
LIGHTNING="⚡"
ROCKET="🚀"
GEAR="⚙️"

# Function to show header
show_header() {
    clear
    echo -e "${CYAN}╔══════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${CYAN}║           ${WHITE}${ROCKET} GHOSTTY CONFIGURATION SYSTEM INSTALLER${NC} ${CYAN}║${NC}"
    echo -e "${CYAN}║              ${GRAY}Automated setup for terminal perfection${NC}        ${CYAN}║${NC}"
    echo -e "${CYAN}╚══════════════════════════════════════════════════════════════╝${NC}"
    echo ""
}

# Function to show loading animation
show_loading() {
    local message="$1"
    echo -ne "${YELLOW}$message"
    for i in {1..3}; do
        echo -ne "."
        sleep 0.2
    done
    echo -e " ${GREEN}${CHECKMARK}${NC}"
}

# Function to detect shell
detect_shell() {
    local shell_name
    shell_name=$(basename "$SHELL")
    echo "$shell_name"
}

# Function to get shell config file
get_shell_config() {
    local shell_name="$1"
    case "$shell_name" in
        "zsh")
            echo "$HOME/.zshrc"
            ;;
        "bash")
            echo "$HOME/.bashrc"
            ;;
        "fish")
            echo "$HOME/.config/fish/config.fish"
            ;;
        *)
            echo "$HOME/.profile"
            ;;
    esac
}

# Function to add aliases to shell config
setup_aliases() {
    local shell_name
    local config_file
    local aliases_block

    shell_name=$(detect_shell)
    config_file=$(get_shell_config "$shell_name")

    echo -e "${BLUE}${GEAR} Setting up shell aliases for ${WHITE}$shell_name${NC}"
    echo ""

    # Create config file if it doesn't exist
    if [[ ! -f "$config_file" ]]; then
        touch "$config_file"
        echo -e "${YELLOW}${ARROW} Created $config_file${NC}"
    fi

    # Check if aliases already exist
    if grep -q "# Ghostty Configuration Aliases" "$config_file"; then
        echo -e "${YELLOW}${ARROW} Aliases already exist, skipping...${NC}"
        return
    fi

    # Create aliases block based on shell type
    if [[ "$shell_name" == "fish" ]]; then
        aliases_block="
# Ghostty Configuration Aliases
alias gconfig='$GHOSTTY_DIR/gconfig'
alias ghostty-config='$GHOSTTY_DIR/interactive-config.sh'
alias gconfig-interactive='$GHOSTTY_DIR/interactive-config.sh'
alias gconfig-switch='$GHOSTTY_DIR/switch-config.sh'

# Quick preset aliases
alias gcyber='$GHOSTTY_DIR/gconfig cyber'
alias gminimal='$GHOSTTY_DIR/gconfig minimal'
alias gcozy='$GHOSTTY_DIR/gconfig cozy'
alias gpro='$GHOSTTY_DIR/gconfig pro'
"
    else
        aliases_block="
# Ghostty Configuration Aliases
alias gconfig='$GHOSTTY_DIR/gconfig'
alias ghostty-config='$GHOSTTY_DIR/interactive-config.sh'
alias gconfig-interactive='$GHOSTTY_DIR/interactive-config.sh'
alias gconfig-switch='$GHOSTTY_DIR/switch-config.sh'

# Quick preset aliases
alias gcyber='$GHOSTTY_DIR/gconfig cyber'
alias gminimal='$GHOSTTY_DIR/gconfig minimal'
alias gcozy='$GHOSTTY_DIR/gconfig cozy'
alias gpro='$GHOSTTY_DIR/gconfig pro'
"
    fi

    # Add aliases to config file
    echo "$aliases_block" >> "$config_file"

    show_loading "Adding aliases to $config_file"
    echo -e "${GREEN}${CHECKMARK} Aliases added successfully!${NC}"
    echo ""
}

# Function to show completion message
show_completion() {
    echo -e "${GREEN}${ROCKET} Installation Complete!${NC}"
    echo ""
    echo -e "${CYAN}What's been set up:${NC}"
    echo -e "  ${CHECKMARK} ${GREEN}All configuration files verified${NC}"
    echo -e "  ${CHECKMARK} ${GREEN}Scripts made executable${NC}"
    echo -e "  ${CHECKMARK} ${GREEN}Shell aliases configured${NC}"
    echo ""
    echo -e "${YELLOW}Available Commands:${NC}"
    echo -e "  ${ARROW} ${WHITE}gconfig${NC}              # Quick configuration menu"
    echo -e "  ${ARROW} ${WHITE}gconfig interactive${NC}  # Full interactive experience"
    echo -e "  ${ARROW} ${WHITE}gcyber${NC}               # Apply Cyberpunk Dev preset"
    echo -e "  ${ARROW} ${WHITE}gminimal${NC}             # Apply Minimal Focus preset"
    echo -e "  ${ARROW} ${WHITE}gcozy${NC}                # Apply Cozy Coding preset"
    echo -e "  ${ARROW} ${WHITE}gpro${NC}                 # Apply Professional Elegant preset"
    echo ""
    echo -e "${CYAN}Next Steps:${NC}"
    echo -e "  1. ${YELLOW}Restart your terminal${NC} or run: ${WHITE}source $(get_shell_config "$(detect_shell)")${NC}"
    echo -e "  2. ${YELLOW}Try: ${WHITE}gconfig interactive${NC} for your first configuration"
    echo -e "  3. ${YELLOW}Restart Ghostty${NC} after applying any configuration"
    echo ""
    echo -e "${PURPLE}${STAR} Enjoy your perfectly configured Ghostty terminal! ${STAR}${NC}"
}

# Main installation process
main() {
    show_header

    echo -e "${WHITE}This installer will set up the complete Ghostty configuration system:${NC}"
    echo ""
    echo -e "  ${ARROW} Verify all configuration files"
    echo -e "  ${ARROW} Make scripts executable"
    echo -e "  ${ARROW} Set up convenient shell aliases"
    echo ""
    read -p "Continue with installation? (y/N): " -n 1 -r
    echo ""

    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo -e "${YELLOW}Installation cancelled.${NC}"
        exit 0
    fi

    echo ""
    echo -e "${CYAN}${LIGHTNING} Starting installation...${NC}"
    echo ""

    # Verify directory exists
    if [[ ! -d "$GHOSTTY_DIR" ]]; then
        echo -e "${RED}❌ Ghostty configuration directory not found!${NC}"
        echo -e "${YELLOW}Expected: $GHOSTTY_DIR${NC}"
        exit 1
    fi

    # Make scripts executable
    show_loading "Making scripts executable"
    chmod +x "$GHOSTTY_DIR"/*.sh
    chmod +x "$GHOSTTY_DIR/gconfig"

    # Verify configuration files exist
    local missing_files=()
    local required_files=(
        "themes/catppuccin-mocha.conf"
        "themes/tokyo-night.conf"
        "themes/dracula.conf"
        "themes/nord.conf"
        "themes/gruvbox.conf"
        "fonts/jetbrains-mono.conf"
        "fonts/fira-code.conf"
        "fonts/cascadia-code.conf"
        "fonts/iosevka.conf"
        "presets/cyberpunk-dev.conf"
        "presets/minimal-focus.conf"
        "presets/cozy-coding.conf"
        "presets/professional-elegant.conf"
        "interactive-config.sh"
        "switch-config.sh"
        "gconfig"
    )

    for file in "${required_files[@]}"; do
        if [[ ! -f "$GHOSTTY_DIR/$file" ]]; then
            missing_files+=("$file")
        fi
    done

    if [[ ${#missing_files[@]} -gt 0 ]]; then
        echo -e "${RED}❌ Missing configuration files:${NC}"
        for file in "${missing_files[@]}"; do
            echo -e "  ${ARROW} $file"
        done
        echo ""
        echo -e "${YELLOW}Please ensure all configuration files are present.${NC}"
        exit 1
    fi

    show_loading "Verifying configuration files"

    # Set up shell aliases
    setup_aliases

    # Apply default configuration if none exists
    if [[ ! -f "$GHOSTTY_DIR/config" ]]; then
        show_loading "Applying default configuration (Catppuccin Mocha)"
        cp "$GHOSTTY_DIR/themes/catppuccin-mocha.conf" "$GHOSTTY_DIR/config"
    fi

    echo ""
    show_completion
}

# Run main function
main "$@"