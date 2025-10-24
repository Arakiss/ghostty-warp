# Contributing to Ghostty Config

Thank you for considering contributing to this project! 🎉

## 🤝 How to Contribute

### Reporting Issues

- Use GitHub Issues to report bugs or suggest features
- Describe the issue clearly with steps to reproduce
- Include your OS version and Ghostty version
- Share relevant configuration files if applicable

### Submitting Changes

1. **Fork the repository**
2. **Create a feature branch**: `git checkout -b feature/my-new-feature`
3. **Make your changes**
4. **Test thoroughly** on your machine
5. **Commit with clear message**: `git commit -m "Add: new theme XYZ"`
6. **Push to your fork**: `git push origin feature/my-new-feature`
7. **Open a Pull Request**

## 📝 Contribution Guidelines

### Adding New Themes

```bash
# 1. Create theme file
themes/my-theme.conf

# 2. Follow existing format
# - Include header comments
# - Document color choices
# - Add configuration options

# 3. Test theme
gconfig theme my-theme

# 4. Submit PR with screenshot
```

### Adding New Presets

```bash
# 1. Create preset file
presets/my-preset.conf

# 2. Combine theme + font + settings
# - Choose complementary theme and font
# - Configure transparency, padding, etc.
# - Document use case

# 3. Test preset
gconfig preset my-preset

# 4. Submit PR with description and screenshot
```

### Improving Scripts

- Keep scripts portable (avoid machine-specific paths)
- Add error handling
- Include help messages
- Test on clean macOS installation
- Document any dependencies

### Documentation

- Update README.md if adding features
- Keep QUICKSTART.md concise
- Add examples for new functionality
- Fix typos or improve clarity

## 🎨 Style Guide

### Shell Scripts

```bash
# Use descriptive variable names
GHOSTTY_CONFIG_DIR="$HOME/.config/ghostty"

# Add comments for complex logic
# This function validates user input
function validate_input() {
    # ...
}

# Use error handling
set -e  # Exit on error
```

### Configuration Files

```conf
# Use clear section headers
# ==============================================
# SECTION NAME
# ==============================================

# Document each setting
font-size = 13               # Recommended range: 11-16

# Group related settings
window-padding-x = 16
window-padding-y = 12
```

### Commit Messages

Use conventional commit format:

```
Add: new Tokyo Night Storm theme
Fix: sync script not handling spaces in paths
Update: README with installation troubleshooting
Docs: improve quickstart guide
Refactor: simplify preset switching logic
```

## 🧪 Testing

Before submitting:

- [ ] Test on clean macOS installation (if possible)
- [ ] Verify all scripts are executable (`chmod +x`)
- [ ] Check that configurations load without errors
- [ ] Test sync scripts (to-repo and from-repo)
- [ ] Ensure documentation is up to date

## 🚫 What Not to Contribute

- Machine-specific configurations (use local overrides)
- Personal API keys or secrets
- Large binary files
- Copyrighted themes without permission
- Breaking changes without discussion

## 💡 Ideas for Contributions

### High Priority

- [ ] Linux support (test and document)
- [ ] Windows support (if feasible)
- [ ] More themes (Solarized, One Dark, etc.)
- [ ] More presets (gaming, presentations, etc.)
- [ ] Better error messages in scripts

### Nice to Have

- [ ] Interactive theme builder
- [ ] Theme preview generator (screenshots)
- [ ] Configuration validator
- [ ] Font recommendation tool
- [ ] Export/import configurations
- [ ] Automated testing

## 🎓 Getting Help

- **Questions?** Open a GitHub Discussion
- **Bug reports?** Open a GitHub Issue
- **Feature ideas?** Open a GitHub Issue with "enhancement" label
- **Documentation unclear?** Open an issue or PR with improvements

## 📜 Code of Conduct

- Be respectful and constructive
- Help others learn
- Accept feedback gracefully
- Focus on what's best for the community
- Assume good intentions

## 🌟 Recognition

Contributors will be:
- Listed in repository contributors
- Mentioned in release notes (for significant contributions)
- Credited in documentation (for major features)

## 📄 License

By contributing, you agree that your contributions will be licensed under the MIT License.

---

**Thank you for making this project better!** 🚀
