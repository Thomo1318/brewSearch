# BrewSearch v2.2.0 - Font Setup & Separator Customization

## 🎨 What's New

### Font Setup Wizard (`bs font`)
Interactive Nerd Font installation with multiple options:

- **🚀 Auto-Install** - One-command FiraCode Nerd Font Mono installation via Homebrew
- **🌐 Browse Fonts** - Opens programmingfonts.org to preview and select fonts
- **📦 Homebrew Commands** - Ready-to-use commands for popular Nerd Fonts
- **📖 Manual Guide** - Step-by-step installation instructions
- **🔧 Font Patcher** - Advanced option to patch existing fonts with Nerd Font icons
- **✨ Current Font Detection** - Shows your current terminal font

### Separator Customization (`bs separator`)
Choose from 11 beautiful separator styles:

1. **Default** - Stars + Line: `***━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━***`
2. **Double Line** - `═══════════════════════════════════════════════════════════════════════`
3. **Dashed** - `- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -`
4. **Dotted** - `· · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · ·`
5. **Wave** - `~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~`
6. **Stars** - `***********************************************************************`
7. **Arrows** - `>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>`
8. **Diamonds** - `◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆`
9. **Heavy Line** - `━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━`
10. **Mixed** - `▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬`
11. **None** - No separator between results

### Enhanced Subcommand System
```bash
bs <package>        # Search for Homebrew packages
bs theme            # View and apply color themes (27 themes)
bs separator        # View and apply separator styles (11 styles)
bs font             # Setup Nerd Fonts
```

## 🐛 Bug Fixes

- Fixed separator format to include `***` markers at start and end
- Improved configuration persistence for separator styles

## 📚 Documentation

- Added comprehensive font setup guide
- Documented all separator styles with visual previews
- Updated usage examples with new subcommands

## 🚀 Quick Start

```bash
# Install BrewSearch
git clone <repository-url> brewsearch
cd brewsearch
./bin/install

# Setup recommended font
bs font

# Customize your experience
bs theme            # Choose from 27 themes
bs separator        # Choose from 11 separator styles

# Search packages
bs redis
```

## 📦 Installation

### New Installation
```bash
git clone <repository-url> brewsearch
cd brewsearch
./bin/install
source ~/.zshrc
```

### Upgrade from Previous Version
```bash
cd brewsearch
git pull origin main
```

## 🎯 Usage Examples

### Font Setup
```bash
bs font
# Follow the interactive wizard to:
# - Auto-install FiraCode Nerd Font Mono
# - Browse and select from programmingfonts.org
# - Get Homebrew installation commands
# - Access manual installation guide
# - Patch existing fonts (advanced)
```

### Separator Customization
```bash
bs separator        # View all 11 separator styles
bs separator 5      # Apply wave separator
bs separator 11     # Remove separator
```

### Theme Selection
```bash
bs theme            # View all 27 themes
bs theme bluesky    # Apply Bluesky theme
bs theme 15         # Apply theme by number
```

### Package Search
```bash
bs redis            # Search for redis packages
bs python           # Search for python packages
bs docker           # Search for docker packages
```

## 🎨 Features Summary

- **27 Color Themes** - Including chalk.ist themes (Bluesky, Vue, Tailwind CSS, etc.)
- **11 Separator Styles** - Customize result separators
- **Font Setup Wizard** - Easy Nerd Font installation
- **Smooth Gradients** - 6-color gradient progress bars
- **Fast Performance** - 50-60% faster than v1.0
- **Modular Design** - Clean, maintainable codebase

## 🔧 Requirements

- **Bash 4.0+** (Homebrew Bash recommended on macOS)
- **Homebrew** - Package manager for macOS/Linux
- **Nerd Font** (Recommended) - For best visual experience

## 📝 Changelog

See [CHANGELOG.md](CHANGELOG.md) for detailed changes.

## 🙏 Credits

- Themes extracted from [chalk.ist](https://chalk.ist) by @mrmartineau
- Original themes: Dracula, Nord, Gruvbox, Monokai, Solarized, Tokyo Night, Catppuccin, One Dark, Synthwave
- Font recommendations from [Nerd Fonts](https://www.nerdfonts.com)

## 🐛 Known Issues

None reported for this release.

## 📮 Feedback

Found a bug or have a feature request? Please open an issue on GitHub!

---

**Full Changelog**: v2.1.0...v2.2.0
