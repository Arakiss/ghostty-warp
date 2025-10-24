#!/bin/bash
# ==============================================
# GHOSTTY INTERACTIVE CONFIGURATION MANAGER
# ==============================================
# Super-automated, explanatory, and user-friendly configuration system
# Usage: ./interactive-config.sh

GHOSTTY_DIR="$HOME/.config/ghostty"
CONFIG_FILE="$GHOSTTY_DIR/config"

# Enhanced colors for beautiful UI
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
GRAY='\033[0;90m'
NC='\033[0m' # No Color

# Unicode characters for beautiful UI
CHECKMARK="✅"
ARROW="➤"
STAR="⭐"
LIGHTNING="⚡"
GEAR="⚙️"
ROCKET="🚀"

# Function to clear screen and show header
show_header() {
    clear
    echo -e "${CYAN}╔══════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${CYAN}║                    ${WHITE}${ROCKET} GHOSTTY CONFIGURATION MANAGER${NC} ${CYAN}║${NC}"
    echo -e "${CYAN}║              ${GRAY}Super-automated terminal customization${NC}         ${CYAN}║${NC}"
    echo -e "${CYAN}╚══════════════════════════════════════════════════════════════╝${NC}"
    echo ""
}

# Function to show current configuration status
show_current_config() {
    echo -e "${YELLOW}${GEAR} Current Configuration:${NC}"
    if [[ -f "$CONFIG_FILE" ]]; then
        local theme=$(grep '^theme' "$CONFIG_FILE" | cut -d'=' -f2 | xargs || echo 'custom/unknown')
        local font=$(grep '^font-family' "$CONFIG_FILE" | cut -d'=' -f2 | xargs || echo 'default')
        local opacity=$(grep '^background-opacity' "$CONFIG_FILE" | cut -d'=' -f2 | xargs || echo 'default')

        echo -e "  ${ARROW} Theme: ${GREEN}$theme${NC}"
        echo -e "  ${ARROW} Font: ${GREEN}$font${NC}"
        echo -e "  ${ARROW} Transparency: ${GREEN}$opacity${NC}"
    else
        echo -e "  ${RED}No configuration found${NC}"
    fi
    echo ""
}

# Function to show animated loading
show_loading() {
    local message="$1"
    echo -ne "${YELLOW}$message"
    for i in {1..3}; do
        echo -ne "."
        sleep 0.3
    done
    echo -e " ${GREEN}${CHECKMARK}${NC}"
    sleep 0.5
}

# Function to apply configuration with feedback
apply_config_with_feedback() {
    local config_file="$1"
    local config_name="$2"
    local config_type="$3"

    if [[ -f "$config_file" ]]; then
        show_loading "Applying $config_type: $config_name"
        cp "$config_file" "$CONFIG_FILE"

        echo -e "${GREEN}${CHECKMARK} Configuration applied successfully!${NC}"
        echo -e "${YELLOW}${LIGHTNING} Restart Ghostty to see the changes${NC}"
        echo ""

        # Show what was applied
        echo -e "${CYAN}Applied Settings:${NC}"
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

        read -p "Press Enter to continue..."
        return 0
    else
        echo -e "${RED}❌ Configuration file not found: $config_file${NC}"
        read -p "Press Enter to continue..."
        return 1
    fi
}

# Function to show preset menu with detailed descriptions
show_preset_menu() {
    show_header
    echo -e "${PURPLE}${STAR} CURATED PRESETS - Ready-to-use combinations${NC}"
    echo ""
    echo -e "${WHITE}Choose a preset that matches your coding style:${NC}"
    echo ""

    echo -e "${CYAN}1)${NC} ${GREEN}Cyberpunk Dev${NC}         ${GRAY}(Tokyo Night + Fira Code)${NC}"
    echo -e "   ${ARROW} Perfect for: Modern web development, React/TypeScript"
    echo -e "   ${ARROW} Features: Maximum transparency, neon effects, code ligatures"
    echo ""

    echo -e "${CYAN}2)${NC} ${GREEN}Minimal Focus${NC}         ${GRAY}(Nord + Iosevka)${NC}"
    echo -e "   ${ARROW} Perfect for: Distraction-free productivity, small screens"
    echo -e "   ${ARROW} Features: Clean aesthetics, maximum code density"
    echo ""

    echo -e "${CYAN}3)${NC} ${GREEN}Cozy Coding${NC}           ${GRAY}(Gruvbox + JetBrains Mono)${NC}"
    echo -e "   ${ARROW} Perfect for: Long coding sessions, eye comfort"
    echo -e "   ${ARROW} Features: Warm colors, excellent readability"
    echo ""

    echo -e "${CYAN}4)${NC} ${GREEN}Professional Elegant${NC} ${GRAY}(Dracula + Cascadia Code)${NC}"
    echo -e "   ${ARROW} Perfect for: Corporate environments, client demos"
    echo -e "   ${ARROW} Features: Sophisticated appearance, professional look"
    echo ""

    echo -e "${CYAN}0)${NC} ${YELLOW}Back to main menu${NC}"
    echo ""

    read -p "Choose your preset (0-4): " choice

    case $choice in
        1) apply_config_with_feedback "$GHOSTTY_DIR/presets/cyberpunk-dev.conf" "Cyberpunk Dev" "preset" ;;
        2) apply_config_with_feedback "$GHOSTTY_DIR/presets/minimal-focus.conf" "Minimal Focus" "preset" ;;
        3) apply_config_with_feedback "$GHOSTTY_DIR/presets/cozy-coding.conf" "Cozy Coding" "preset" ;;
        4) apply_config_with_feedback "$GHOSTTY_DIR/presets/professional-elegant.conf" "Professional Elegant" "preset" ;;
        0) return ;;
        *)
            echo -e "${RED}Invalid choice. Please try again.${NC}"
            sleep 1
            show_preset_menu
            ;;
    esac
}

# Function to show theme menu
show_theme_menu() {
    show_header
    echo -e "${BLUE}🌈 THEMES - Color schemes and visual styles${NC}"
    echo ""
    echo -e "${WHITE}Choose a theme that matches your mood:${NC}"
    echo ""

    echo -e "${CYAN}1)${NC} ${GREEN}Catppuccin Mocha${NC}     ${GRAY}(Warm purples, cozy vibes)${NC}"
    echo -e "${CYAN}2)${NC} ${GREEN}Tokyo Night${NC}          ${GRAY}(Cyberpunk blues, electric accents)${NC}"
    echo -e "${CYAN}3)${NC} ${GREEN}Dracula${NC}              ${GRAY}(Gothic elegance, rich purples)${NC}"
    echo -e "${CYAN}4)${NC} ${GREEN}Nord${NC}                 ${GRAY}(Arctic minimalism, cool blues)${NC}"
    echo -e "${CYAN}5)${NC} ${GREEN}Gruvbox${NC}              ${GRAY}(Retro warmth, earth tones)${NC}"
    echo ""
    echo -e "${CYAN}0)${NC} ${YELLOW}Back to main menu${NC}"
    echo ""

    read -p "Choose your theme (0-5): " choice

    case $choice in
        1) apply_config_with_feedback "$GHOSTTY_DIR/themes/catppuccin-mocha.conf" "Catppuccin Mocha" "theme" ;;
        2) apply_config_with_feedback "$GHOSTTY_DIR/themes/tokyo-night.conf" "Tokyo Night" "theme" ;;
        3) apply_config_with_feedback "$GHOSTTY_DIR/themes/dracula.conf" "Dracula" "theme" ;;
        4) apply_config_with_feedback "$GHOSTTY_DIR/themes/nord.conf" "Nord" "theme" ;;
        5) apply_config_with_feedback "$GHOSTTY_DIR/themes/gruvbox.conf" "Gruvbox" "theme" ;;
        0) return ;;
        *)
            echo -e "${RED}Invalid choice. Please try again.${NC}"
            sleep 1
            show_theme_menu
            ;;
    esac
}

# Function to show font menu
show_font_menu() {
    show_header
    echo -e "${PURPLE}🔤 FONTS - Typography for optimal coding${NC}"
    echo ""
    echo -e "${WHITE}Choose a font that enhances your coding experience:${NC}"
    echo ""

    echo -e "${CYAN}1)${NC} ${GREEN}JetBrains Mono${NC}       ${GRAY}(All-around excellence, great readability)${NC}"
    echo -e "${CYAN}2)${NC} ${GREEN}Fira Code${NC}            ${GRAY}(Beautiful ligatures, modern programming)${NC}"
    echo -e "${CYAN}3)${NC} ${GREEN}Cascadia Code${NC}        ${GRAY}(Microsoft modern, professional look)${NC}"
    echo -e "${CYAN}4)${NC} ${GREEN}Iosevka${NC}              ${GRAY}(Ultra-narrow, space-efficient)${NC}"
    echo ""
    echo -e "${CYAN}0)${NC} ${YELLOW}Back to main menu${NC}"
    echo ""

    read -p "Choose your font (0-4): " choice

    case $choice in
        1) apply_font_with_theme "jetbrains-mono" ;;
        2) apply_font_with_theme "fira-code" ;;
        3) apply_font_with_theme "cascadia-code" ;;
        4) apply_font_with_theme "iosevka" ;;
        0) return ;;
        *)
            echo -e "${RED}Invalid choice. Please try again.${NC}"
            sleep 1
            show_font_menu
            ;;
    esac
}

# Function to apply font with base theme
apply_font_with_theme() {
    local font="$1"
    local font_file="$GHOSTTY_DIR/fonts/$font.conf"

    if [[ -f "$font_file" ]]; then
        show_loading "Applying font: $font"

        # Use Catppuccin as base theme and overlay font settings
        cp "$GHOSTTY_DIR/themes/catppuccin-mocha.conf" "$CONFIG_FILE"

        echo "" >> "$CONFIG_FILE"
        echo "# Font override from $font configuration" >> "$CONFIG_FILE"
        grep "^font-" "$font_file" >> "$CONFIG_FILE"
        grep "^minimum-contrast" "$font_file" >> "$CONFIG_FILE" 2>/dev/null || true
        grep "^cursor-" "$font_file" >> "$CONFIG_FILE" 2>/dev/null || true

        echo -e "${GREEN}${CHECKMARK} Font applied with Catppuccin Mocha theme!${NC}"
        echo -e "${YELLOW}${LIGHTNING} Restart Ghostty to see the changes${NC}"
        echo ""
        read -p "Press Enter to continue..."
    else
        echo -e "${RED}❌ Font configuration not found: $font_file${NC}"
        read -p "Press Enter to continue..."
    fi
}

# Function to show about/help
show_about() {
    show_header
    echo -e "${CYAN}${ROCKET} ABOUT GHOSTTY CONFIGURATION MANAGER${NC}"
    echo ""
    echo -e "${WHITE}This tool helps you customize your Ghostty terminal with:${NC}"
    echo ""
    echo -e "  ${CHECKMARK} ${GREEN}4 Curated Presets${NC} - Perfect combinations for different use cases"
    echo -e "  ${CHECKMARK} ${GREEN}5 Beautiful Themes${NC} - From cyberpunk to minimalist aesthetics"
    echo -e "  ${CHECKMARK} ${GREEN}4 Optimized Fonts${NC} - Typography designed for coding"
    echo -e "  ${CHECKMARK} ${GREEN}Instant Switching${NC} - No manual configuration needed"
    echo ""
    echo -e "${YELLOW}How it works:${NC}"
    echo -e "  1. Choose your preferred style from the menus"
    echo -e "  2. The script automatically applies the configuration"
    echo -e "  3. Restart Ghostty to see your new terminal!"
    echo ""
    echo -e "${CYAN}Configuration files are stored in:${NC}"
    echo -e "  ${GRAY}~/.config/ghostty/${NC}"
    echo ""
    echo -e "${PURPLE}Made with ${RED}❤️${NC} ${PURPLE}for terminal enthusiasts${NC}"
    echo ""
    read -p "Press Enter to continue..."
}

# Main menu function
show_main_menu() {
    while true; do
        show_header
        show_current_config

        echo -e "${WHITE}What would you like to do?${NC}"
        echo ""
        echo -e "${CYAN}1)${NC} ${GREEN}${STAR} Apply Curated Preset${NC}     ${GRAY}(Complete ready-to-use combinations)${NC}"
        echo -e "${CYAN}2)${NC} ${BLUE}🌈 Change Theme Only${NC}        ${GRAY}(Color schemes and visual styles)${NC}"
        echo -e "${CYAN}3)${NC} ${PURPLE}🔤 Change Font Only${NC}         ${GRAY}(Typography for coding)${NC}"
        echo -e "${CYAN}4)${NC} ${YELLOW}${GEAR} View Current Config${NC}     ${GRAY}(See what's currently applied)${NC}"
        echo -e "${CYAN}5)${NC} ${CYAN}ℹ️  About & Help${NC}            ${GRAY}(Learn about this tool)${NC}"
        echo -e "${CYAN}0)${NC} ${RED}🚪 Exit${NC}"
        echo ""

        read -p "Choose an option (0-5): " choice

        case $choice in
            1) show_preset_menu ;;
            2) show_theme_menu ;;
            3) show_font_menu ;;
            4)
                show_header
                show_current_config
                if [[ -f "$CONFIG_FILE" ]]; then
                    echo -e "${CYAN}Full configuration preview:${NC}"
                    echo -e "${GRAY}────────────────────────────────────${NC}"
                    head -20 "$CONFIG_FILE" | sed 's/^/  /'
                    echo -e "${GRAY}────────────────────────────────────${NC}"
                fi
                echo ""
                read -p "Press Enter to continue..."
                ;;
            5) show_about ;;
            0)
                echo -e "${GREEN}Thanks for using Ghostty Configuration Manager!${NC}"
                echo -e "${YELLOW}${LIGHTNING} Don't forget to restart Ghostty to see your changes${NC}"
                exit 0
                ;;
            *)
                echo -e "${RED}Invalid choice. Please try again.${NC}"
                sleep 1
                ;;
        esac
    done
}

# Check if ghostty directory exists
if [[ ! -d "$GHOSTTY_DIR" ]]; then
    echo -e "${RED}❌ Ghostty configuration directory not found!${NC}"
    echo -e "${YELLOW}Creating directory: $GHOSTTY_DIR${NC}"
    mkdir -p "$GHOSTTY_DIR"
fi

# Start the interactive menu
show_main_menu