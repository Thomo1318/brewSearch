# BrewSearch Themes

BrewSearch includes 10 pre-configured color themes inspired by popular code editors and terminal color schemes.

## Available Themes

### 1. Default (Custom Purple/Pink/Cyan)
The original BrewSearch color scheme with vibrant purples, pinks, and cyan.
```bash
theme default
```

### 2. Dracula
Popular dark theme with purple and pink accents.
```bash
theme dracula
```

### 3. Nord
Arctic, north-bluish color palette with cool tones.
```bash
theme nord
```

### 4. Gruvbox
Retro groove color scheme with warm, earthy tones.
```bash
theme gruvbox
```

### 5. Monokai
Sublime Text inspired theme with vibrant colors.
```bash
theme monokai
```

### 6. Solarized Dark
Precision colors designed for reduced eye strain.
```bash
theme solarized
```

### 7. Tokyo Night
Modern dark theme with blue and purple tones.
```bash
theme tokyo
```

### 8. Catppuccin Mocha
Soothing pastel theme with soft colors.
```bash
theme catppuccin
```

### 9. One Dark
Atom editor inspired theme.
```bash
theme onedark
```

### 10. Synthwave
Retro 80s neon theme with hot pink and cyan.
```bash
theme synthwave
```

## Usage

### View All Themes
```bash
theme
```

This displays all available themes with color previews.

### Apply Theme by Name
```bash
theme dracula
```

### Apply Theme by Number
```bash
theme 2
```

### Test Theme
After applying a theme, test it:
```bash
bs redis
```

## Theme Structure

Each theme defines 6 colors used throughout the interface:

1. **Color 1** - Headers, borders, dark backgrounds
2. **Color 2** - Titles, secondary elements
3. **Color 3** - Warnings, status indicators
4. **Color 4** - Package names, errors, highlights
5. **Color 5** - Info messages, version numbers
6. **Color 6** - Success messages, URLs, progress

## Creating Custom Themes

### 1. Edit Theme Configuration

Edit `config/themes.conf`:

```bash
# Add your custom theme
THEME_MYTHEME_1='R;G;B'  # Replace with RGB values
THEME_MYTHEME_2='R;G;B'
THEME_MYTHEME_3='R;G;B'
THEME_MYTHEME_4='R;G;B'
THEME_MYTHEME_5='R;G;B'
THEME_MYTHEME_6='R;G;B'
```

### 2. Register Theme

Edit `bin/theme` and add to the `THEMES` array:

```bash
THEMES=(
    # ... existing themes ...
    "mytheme:My Custom Theme Description"
)
```

### 3. Apply Your Theme

```bash
theme mytheme
```

## Color Selection Tips

### For Syntax Highlighting Themes

1. **Use established palettes** - Dracula, Nord, Gruvbox, etc.
2. **Ensure contrast** - Text should be readable on dark backgrounds
3. **Test in your terminal** - Colors may appear different in different terminals
4. **Consider accessibility** - High contrast for better readability

### RGB Color Conversion

Convert hex colors to RGB:
- `#3B0855` → `59;8;85`
- `#FF00FF` → `255;0;255`

Online tools:
- https://www.rapidtables.com/convert/color/hex-to-rgb.html
- https://convertingcolors.com

## Theme Sources

Themes are based on popular color schemes:

- **Dracula**: https://draculatheme.com
- **Nord**: https://www.nordtheme.com
- **Gruvbox**: https://github.com/morhetz/gruvbox
- **Monokai**: https://monokai.pro
- **Solarized**: https://ethanschoonover.com/solarized/
- **Tokyo Night**: https://github.com/enkia/tokyo-night-vscode-theme
- **Catppuccin**: https://github.com/catppuccin/catppuccin
- **One Dark**: https://github.com/atom/atom/tree/master/packages/one-dark-ui
- **Synthwave**: https://github.com/robb0wen/synthwave-vscode

## Troubleshooting

### Colors Not Displaying

1. **Check terminal support**:
   ```bash
   echo $COLORTERM
   # Should show: truecolor or 24bit
   ```

2. **Test true color support**:
   ```bash
   printf "\x1b[38;2;255;100;0mTRUECOLOR\x1b[0m\n"
   ```

3. **Enable true color** (if needed):
   ```bash
   export COLORTERM=truecolor
   ```

### Theme Not Applying

1. **Verify theme file exists**:
   ```bash
   cat config/defaults.conf
   ```

2. **Re-apply theme**:
   ```bash
   theme default
   ```

3. **Check permissions**:
   ```bash
   chmod +x bin/theme
   ```

### Colors Look Different

Terminal emulators may render colors slightly differently. This is normal. If colors are significantly off:

1. Update your terminal emulator
2. Enable true color support
3. Try a different theme

## Resetting to Default

```bash
theme default
```

Or manually edit `config/defaults.conf` and remove theme settings.

## Performance

Theme switching is instant and requires no restart. The theme is loaded when you run `bs` or `check-requirements`.
