#!/bin/bash
# ==============================================
# GHOSTTY CONFIGURATION SWITCHER
# ==============================================
# Ultra-intelligent script for switching Ghostty themes, fonts, and presets
# Usage: ./switch-config.sh [preset|theme|font] [name]

GHOSTTY_DIR="$HOME/.config/ghostty"
CONFIG_FILE="$GHOSTTY_DIR/config"

# Enhanced colors for beautiful output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
GRAY='\033[0;90m'
NC='\033[0m' # No Color

# Unicode symbols for enhanced UI
CHECKMARK="✅"
ARROW="➤"
STAR="⭐"
LIGHTNING="⚡"

# Function to show loading animation
show_loading() {
    local message="$1"
    echo -ne "${YELLOW}$message"
    for i in {1..3}; do
        echo -ne "."
        sleep 0.1
    done
    echo -e " ${GREEN}${CHECKMARK}${NC}"
}

# Function to show available options
show_presets() {
    echo -e "${CYAN}🎨 Available Presets:${NC}"
    echo -e "${GREEN}  cyberpunk-dev${NC}      - Tokyo Night + Fira Code (futuristic coding)"
    echo -e "${GREEN}  minimal-focus${NC}      - Nord + Iosevka (clean productivity)"
    echo -e "${GREEN}  cozy-coding${NC}        - Gruvbox + JetBrains Mono (comfortable sessions)"
    echo -e "${GREEN}  professional-elegant${NC} - Dracula + Cascadia Code (corporate elegance)"
    echo ""
    echo -e "${GRAY}💡 Tip: Use the interactive script for guided selection: ./interactive-config.sh${NC}"
}

show_themes() {
    echo -e "${BLUE}🌈 Available Themes:${NC}"
    echo -e "${YELLOW}  catppuccin-mocha${NC}   - Modern & cozy (current default)"
    echo -e "${YELLOW}  tokyo-night${NC}        - Cyberpunk vibes"
    echo -e "${YELLOW}  dracula${NC}            - Classic gothic elegance"
    echo -e "${YELLOW}  nord${NC}               - Arctic minimalism"
    echo -e "${YELLOW}  gruvbox${NC}            - Retro warmth"
}

show_fonts() {
    echo -e "${PURPLE}🔤 Available Fonts:${NC}"
    echo -e "${GREEN}  jetbrains-mono${NC}     - Excellent all-around (current default)"
    echo -e "${GREEN}  fira-code${NC}          - Beautiful ligatures"
    echo -e "${GREEN}  cascadia-code${NC}      - Microsoft modern"
    echo -e "${GREEN}  iosevka${NC}            - Ultra-narrow, space-efficient"
}

# Function to apply a preset with enhanced feedback
apply_preset() {
    local preset="$1"
    local preset_file="$GHOSTTY_DIR/presets/$preset.conf"

    echo -e "${CYAN}${LIGHTNING} Applying preset: ${WHITE}$preset${NC}"
    echo ""

    if [[ -f "$preset_file" ]]; then
        show_loading "Copying configuration files"
        cp "$preset_file" "$CONFIG_FILE"

        echo -e "${GREEN}${CHECKMARK} Successfully applied preset: ${CYAN}$preset${NC}"
        echo ""

        # Show what was applied
        echo -e "${YELLOW}Applied Configuration:${NC}"
        if grep -q '^theme' "$CONFIG_FILE"; then
            echo -e "  ${ARROW} Theme: ${GREEN}$(grep '^theme' "$CONFIG_FILE" | cut -d'=' -f2 | xargs)${NC}"
        fi
        if grep -q '^font-family' "$CONFIG_FILE"; then
            echo -e "  ${ARROW} Font: ${GREEN}$(grep '^font-family' "$CONFIG_FILE" | cut -d'=' -f2 | xargs)${NC}"
        fi
        if grep -q '^background-opacity' "$CONFIG_FILE"; then
            echo -e "  ${ARROW} Transparency: ${GREEN}$(grep '^background-opacity' "$CONFIG_FILE" | cut -d'=' -f2 | xargs)${NC}"
        fi
        echo ""
        echo -e "${YELLOW}${LIGHTNING} Restart Ghostty to see the changes${NC}"
        echo -e "${GRAY}💡 Tip: Use './interactive-config.sh' for a guided experience${NC}"
    else
        echo -e "${RED}❌ Preset '$preset' not found${NC}"
        echo ""
        show_presets
    fi
}

# Function to apply a theme with enhanced feedback
apply_theme() {
    local theme="$1"
    local theme_file="$GHOSTTY_DIR/themes/$theme.conf"

    echo -e "${BLUE}🌈 Applying theme: ${WHITE}$theme${NC}"
    echo ""

    if [[ -f "$theme_file" ]]; then
        show_loading "Applying theme configuration"
        cp "$theme_file" "$CONFIG_FILE"

        echo -e "${GREEN}${CHECKMARK} Successfully applied theme: ${BLUE}$theme${NC}"
        echo ""
        echo -e "${YELLOW}${LIGHTNING} Restart Ghostty to see the changes${NC}"
        echo -e "${GRAY}💡 Tip: Combine with specific fonts using './interactive-config.sh'${NC}"
    else
        echo -e "${RED}❌ Theme '$theme' not found${NC}"
        echo ""
        show_themes
    fi
}

# Function to apply a font with enhanced feedback
apply_font() {
    local font="$1"
    local font_file="$GHOSTTY_DIR/fonts/$font.conf"

    echo -e "${PURPLE}🔤 Applying font: ${WHITE}$font${NC}"
    echo ""

    if [[ -f "$font_file" ]]; then
        show_loading "Setting up base theme (Catppuccin Mocha)"
        cp "$GHOSTTY_DIR/themes/catppuccin-mocha.conf" "$CONFIG_FILE"

        show_loading "Applying font configuration"
        # Append font settings
        echo "" >> "$CONFIG_FILE"
        echo "# Font override from $font configuration" >> "$CONFIG_FILE"
        grep "^font-" "$font_file" >> "$CONFIG_FILE"
        grep "^minimum-contrast" "$font_file" >> "$CONFIG_FILE" 2>/dev/null || true
        grep "^cursor-" "$font_file" >> "$CONFIG_FILE" 2>/dev/null || true

        echo -e "${GREEN}${CHECKMARK} Successfully applied font: ${PURPLE}$font${NC}"
        echo -e "${YELLOW}${ARROW} Combined with: ${GREEN}Catppuccin Mocha theme${NC}"
        echo ""
        echo -e "${YELLOW}${LIGHTNING} Restart Ghostty to see the changes${NC}"
        echo -e "${GRAY}💡 Tip: Use presets for optimized theme+font combinations${NC}"
    else
        echo -e "${RED}❌ Font '$font' not found${NC}"
        echo ""
        show_fonts
    fi
}

# Function to show current configuration with enhanced details
show_current() {
    echo -e "${CYAN}📋 Current Configuration Status:${NC}"
    echo ""

    if [[ -f "$CONFIG_FILE" ]]; then
        echo -e "${GREEN}${CHECKMARK} Configuration file found${NC}"
        echo ""
        echo -e "${YELLOW}Active Settings:${NC}"
        echo -e "  ${ARROW} Theme: ${GREEN}$(grep '^theme' "$CONFIG_FILE" | cut -d'=' -f2 | xargs || echo 'custom/unknown')${NC}"
        echo -e "  ${ARROW} Font: ${GREEN}$(grep '^font-family' "$CONFIG_FILE" | cut -d'=' -f2 | xargs || echo 'default')${NC}"
        echo -e "  ${ARROW} Font Size: ${GREEN}$(grep '^font-size' "$CONFIG_FILE" | cut -d'=' -f2 | xargs || echo 'default')${NC}"
        echo -e "  ${ARROW} Transparency: ${GREEN}$(grep '^background-opacity' "$CONFIG_FILE" | cut -d'=' -f2 | xargs || echo 'default')${NC}"
        echo -e "  ${ARROW} Blur: ${GREEN}$(grep '^background-blur' "$CONFIG_FILE" | cut -d'=' -f2 | xargs || echo 'default')${NC}"
        echo ""
        echo -e "${GRAY}💡 Configuration file: ~/.config/ghostty/config${NC}"
    else
        echo -e "${RED}❌ No configuration file found${NC}"
        echo -e "${YELLOW}${LIGHTNING} Use this script to create your first configuration!${NC}"
    fi
    echo ""
}

# Main script logic
case "$1" in
    "preset")
        if [[ -n "$2" ]]; then
            apply_preset "$2"
        else
            show_presets
        fi
        ;;
    "theme")
        if [[ -n "$2" ]]; then
            apply_theme "$2"
        else
            show_themes
        fi
        ;;
    "font")
        if [[ -n "$2" ]]; then
            apply_font "$2"
        else
            show_fonts
        fi
        ;;
    "current"|"status")
        show_current
        ;;
    *)
        echo -e "${CYAN}🚀 Ghostty Configuration Switcher - Command Line Interface${NC}"
        echo ""
        echo -e "${WHITE}Quick Usage:${NC}"
        echo -e "${GREEN}  $0 [preset|theme|font|current] [name]${NC}"
        echo ""
        echo -e "${YELLOW}${STAR} For Interactive Experience:${NC}"
        echo -e "${CYAN}  ./interactive-config.sh${NC}  ${GRAY}(Guided menus and explanations)${NC}"
        echo ""
        show_presets
        echo ""
        show_themes
        echo ""
        show_fonts
        echo ""
        echo -e "${YELLOW}Command Examples:${NC}"
        echo -e "  ${GRAY}$0 preset cyberpunk-dev     ${NC}# Apply complete cyberpunk preset"
        echo -e "  ${GRAY}$0 theme tokyo-night        ${NC}# Switch to Tokyo Night theme"
        echo -e "  ${GRAY}$0 font fira-code          ${NC}# Switch to Fira Code font"
        echo -e "  ${GRAY}$0 current                 ${NC}# Show current configuration"
        echo ""
        echo -e "${CYAN}💡 Tip: New to Ghostty? Try the interactive script first!${NC}"
        ;;
esac

# AI NOTES FOR SCRIPT MAINTENANCE:
# - Add new presets to show_presets() function
# - Add new themes to show_themes() function
# - Add new fonts to show_fonts() function
# - Preset files should be in presets/ directory
# - Theme files should be in themes/ directory
# - Font files should be in fonts/ directory
# - Script automatically finds and applies configurations
# - Color coding: Cyan=headers, Green=success, Yellow=info, Red=error