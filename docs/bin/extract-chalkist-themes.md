# extract-chalkist-themes

A Bash script that extracts syntax-highlighting themes defined in chalk.ist and generates a BrewSearch-compatible configuration file.

## Overview

This script reads the `themes.ts` file from the chalk.ist project and transforms its `createTheme` definitions into a simple six-color format. It outputs a configuration file used by BrewSearch to apply those themes in your terminal.

## Prerequisites

- **Bash 4.0+** with built-in `printf` support
- **grep** for pattern matching
- Read/write permission in the target `config/` directory

## Paths

- **CHALKIST_PATH**

Location of the chalk.ist theme definitions (`themes.ts`)

- **OUTPUT_FILE**

Destination file for the generated BrewSearch theme config (`config/chalkist-themes.conf`)

## 🎨 Color Mapping

BrewSearch uses a six-color system. Each color maps to one of chalk.ist’s ten syntax roles:

| Index | Chalk.ist Role | BrewSearch Role |
| --- | --- | --- |
| :-----: | :------------------ | :---------------------- |
| **1** | comment (darker) | Headers / Borders |
| **2** | punctuation | Titles / Secondary |
| **3** | keyword | Warnings / Status |
| **4** | function | Highlights / Package |
| **5** | variable | Info / Version |
| **6** | string | Success / URLs |


## How It Works

- Prints header comments to document source and format
- Defines `hex_to_rgb()` to convert `#RRGGBB` into `R;G;B`
- Uses `grep -A 10 'createTheme('` to locate each theme block
- Reads each line and applies regex tests to extract:
- Theme name
- Six color hex codes (comment, punctuation, keyword, function, variable, string)
- Converts hex codes to RGB and emits `THEME_<ID>_<INDEX>` variables

## hex_to_rgb Function

Converts a hex color string into semicolon-separated RGB values:

```bash
hex_to_rgb() {
  local hex=$1
  hex=${hex#\#}
  printf "%d;%d;%d" 0x${hex:0:2} 0x${hex:2:2} 0x${hex:4:2}
}
```

![](https://storage.googleapis.com/pieces-web-extensions-cdn/pieces.png)

Copy And Save

![](https://storage.googleapis.com/pieces-web-extensions-cdn/link.png)

Share

![](https://storage.googleapis.com/pieces-web-extensions-cdn/copilot.png)

Ask Copilot

![](https://storage.googleapis.com/pieces-web-extensions-cdn/settings.png)

Explanation:

- Strips leading `#`
- Uses `printf` with hex-to-decimal formatting

## Theme Extraction Logic

The script’s `while read` loop applies these regex patterns ():

- `createTheme\("([^"]+)"` → theme name
- `comment:\ *"([^"]+)"` → Color 1
- `punctuation:\ *"([^"]+)"` → Color 2
- `keyword:\ *"([^"]+)"` → Color 3
- `function:\ *"([^"]+)"` → Color 4
- `variable:\ *"([^"]+)"` → Color 5
- `string:\ *"([^"]+)"` → Color 6

This generates lines like:

```bash
# Theme: Dracula
THEME_DRACULA_NAME='Dracula'
THEME_DRACULA_1='59;8;85'
THEME_DRACULA_2='133;36;103'
THEME_DRACULA_3='253;128;131'
THEME_DRACULA_4='238;34;125'
THEME_DRACULA_5='73;128;153'
THEME_DRACULA_6='48;192;183'
```

![](https://storage.googleapis.com/pieces-web-extensions-cdn/pieces.png)

Copy And Save

![](https://storage.googleapis.com/pieces-web-extensions-cdn/link.png)

Share

![](https://storage.googleapis.com/pieces-web-extensions-cdn/copilot.png)

Ask Copilot

![](https://storage.googleapis.com/pieces-web-extensions-cdn/settings.png)

## Example Output

Here is an excerpt from the generated `chalkist-themes.conf`:

```conf
# Theme: Catppuccin Mocha (Soothing pastel)
THEME_CATPPUCCIN_NAME='Catppuccin Mocha'
THEME_CATPPUCCIN_1='30;30;46'   # Base
THEME_CATPPUCCIN_2='49;50;68'   # Surface0
THEME_CATPPUCCIN_3='203;166;247'# Mauve
THEME_CATPPUCCIN_4='245;194;231'# Pink
THEME_CATPPUCCIN_5='148;226;213'# Teal
THEME_CATPPUCCIN_6='166;227;161'# Green

# Default theme
CURRENT_THEME="default"
```

![](https://storage.googleapis.com/pieces-web-extensions-cdn/pieces.png)

Copy And Save

![](https://storage.googleapis.com/pieces-web-extensions-cdn/link.png)

Share

![](https://storage.googleapis.com/pieces-web-extensions-cdn/copilot.png)

Ask Copilot

![](https://storage.googleapis.com/pieces-web-extensions-cdn/settings.png)

## Usage

Run the script from your project root:

```bash
./bin/extract-chalkist-themes
```

![](https://storage.googleapis.com/pieces-web-extensions-cdn/pieces.png)

Copy And Save

![](https://storage.googleapis.com/pieces-web-extensions-cdn/link.png)

Share

![](https://storage.googleapis.com/pieces-web-extensions-cdn/copilot.png)

Ask Copilot

![](https://storage.googleapis.com/pieces-web-extensions-cdn/settings.png)

It writes `config/chalkist-themes.conf`. Adjust `CHALKIST_PATH` if your chalk.ist clone resides elsewhere.

```card
{
    "title": "Backup Config",
    "content": "Always back up your existing config before running the script."
}
```

## Extending & Customization

- **Change source**: Modify `CHALKIST_PATH` to point at a custom themes file.
- **Adjust format**: Tweak the `echo` statements to include additional metadata.
- **Additional roles**: Extend parsing for more syntax roles by adding new regex branches.

---

By automating theme extraction, this script keeps BrewSearch’s themes in sync with chalk.ist palettes. It supports easy updates whenever chalk.ist adds new color schemes.