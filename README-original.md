# 🚀 Ghostty Configuration System

Complete configuration system for the **Ghostty** terminal with multiple themes, fonts, and optimized presets.

## 📁 System Structure

```
~/.config/ghostty/
├── config                    # Current active configuration
├── switch-config.sh          # Intelligent switching script
├── themes/                   # Theme configurations
│   ├── catppuccin-mocha.conf # Modern & cozy theme
│   ├── tokyo-night.conf      # Cyberpunk vibes
│   ├── dracula.conf          # Classic gothic elegance
│   ├── nord.conf             # Arctic minimalism
│   └── gruvbox.conf          # Retro warmth
├── fonts/                    # Font configurations
│   ├── jetbrains-mono.conf   # Excellent all-around
│   ├── fira-code.conf        # Beautiful ligatures
│   ├── cascadia-code.conf    # Microsoft modern
│   └── iosevka.conf          # Ultra-narrow, efficient
└── presets/                  # Optimized combinations
    ├── cyberpunk-dev.conf    # Tokyo Night + Fira Code
    ├── minimal-focus.conf    # Nord + Iosevka
    ├── cozy-coding.conf      # Gruvbox + JetBrains Mono
    └── professional-elegant.conf # Dracula + Cascadia Code
```

## 🎨 Available Presets

### 🌟 **Cyberpunk Dev**
- **Combination**: Tokyo Night + Fira Code
- **Perfect for**: Modern web development, React/TypeScript
- **Features**: Maximum transparency, neon effects, full ligatures

### 🧘 **Minimal Focus**
- **Combination**: Nord + Iosevka
- **Perfect for**: Distraction-free productivity, small screens
- **Features**: Ultra-minimalist, maximum code density

### ☕ **Cozy Coding**
- **Combination**: Gruvbox + JetBrains Mono
- **Perfect for**: Long sessions, visual comfort
- **Features**: Warm colors, maximum readability

### 💼 **Professional Elegant**
- **Combination**: Dracula + Cascadia Code
- **Perfect for**: Corporate environments, client demos
- **Features**: Sophisticated elegance, professional appearance

## 🛠️ System Usage

### Quick Switching with Script

```bash
# Apply complete preset
~/.config/ghostty/switch-config.sh preset cyberpunk-dev

# Change theme only
~/.config/ghostty/switch-config.sh theme tokyo-night

# Change font only
~/.config/ghostty/switch-config.sh font fira-code

# View current configuration
~/.config/ghostty/switch-config.sh current

# View all options
~/.config/ghostty/switch-config.sh
```

### Recommended Aliases (Optional)

Add to your `~/.zshrc` or `~/.bashrc`:

```bash
alias gconfig="~/.config/ghostty/switch-config.sh"
alias gcyber="~/.config/ghostty/switch-config.sh preset cyberpunk-dev"
alias gminimal="~/.config/ghostty/switch-config.sh preset minimal-focus"
alias gcozy="~/.config/ghostty/switch-config.sh preset cozy-coding"
alias gpro="~/.config/ghostty/switch-config.sh preset professional-elegant"
```

## 🎯 Theme Characteristics

### 🌙 **Catppuccin Mocha**
- **Colors**: Warm purples, soft pastels
- **Transparency**: 92% with moderate blur
- **Ideal for**: Night sessions, relaxed coding

### 🌃 **Tokyo Night**
- **Colors**: Deep blues, electric accents
- **Transparency**: 88% with intense blur
- **Ideal for**: Cyberpunk aesthetic, night development

### 🧛 **Dracula**
- **Colors**: Rich purples, red accents
- **Transparency**: 94% with subtle blur
- **Ideal for**: Classic elegance, gothic atmosphere

### 🏔️ **Nord**
- **Colors**: Cool blues, snow whites
- **Transparency**: 96% with minimal blur
- **Ideal for**: Minimalism, visual cleanliness

### 🍂 **Gruvbox**
- **Colors**: Warm browns, vintage yellows
- **Transparency**: 93% with medium blur
- **Ideal for**: Visual comfort, long sessions

## 🔤 Font Characteristics

### ⚡ **JetBrains Mono**
- **Type**: All-around, professional
- **Ligatures**: Optional
- **Optimal size**: 13px
- **Ideal for**: General use, maximum readability

### 🔗 **Fira Code**
- **Type**: Programming-focused
- **Ligatures**: Extensive and beautiful
- **Optimal size**: 13px
- **Ideal for**: Modern JavaScript/TypeScript, React

### 💼 **Cascadia Code**
- **Type**: Microsoft modern
- **Ligatures**: Selected
- **Optimal size**: 13px
- **Ideal for**: Professional development, VS Code

### 📏 **Iosevka**
- **Type**: Ultra-narrow, efficient
- **Ligatures**: Basic
- **Optimal size**: 14px
- **Ideal for**: Small screens, maximum density

## ⚙️ Configuration Options Explained

### Transparency and Effects
```conf
background-opacity = 0.92    # 0.0 (transparent) - 1.0 (opaque)
background-blur = 15         # 0 (no blur) - 50+ (very blurred)
```

### Typography
```conf
font-family = "JetBrains Mono"
font-size = 13               # Recommended range: 11-16
font-thicken = true          # Improves readability on retina displays
```

### Cursor
```conf
cursor-style = bar           # bar, block, underline
cursor-opacity = 1.0         # 0.0 (invisible) - 1.0 (solid)
```

### Window
```conf
window-padding-x = 12        # Horizontal spacing
window-padding-y = 8         # Vertical spacing
macos-titlebar-style = hidden # hidden, transparent, opaque
```

## 🔧 Advanced Customization

### Create Your Own Preset

1. Copy a base configuration:
```bash
cp ~/.config/ghostty/presets/cozy-coding.conf ~/.config/ghostty/presets/my-preset.conf
```

2. Edit according to your preferences

3. Add to script (optional):
```bash
# Edit ~/.config/ghostty/switch-config.sh
# Add "my-preset" to the show_presets() function
```

### Modify Existing Configurations

All configurations have detailed comments with **AI notes** for future modifications.

## 🚨 Important Notes

- **Restart required**: Ghostty must be restarted to apply changes
- **Automatic backup**: Script overwrites `config` - no automatic backup
- **Compatibility**: Tested on macOS, should work on Linux
- **Dependencies**: Only requires Ghostty installed

## 🎓 Guide for Future AI Usage

### File Structure
- `themes/`: Pure theme configurations
- `fonts/`: Pure font configurations
- `presets/`: Optimized theme+font combinations
- `switch-config.sh`: Intelligent switching script

### Adding New Theme
1. Create file in `themes/name.conf`
2. Include comments with "AI NOTES FOR FUTURE MODIFICATION"
3. Add to `show_themes()` function in script
4. Test application with `./switch-config.sh theme name`

### Adding New Font
1. Create file in `fonts/name.conf`
2. Include optimized configurations for that font
3. Add to `show_fonts()` function in script
4. Create recommended preset combining with theme

### Modifying Configurations
- All files include detailed technical notes
- Recommended value ranges are documented
- Specific visual effects are explained
- Well-working combinations are marked

## 🎨 Visual Examples

- **Cyberpunk**: High transparency, intense blur, visible ligatures
- **Minimal**: High transparency, minimal blur, narrow font
- **Cozy**: Medium transparency, moderate blur, thick font
- **Professional**: Moderate transparency, subtle effects

Enjoy your fully customized Ghostty terminal! 🚀