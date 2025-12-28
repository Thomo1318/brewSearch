# BrewSearch Codebase Reference

A **bash-based** Homebrew search utility offering real-time progress indicators, theming, separators, and a Nerd Font setup wizard. The repository follows a **modular design**, separating executables (`bin/`), reusable libraries (`lib/`), and configuration (`config/`).

---

## 🎯 Main Executable: `bin/brewsearch`

Handles user input, dispatches subcommands, and orchestrates the search workflow.

```bash
#!/usr/bin/env bash
###***brewsearch***###
# Resolve symlinks to find SCRIPT_DIR and PROJECT_ROOT
# Dispatch subcommands: theme, separator, font
# Source libraries: colors, progress, search, format
# Load user config if present
# Validate arguments and display usage hints
# Show progress and gather formulae & casks
# Render results with colored sections and separators
```

- **Subcommand dispatch**:  
  - `bs theme` → `bin/theme`  
  - `bs separator` → `bin/theme-separator`  
  - `bs font` → `bin/font-setup`   
- **Libraries sourced**:  
  - `lib/colors.sh`  
  - `lib/progress.sh`  
  - `lib/search.sh`  
  - `lib/format.sh`  
- **Workflow**:  
  1. Validate input  
  2. Show fancy header  
  3. Display progress bar  
  4. Invoke `search_formulae` & `search_casks`  
  5. Format and colorize output  

---

## 📦 Installer: `bin/install`

Automates symlink creation for easy access (`bs` command), ensuring proper `~/.local/bin` setup.

```bash
#!/usr/bin/env bash
###***install-brewsearch***###
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
INSTALL_DIR="$HOME/.local/bin"
SYMLINK_PATH="$INSTALL_DIR/bs"
TARGET="$PROJECT_ROOT/bin/brewsearch"
# Create ~/ .local/bin if missing
# Handle existing symlink or file conflicts
# Create new symlink and verify PATH inclusion
```

- **Key steps**:  
  - Ensure `~/.local/bin` exists  
  - Detect and replace conflicting symlinks  
  - Warn if `~/.local/bin` is not in `$PATH`  
  - Provide next steps (reload shell, `hash -r`)   

---

## 🎉 Font Setup Wizard: `bin/font-setup`

Interactive guide to detect, install, or patch Nerd Fonts—**recommended** for optimal icon support.

```bash
#!/usr/bin/env bash
###***font-setup***###
# Define ANSI color codes (GREEN, YELLOW, RED, BLUE, CYAN, NC)
# Display header and current Terminal font via AppleScript
# Detect if FiraCode Nerd Font is installed
# Present a 6-option menu for installation choices
```

| Option | Description                                                       |
|:------:|-------------------------------------------------------------------|
| 1 🚀   | **Auto-install** FiraCode Nerd Font Mono via Homebrew Cask        |
| 2      | Browse fonts at programmingfonts.org                              |
| 3      | **Homebrew commands** for manual cask installation                |
| 4      | **Manual guide** to download & install from Nerd Fonts website    |
| 5      | **Advanced**: Patch existing fonts using Font Patcher script      |
| 6      | Continue with your **current** font (no changes)                  |

- **Color-coded feedback**: Success (✓), warning (⚠), error (✗)  
- **Step-by-step instructions** after installation   

---

## 🎨 Theme Selector: `bin/theme`

Lets users browse and apply one of 27 color themes, split into **Light** and **Dark** categories.

```bash
#!/usr/bin/env bash
###***theme-selector***###
THEMES_FILE="$PROJECT_ROOT/config/themes.conf"
DEFAULTS_FILE="$PROJECT_ROOT/config/defaults.conf"
# Load definitions, then list LIGHT_THEMES and DARK_THEMES arrays
# Display numbered menu; apply selection by updating defaults.conf
```

- **Features**:  
  - Organized display of Light vs Dark themes  
  - Flexible input by name or number  
  - Persists choice in `config/defaults.conf`   
- **Example usage**:  
  ```bash
  bs theme          # Show all themes
  bs theme dracula  # Apply Dracula theme
  ```

---

## 🔧 Requirements Checker: `bin/check-requirements`

Validates system prerequisites and offers guidance to resolve missing dependencies.

```bash
#!/usr/bin/env bash
###***check-requirements***###
set -e
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
source "$PROJECT_ROOT/lib/colors.sh"
# Counters: MISSING_COUNT, INSTALLED_COUNT
# Functions: command_exists(), print_status()
# Checks:
#   • Bash ≥4.0
#   • Homebrew installed
#   • Optional package managers (mise, uv)
#   • Core utilities (grep, xargs)
#   • Presence of .env and EXA_API_KEY
# Summarize results and next steps
```

- **Dependency checks**:  
  - Bash version and alternative Homebrew Bash  
  - Homebrew availability  
  - Environment management tools (mise, uv)  
  - Core Unix utilities (`grep`, `xargs`)  
  - `.env` configuration file and keys  
- **Outcome**:  
  - **Success**: “All required dependencies are installed!”  
  - **Error/Warning**: Instructions to install missing items   

```card
{
  "title": "Prerequisite Highlight",
  "content": "Bash 4.0+ and Homebrew are **required**. Run this script before other steps."
}
```

---

## 🛠️ Libraries (`lib/`)

Reusable shell functions that power the core functionality.

### `lib/progress.sh`

Provides a dynamic, in-terminal progress bar.

- **Functions**:  
  - `show_progress(current, total, message)`  
  - `clear_progress()` to end the bar display

### `lib/search.sh`

Encapsulates Homebrew search commands.

- `search_formulae(query)`: `brew search --formula "$query"`  
- `search_casks(query)`: `brew search --cask "$query"`

### `lib/format.sh`

Handles output formatting for clean presentation.

- `print_separator()`: Inserts a styled separator line  
- `print_section_header(title)`: Prints `***title***` with underline

---

## ⚙️ Configuration (`config/`)

Stores persistent settings for theming, separators, and defaults.

- **`defaults.conf`**  
  | Setting                | Purpose                           | Default                                                      |
  |------------------------|-----------------------------------|--------------------------------------------------------------|
  | `PROGRESS_BAR_LENGTH`  | Length of the progress bar        | `20`                                                         |
  | `PROGRESS_UPDATE_DELAY`| Delay between updates (seconds)   | `0.5`                                                        |
  | `SHOW_SEPARATORS`      | Toggle result separators          | `true`                                                       |
  | `SEPARATOR_STYLE`      | Pattern for separators            | `***--------------------------------------------------------------------***` |

- **`themes.conf`**  
  Defines 27 theme color mappings (loaded by `bin/theme`).  

---

By combining a clear **command dispatch** (`bin/brewsearch`), **helper scripts**, and **modular libraries**, BrewSearch delivers a rich, customizable CLI experience for Homebrew enthusiasts.