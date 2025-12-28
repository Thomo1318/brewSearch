# Separator Style Selector 🛠️

The **bin/theme-separator** script allows users to customize the visual separator between search results in BrewSearch. It presents an interactive menu of 11 styles, applies the chosen style to the configuration, and ensures the setting persists across runs .

## Overview

- **Purpose:** Let users pick how results are visually separated (e.g., stars, lines, waves).
- **Context:** Invoked via the `bs separator` subcommand in the main BrewSearch script .
- **Key Actions:**
  - Display menu when no argument is provided.
  - Update `config/defaults.conf` with the selected separator.
  - Support “no separator” to remove any dividers.

## Invocation

Run directly or through the `bs` command:

```bash
# View available styles
bs separator

# Apply style 5 (Wave)
bs separator 5

# Remove separator entirely
bs separator 11
```

Internally, **bin/brewsearch** routes `separator` to this script, stripping the first argument before execution .

## Configuration Files

| Variable       | Path                                    | Purpose                                 |
| -------------- | --------------------------------------- | --------------------------------------- |
| `THEMES_FILE`  | `<project_root>/config/themes.conf`     | Loaded for consistency (not modified)  |
| `DEFAULTS_FILE`| `<project_root>/config/defaults.conf`   | Stores `SEPARATOR_STYLE` setting       |

These are defined at the top of the script:

```bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
THEMES_FILE="$PROJECT_ROOT/config/themes.conf"
DEFAULTS_FILE="$PROJECT_ROOT/config/defaults.conf"
```


## Available Separator Styles

| #  | Name              | Preview                                                       |
| -- | ----------------- | ------------------------------------------------------------- |
| 1  | **Default**       | ***━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━*** |
| 2  | **Double Line**   | ═══════════════════════════════════════════════════════════════════════ |
| 3  | **Dashed**        | - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - |
| 4  | **Dotted**        | · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · |
| 5  | **Wave**          | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ |
| 6  | **Stars**         | *********************************************************************** |
| 7  | **Arrows**        | >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> |
| 8  | **Diamonds**      | ◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆ |
| 9  | **Heavy Line**    | ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ |
| 10 | **Mixed**         | ▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬ |
| 11 | **None**          | *(No separator)*                                              |

This list is defined in the `SEPARATORS` array .

## Core Function: `apply_separator()`

Applies the chosen style by updating `config/defaults.conf`.  

```bash
apply_separator() {
  local style_num=$1
  local separator=$(eval echo \$SEPARATOR_STYLE_${style_num})

  if [ -f "$DEFAULTS_FILE" ]; then
    # Overwrite existing setting
    sed -i '' "s|^SEPARATOR_STYLE=.*|SEPARATOR_STYLE=\"$separator\"|" "$DEFAULTS_FILE"
    # Add key if missing
    if ! grep -q "^SEPARATOR_STYLE=" "$DEFAULTS_FILE"; then
      echo "SEPARATOR_STYLE=\"$separator\"" >> "$DEFAULTS_FILE"
    fi

    echo "✓ Separator style $style_num applied successfully!"
    echo "  Run 'bs <package>' to see the new separator."
  else
    echo "✗ Configuration file not found"
    exit 1
  fi
}
```

- Uses `eval` to dynamically access `SEPARATOR_STYLE_<n>`.
- Edits the config **in-place** using `sed -i ''` (macOS BSD sed syntax).
- Ensures idempotency by adding the key if absent .

## Interactive Menu

When run without arguments, the script prints a bordered menu and examples:

```bash
if [ -z "$1" ]; then
  echo
  echo "╔════════════════════════════════╗"
  echo "║ Separator Style Selector       ║"
  echo "╚════════════════════════════════╝"
  echo
  echo "Choose a separator style:"
  # ... loops over SEPARATORS to print number, name, preview ...
  echo
  echo "Usage: bs separator <number>"
  echo
  echo "Examples:"
  echo "  bs separator 1"
  echo "  bs separator 11  # No separator"
  echo
  exit 0
fi
```

- Splits each entry at `:` to extract **number**, **name**, and **preview**.
- Provides clear **usage** and **example** commands .

## Error Handling

- **Invalid number** (outside 1–11):  
  ```bash
  echo "Error: Invalid separator number. Use 1-11"
  exit 1
  ```
- **Non-numeric argument**:  
  ```bash
  echo "Error: Please provide a number (1-11)"
  exit 1
  ```

## Integration

- The main launcher (`bin/brewsearch`) detects the `separator` subcommand and delegates to this script:

  ```bash
  elif [ "$1" = "separator" ]; then
    shift
    exec "$SCRIPT_DIR/theme-separator" "$@"
  fi
  ```
  

- Updates to `config/defaults.conf` immediately affect all subsequent `bs <package>` searches, showing the new divider between results.

---

This **bin/theme-separator** utility exemplifies a clean, modular approach to feature-specific tooling within BrewSearch. It leverages standard Bash practices—dynamic variable expansion, in-place configuration editing, and clear user feedback—to deliver an intuitive UI for customizing result separators.