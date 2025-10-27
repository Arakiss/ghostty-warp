# Recent Improvements

This document tracks the latest improvements made to ghostty-warp.

## October 27, 2025 - Major Feature Update

### 🔤 Automatic Font Installation

**Problem Solved:** Users had to manually install Nerd Fonts, which was tedious and error-prone.

**Solution:**
- ✅ Updated `Brewfile` to automatically install all required Nerd Fonts
- ✅ Created dedicated `install-fonts.sh` script for standalone font installation
- ✅ Fonts now install automatically when running `./install-deps.sh`

**Fonts Included:**
- JetBrains Mono Nerd Font (Cyberpunk Dev preset)
- Fira Code Nerd Font
- Cascadia Code Nerd Font (Professional Elegant preset)
- Iosevka Nerd Font (Minimal Focus preset)

### ⌨️ Comprehensive Keybindings

**Problem Solved:** Only the main config had the shift+enter keybind. Other presets were missing this and other productivity keybindings.

**Solution:** Added complete productivity keybindings to ALL presets (Cyberpunk Dev, Minimal Focus, Cozy Coding, Professional Elegant)

**Keybindings Added:**

#### Text Operations
- `Shift+Enter` - New line (escape sequence for multiline commands)
- `Cmd+C` - Copy to clipboard
- `Cmd+V` - Paste from clipboard

#### Font Size Control
- `Cmd++` - Increase font size
- `Cmd+-` - Decrease font size
- `Cmd+0` - Reset font size to default

#### Navigation
- `Cmd+K` - Clear screen and scrollback
- `Cmd+T` - New tab
- `Cmd+W` - Close current surface

#### Split Management
- `Cmd+D` - New split (right/vertical)
- `Cmd+Shift+D` - New split (down/horizontal)
- `Cmd+Shift+Enter` - Toggle split zoom (focus/unfocus)

#### Tab Navigation
- `Cmd+1` through `Cmd+9` - Jump to tab 1-9

### 📦 Files Modified

**Configuration Files:**
- `config` - Main config (Cyberpunk Dev preset)
- `presets/minimal-focus.conf`
- `presets/cozy-coding.conf`
- `presets/professional-elegant.conf`

**Build/Install Files:**
- `Brewfile` - Added Nerd Fonts
- `install-fonts.sh` - New standalone font installer

### 🎯 Impact

**Before:**
- ❌ Users had to manually install fonts
- ❌ Inconsistent keybindings across presets
- ❌ Missing productivity shortcuts

**After:**
- ✅ Zero-configuration font installation
- ✅ Consistent, powerful keybindings across all presets
- ✅ Full productivity shortcuts in every preset

### 🚀 How to Apply

**For New Installations:**
```bash
git clone https://github.com/Arakiss/ghostty-warp.git
cd ghostty-warp
./install-deps.sh  # Now includes fonts!
./setup-complete.sh
```

**For Existing Installations:**
```bash
cd ghostty-warp
git pull
./install-fonts.sh  # Install missing fonts
./setup-complete.sh  # Update configs
```

### 🙏 Credits

- Keybind suggestion (shift+enter) from **@Adonay**

---

## Future Improvement Ideas

**Potential Enhancements:**
- [ ] Global quick terminal keybind (`global:cmd+grave=toggle_quick_terminal`)
- [ ] URL detection keybinds
- [ ] Custom color schemes per preset
- [ ] Screenshot/recording keybinds
- [ ] Emacs-style split sequences (like `Ctrl+X>2`)
- [ ] Theme switcher keybind
- [ ] Copy URL under cursor keybind
- [ ] Shell integration enhancements

**Want to contribute?** Check [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines!
