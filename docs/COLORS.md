# Color Palette Documentation

## Custom Color Scheme

BrewSearch uses a custom color palette for enhanced visual appeal and readability.

### Color Palette

| Color | Hex Code | RGB | Usage |
|-------|----------|-----|-------|
| Deep Purple | `#3B0855` | `59, 8, 85` | Headers, borders, backgrounds |
| Mid Purple | `#852467` | `133, 36, 103` | Titles, separators |
| Light Pink | `#FD8083` | `253, 128, 131` | Warnings, status indicators |
| Bright Pink | `#EE227D` | `238, 34, 125` | Package names, errors |
| Dark Blue | `#498099` | `73, 128, 153` | Info messages, versions |
| Bright Cyan | `#30C0B7` | `48, 192, 183` | Success, progress, URLs |

### Semantic Color Assignments

```bash
# Success messages
COLOR_SUCCESS = Bright Cyan (#30C0B7)

# Error messages
COLOR_ERROR = Bright Pink (#EE227D)

# Warning messages
COLOR_WARNING = Light Pink (#FD8083)

# Info messages
COLOR_INFO = Dark Blue (#498099)

# Section headers
COLOR_HEADER = Deep Purple (#3B0855)

# Titles
COLOR_TITLE = Mid Purple (#852467)

# Progress bar
COLOR_PROGRESS = Bright Cyan (#30C0B7)
COLOR_PROGRESS_BG = Deep Purple (#3B0855)

# Separators
COLOR_SEPARATOR = Mid Purple (#852467)

# Package names
COLOR_PACKAGE = Bright Pink (#EE227D)

# Version numbers
COLOR_VERSION = Dark Blue (#498099)

# URLs
COLOR_URL = Bright Cyan (#30C0B7)

# Status indicators
COLOR_STATUS = Light Pink (#FD8083)
```

## Visual Examples

### Progress Bar
```
[████████████████████░░░░░░░░░░] 75% Searching...
 ↑ Purple → Pink → Cyan gradient
```

### Section Headers
```
══════════════════════════════════════════════════════════════════════
                            Formulae
══════════════════════════════════════════════════════════════════════
```

### Status Badges
```
✓ Success message    (Cyan background, purple text)
✗ Error message      (Pink background, purple text)
⚠ Warning message    (Light pink background, purple text)
ℹ Info message       (Blue background, purple text)
```

### Package Information
```
==> redis: stable 8.2.2 (bottled), HEAD
    ↑ Pink    ↑ Blue version
Persistent key-value database
https://redis.io/
↑ Cyan URL
Not installed
↑ Light pink status
```

## Color Library Usage

### In Scripts

```bash
# Source the color library
source "$PROJECT_ROOT/lib/colors.sh"

# Use predefined functions
print_success "Operation completed"
print_error "Something went wrong"
print_warning "Be careful"
print_info "Here's some information"

# Use color variables directly
echo -e "${COLOR_PACKAGE}redis${NC} - ${COLOR_VERSION}8.2.2${NC}"

# Draw fancy elements
draw_box "Title" "$PURPLE_DARK"
draw_separator "═" "$COLOR_SEPARATOR" 70
draw_section_header "Section Name"
draw_progress_bar 75 100 "Processing..."

# Status badges
print_badge "success" "All tests passed"
print_badge "error" "Build failed"
print_badge "warning" "Deprecated feature"
print_badge "info" "New version available"

# Highlight package info
highlight_package_line "==> redis: stable 8.2.2"
```

### Available Functions

#### Basic Output
- `print_success(message)` - Green checkmark with message
- `print_error(message)` - Red X with message
- `print_warning(message)` - Yellow warning with message
- `print_info(message)` - Blue info with message

#### Styled Text
- `print_header(text)` - Bold header text
- `print_title(text)` - Bold title text
- `print_package(text)` - Bold package name
- `print_url(text)` - Colored URL

#### Visual Elements
- `draw_box(text, color)` - Box around text
- `draw_separator(char, color, width)` - Horizontal separator
- `draw_section_header(title)` - Fancy section header
- `draw_progress_bar(current, total, message)` - Gradient progress bar

#### Status Indicators
- `print_badge(status, text)` - Colored badge (success/error/warning/info)

#### Text Processing
- `highlight_package_line(line)` - Colorize package info line

## Terminal Compatibility

### True Color Support

The color scheme uses 24-bit RGB colors (true color). Most modern terminals support this:

**Supported:**
- iTerm2 (macOS)
- Terminal.app (macOS 10.14+)
- Alacritty
- Kitty
- WezTerm
- Windows Terminal
- GNOME Terminal (3.x+)
- Konsole

**Limited Support:**
- tmux (requires `set -g default-terminal "screen-256color"`)
- screen (256 colors only)

### Fallback

If your terminal doesn't support true color, colors will automatically fall back to the nearest 256-color equivalent.

### Testing Colors

Test your terminal's color support:

```bash
# Source the color library
source lib/colors.sh

# Test all colors
echo -e "${PURPLE_DARK}Deep Purple${NC}"
echo -e "${PURPLE_MID}Mid Purple${NC}"
echo -e "${PINK_LIGHT}Light Pink${NC}"
echo -e "${PINK_BRIGHT}Bright Pink${NC}"
echo -e "${BLUE_DARK}Dark Blue${NC}"
echo -e "${CYAN_BRIGHT}Bright Cyan${NC}"

# Test gradient progress bar
draw_progress_bar 50 100 "Testing..."
echo
```

## Customization

### Changing Colors

Edit `lib/colors.sh` to customize the palette:

```bash
# Change a color
PURPLE_DARK='\033[38;2;YOUR;RGB;VALUES m'

# Change semantic assignment
COLOR_SUCCESS="$YOUR_COLOR"
```

### Adding New Colors

```bash
# Add to lib/colors.sh
MY_COLOR='\033[38;2;R;G;Bm'

# Use in scripts
echo -e "${MY_COLOR}Custom colored text${NC}"
```

### Disabling Colors

Set `NO_COLOR` environment variable:

```bash
export NO_COLOR=1
./bin/brewsearch redis
```

Or modify scripts to check:

```bash
if [ -n "$NO_COLOR" ]; then
    # Disable all color variables
    COLOR_SUCCESS=""
    COLOR_ERROR=""
    # ... etc
fi
```

## Accessibility

### Color Blindness Considerations

The palette is designed with contrast in mind:

- **Protanopia/Deuteranopia** (Red-Green): Uses purple/pink/cyan which remain distinguishable
- **Tritanopia** (Blue-Yellow): High contrast between colors
- **Monochromacy**: Text styles (bold, dim) provide additional differentiation

### High Contrast Mode

For better accessibility, increase contrast:

```bash
# In lib/colors.sh, use brighter variants
PURPLE_DARK='\033[38;2;80;20;120m'  # Lighter purple
CYAN_BRIGHT='\033[38;2;80;255;240m' # Brighter cyan
```

## Performance

Color codes add minimal overhead:
- ~0.1ms per colored line
- Negligible impact on overall script performance
- No external dependencies required

## References

- [ANSI Escape Codes](https://en.wikipedia.org/wiki/ANSI_escape_code)
- [True Color Support](https://github.com/termstandard/colors)
- [Color Contrast Checker](https://webaim.org/resources/contrastchecker/)
