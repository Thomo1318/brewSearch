# Theme Selector Script for BrewSearch

This Bash script provides an interactive way to choose and apply color themes in the BrewSearch CLI. It reads theme definitions, previews colors, and updates the default configuration.

## Script Location and Execution

The selector lives at `bin/theme`.  
It starts with a Bash shebang and resolves its own path to locate project files .

```bash
#!/usr/bin/env bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
THEMES_FILE="$PROJECT_ROOT/config/themes.conf"
DEFAULTS_FILE="$PROJECT_ROOT/config/defaults.conf"
```

## Configuration Files

This script depends on two key files:

- **`config/themes.conf`**: Defines every theme’s six RGB color values .  
- **`config/defaults.conf`**: Stores the active theme and related settings.

## Themes 🎨

The script groups themes into **Light** and **Dark** categories for easy browsing. It supports 2 light and 25 dark themes.

### Light Themes

| ID             | Name           |
| -------------- | -------------- |
| `nord_light`   | Nord Light     |
| `vercel_light` | Vercel Light   |

### Dark Themes

| ID                     | Name                                 |
| ---------------------- | ------------------------------------ |
| `default`              | Default (Custom Purple/Pink/Cyan)    |
| `dracula`              | Dracula                              |
| `nord`                 | Nord                                 |
| `gruvbox`              | Gruvbox                              |
| `monokai`              | Monokai                              |
| `solarized`            | Solarized Dark                       |
| `tokyo`                | Tokyo Night                          |
| `catppuccin`           | Catppuccin Mocha                     |
| `onedark`              | One Dark                             |
| `synthwave`            | Synthwave ’84                        |
| `vue`                  | Vue                                  |
| `liveblocks`           | Liveblocks                           |
| `codesandbox`          | CodeSandbox                          |
| `chrome`               | Chrome                               |
| `tailwind_css`         | Tailwind CSS                         |
| `bluesky`              | Bluesky                              |
| `dawn`                 | Dawn                                 |
| `linear`               | Linear                               |
| `monochrome`           | Monochrome                           |
| `duotone_dark_sea`     | Duotone – Dark Sea                   |
| `duotone_dark_space`   | Duotone – Dark Space                 |
| `duotone_dark_forest`  | Duotone – Dark Forest                |
| `duotone_dark_sky`     | Duotone – Dark Sky                   |
| `duotone_dark_earth`   | Duotone – Dark Earth                 |

## Core Functions ⚙️

### `show_theme_preview`

Displays two rows of six colored blocks representing a theme’s palette.

```bash
show_theme_preview() {
  local theme=$1
  local theme_upper=$(echo "$theme" | tr '[:lower:]' '[:upper:]')
  local c1=$(eval echo \$THEME_${theme_upper}_1)
  local c2=$(eval echo \$THEME_${theme_upper}_2)
  # ... fetch c3–c6 ...
  echo -e " ${c1_color}███${nc} ${c2_color}███${nc} ${c3_color}███${nc} ${c4_color}███${nc} ${c5_color}███${nc} ${c6_color}███${nc}"
  echo -e " ${c1_color}▓▓▓${nc} ${c2_color}▓▓▓${nc} ${c3_color}▓▓▓${nc} ${c4_color}▓▓▓${nc} ${c5_color}▓▓▓${nc} ${c6_color}▓▓▓${nc}"
}
```

This uses `eval` to read RGB values from `themes.conf` and ANSI escape codes for true-color output .

### `apply_theme`

Writes the selected theme’s colors into `defaults.conf` and confirms success.

```bash
apply_theme() {
  local theme=$1
  local theme_upper=$(echo "$theme" | tr '[:lower:]' '[:upper:]')
  local c1=$(eval echo \$THEME_${theme_upper}_1)
  # ... fetch c2–c6 ...
  cat > "$DEFAULTS_FILE" << CONF
# BrewSearch Configuration
# Current theme: $theme
PROGRESS_BAR_LENGTH=30
PROGRESS_UPDATE_DELAY=0.2
SHOW_SEPARATORS=true
SEPARATOR_STYLE="***━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━***"
THEME_COLOR_1='${c1}'
# ... rest of colors ...
CONF
  echo "✓ Theme '$theme' applied successfully!"
}
```

This section uses a here-document to overwrite the defaults and make the new theme persistent .

## Usage

- Running `bs theme` with no arguments shows the interactive menu.  
- Supplying a **number** applies the theme at that position.  
- Supplying a **theme name** (case-insensitive, spaces/hyphens normalized) applies that theme.

```bash
# Show menu
bs theme

# Apply by name
bs theme dracula

# Apply by number
bs theme 2
```

If an invalid input is given, the script prints an error and hints at running `bs theme` again.

## Adding Custom Themes ✏️

1. **Define Colors** in `config/themes.conf`:  
   ```bash
   THEME_MYTHEME_1='R;G;B'
   # ... through THEME_MYTHEME_6 ...
   ```
2. **Register** in `bin/theme` by appending  
   ```bash
   LIGHT_THEMES+=( "mytheme:My Custom Theme" )
   ```
   or to `DARK_THEMES` .  
3. **Apply** with  
   ```bash
   bs theme mytheme
   ```

## Dependencies & Requirements

- **Bash 4.0+** with true-color support.  
- A **256/24-bit terminal** (`$COLORTERM=truecolor`).  
- Presence of `config/themes.conf` and write permission for `config/defaults.conf`.

---

By centralizing theme variables and using a unified selector, BrewSearch offers flexible and immediate customization of its UI colors. Adjust or extend this system to match your favorite palettes and workflows.