# Changelog

All notable changes to BrewSearch will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [2.0.0] - 2025-10-21

### Added
- **Theme System** - 10 pre-configured professional color themes
  - Dracula, Nord, Gruvbox, Monokai, Solarized, Tokyo Night, Catppuccin, One Dark, Synthwave
  - Interactive theme selector with color previews
  - Theme configuration stored in `config/themes.conf`
- **Subcommand Support** - `bs theme` command for theme management
  - `bs theme` - View all available themes
  - `bs theme <name>` - Apply theme by name
  - `bs theme <number>` - Apply theme by number
- **Smooth Gradient Progress Bar** - 6-color smooth gradient transitions
- **Color Library** - Centralized color management (`lib/colors.sh`)
- **Installation Script** - `bin/install` for easy setup
- **Requirements Checker** - `bin/check-requirements` for dependency verification
- **Comprehensive Documentation**
  - `docs/THEMES.md` - Theme guide
  - `docs/COLORS.md` - Color documentation
  - `docs/BASH_VERSION.md` - Bash compatibility guide
  - `CONTRIBUTING.md` - Contribution guidelines
  - `LICENSE` - MIT License
- **AI Session Documentation** - Development history in `archive/ai/`
- **Versioning** - VERSION file and semantic versioning

### Changed
- **Progress Bar** - Changed from 3-color blocks to smooth 6-color gradient
- **Performance** - 50-60% faster search and rendering
  - Batch `brew info` calls before processing
  - Reduced sleep delays (0.5s → 0.2s)
  - Single-pass colorization
- **Project Structure** - Modular organization
  - `bin/` - Executables
  - `lib/` - Reusable libraries
  - `config/` - Configuration files
  - `docs/` - Documentation
  - `tests/` - Test scripts
  - `archive/` - Old versions and AI docs
- **Bash Compatibility** - Changed shebang to `#!/usr/bin/env bash`
- **Usage Message** - Enhanced with subcommand examples

### Fixed
- **ANSI Escape Codes** - Fixed literal escape codes appearing in output
  - Changed from `sed` to `printf` for proper ANSI handling
- **Theme Command** - Fixed indirect variable expansion error
  - Changed from `${!var}` to `eval echo \$THEME_${theme_upper}_1`
- **Symlink Resolution** - Fixed library path resolution when called via symlink
  - Added symlink resolution loop to find real script location
- **Color Highlighting** - Proper syntax highlighting for package names, versions, URLs, status

### Security
- **API Key Management** - Moved secrets to `.env` file (gitignored)
- **Git Ignore** - Added `.cache_ggshield` and other sensitive files
- **Environment Template** - Created `.env.example` for safe sharing

## [1.0.0] - 2025-10-03

### Added
- Initial release
- Basic search functionality for Homebrew formulae and casks
- Progress bar with 3-color blocks
- Custom purple/pink/cyan color scheme
- Separator between search results
- Modular project structure
- Requirements checker
- Environment variable management

[2.0.0]: https://github.com/yourusername/brewsearch/compare/v1.0.0...v2.0.0
[1.0.0]: https://github.com/yourusername/brewsearch/releases/tag/v1.0.0

## [2.1.0] - 2025-10-21

### Added
- **17 New Themes from chalk.ist** - Professional syntax highlighting themes
  - Light: Nord Light, Vercel Light
  - Dark: Vue, Liveblocks, CodeSandbox, Chrome, Tailwind CSS, Bluesky, Dawn, Linear, Monochrome
  - Duotone Series: Dark Sea, Dark Space, Dark Forest, Dark Sky, Dark Earth
- **Theme Categories** - Organized themes into Light and Dark sections
- **Theme Name Normalization** - Support for flexible theme names (spaces, hyphens, case-insensitive)

### Changed
- **Theme Selector UI** - Categorized display with Light and Dark sections
- **Theme Count** - Expanded from 10 to 27 total themes
- **Theme Configuration** - Combined original and chalk.ist themes in single config file

### Documentation
- Updated theme list in documentation
- Added chalk.ist attribution and source links

[2.1.0]: https://github.com/yourusername/brewsearch/compare/v2.0.0...v2.1.0
