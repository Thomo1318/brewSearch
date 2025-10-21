#!/usr/bin/env bash
# Color palette and formatting utilities for brewsearch

# Load theme colors from config if available
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
DEFAULTS_FILE="$PROJECT_ROOT/config/defaults.conf"

if [ -f "$DEFAULTS_FILE" ] && grep -q "THEME_COLOR_1" "$DEFAULTS_FILE"; then
    source "$DEFAULTS_FILE"
    # Apply theme colors
    PURPLE_DARK="\033[38;2;${THEME_COLOR_1}m"
    PURPLE_MID="\033[38;2;${THEME_COLOR_2}m"
    PINK_LIGHT="\033[38;2;${THEME_COLOR_3}m"
    PINK_BRIGHT="\033[38;2;${THEME_COLOR_4}m"
    BLUE_DARK="\033[38;2;${THEME_COLOR_5}m"
    CYAN_BRIGHT="\033[38;2;${THEME_COLOR_6}m"
else
    # Default color palette
    PURPLE_DARK='\033[38;2;59;8;85m'      # #3B0855
    PURPLE_MID='\033[38;2;133;36;103m'    # #852467
    PINK_LIGHT='\033[38;2;253;128;131m'   # #FD8083
    PINK_BRIGHT='\033[38;2;238;34;125m'   # #EE227D
    BLUE_DARK='\033[38;2;73;128;153m'     # #498099
    CYAN_BRIGHT='\033[38;2;48;192;183m'   # #30C0B7
fi

# Background colors
BG_PURPLE_DARK='\033[48;2;59;8;85m'
BG_PURPLE_MID='\033[48;2;133;36;103m'
BG_PINK_LIGHT='\033[48;2;253;128;131m'
BG_PINK_BRIGHT='\033[48;2;238;34;125m'
BG_BLUE_DARK='\033[48;2;73;128;153m'
BG_CYAN_BRIGHT='\033[48;2;48;192;183m'

# Text styles
BOLD='\033[1m'
DIM='\033[2m'
ITALIC='\033[3m'
UNDERLINE='\033[4m'
BLINK='\033[5m'
REVERSE='\033[7m'
HIDDEN='\033[8m'

# Reset
NC='\033[0m'

# Semantic color assignments
COLOR_SUCCESS="$CYAN_BRIGHT"
COLOR_ERROR="$PINK_BRIGHT"
COLOR_WARNING="$PINK_LIGHT"
COLOR_INFO="$BLUE_DARK"
COLOR_HEADER="$PURPLE_DARK"
COLOR_TITLE="$PURPLE_MID"
COLOR_PROGRESS="$CYAN_BRIGHT"
COLOR_PROGRESS_BG="$PURPLE_DARK"
COLOR_SEPARATOR="$PURPLE_MID"
COLOR_PACKAGE="$PINK_BRIGHT"
COLOR_VERSION="$BLUE_DARK"
COLOR_URL="$CYAN_BRIGHT"
COLOR_STATUS="$PINK_LIGHT"

# Helper functions
print_success() {
    echo -e "${COLOR_SUCCESS}✓${NC} $1"
}

print_error() {
    echo -e "${COLOR_ERROR}✗${NC} $1"
}

print_warning() {
    echo -e "${COLOR_WARNING}⚠${NC} $1"
}

print_info() {
    echo -e "${COLOR_INFO}ℹ${NC} $1"
}

print_header() {
    echo -e "${BOLD}${COLOR_HEADER}$1${NC}"
}

print_title() {
    echo -e "${BOLD}${COLOR_TITLE}$1${NC}"
}

print_package() {
    echo -e "${BOLD}${COLOR_PACKAGE}$1${NC}"
}

print_url() {
    echo -e "${COLOR_URL}$1${NC}"
}

# Box drawing
BOX_TL='╔'
BOX_TR='╗'
BOX_BL='╚'
BOX_BR='╝'
BOX_H='═'
BOX_V='║'

draw_box() {
    local text="$1"
    local color="${2:-$COLOR_HEADER}"
    local width=$((${#text} + 4))
    
    echo -ne "${color}${BOX_TL}"
    printf "${BOX_H}%.0s" $(seq 1 $((width - 2)))
    echo -e "${BOX_TR}${NC}"
    
    echo -e "${color}${BOX_V}${NC}  ${text}  ${color}${BOX_V}${NC}"
    
    echo -ne "${color}${BOX_BL}"
    printf "${BOX_H}%.0s" $(seq 1 $((width - 2)))
    echo -e "${BOX_BR}${NC}"
}

# Smooth gradient progress bar
draw_progress_bar() {
    local current=$1
    local total=$2
    local message=$3
    local bar_length=30
    
    local percentage=$(( (current * 100) / total ))
    local filled=$(( (current * bar_length) / total ))
    
    # Parse theme colors for gradient
    local c1_r c1_g c1_b c2_r c2_g c2_b c3_r c3_g c3_b c4_r c4_g c4_b c5_r c5_g c5_b c6_r c6_g c6_b
    
    if [ -f "$DEFAULTS_FILE" ] && grep -q "THEME_COLOR_1" "$DEFAULTS_FILE"; then
        IFS=';' read -r c1_r c1_g c1_b <<< "$THEME_COLOR_1"
        IFS=';' read -r c2_r c2_g c2_b <<< "$THEME_COLOR_2"
        IFS=';' read -r c3_r c3_g c3_b <<< "$THEME_COLOR_3"
        IFS=';' read -r c4_r c4_g c4_b <<< "$THEME_COLOR_4"
        IFS=';' read -r c5_r c5_g c5_b <<< "$THEME_COLOR_5"
        IFS=';' read -r c6_r c6_g c6_b <<< "$THEME_COLOR_6"
    else
        c1_r=59 c1_g=8 c1_b=85
        c2_r=133 c2_g=36 c2_b=103
        c3_r=253 c3_g=128 c3_b=131
        c4_r=238 c4_g=34 c4_b=125
        c5_r=73 c5_g=128 c5_b=153
        c6_r=48 c6_g=192 c6_b=183
    fi
    
    local bar=""
    for ((i=0; i<bar_length; i++)); do
        if [ $i -lt $filled ]; then
            local ratio=$(( (i * 100) / bar_length ))
            
            # Smooth 6-color gradient
            if [ $ratio -lt 20 ]; then
                local t=$(( ratio * 5 ))
                local r=$(( c1_r + (c2_r - c1_r) * t / 100 ))
                local g=$(( c1_g + (c2_g - c1_g) * t / 100 ))
                local b=$(( c1_b + (c2_b - c1_b) * t / 100 ))
            elif [ $ratio -lt 40 ]; then
                local t=$(( (ratio - 20) * 5 ))
                local r=$(( c2_r + (c3_r - c2_r) * t / 100 ))
                local g=$(( c2_g + (c3_g - c2_g) * t / 100 ))
                local b=$(( c2_b + (c3_b - c2_b) * t / 100 ))
            elif [ $ratio -lt 60 ]; then
                local t=$(( (ratio - 40) * 5 ))
                local r=$(( c3_r + (c4_r - c3_r) * t / 100 ))
                local g=$(( c3_g + (c4_g - c3_g) * t / 100 ))
                local b=$(( c3_b + (c4_b - c3_b) * t / 100 ))
            elif [ $ratio -lt 80 ]; then
                local t=$(( (ratio - 60) * 5 ))
                local r=$(( c4_r + (c5_r - c4_r) * t / 100 ))
                local g=$(( c4_g + (c5_g - c4_g) * t / 100 ))
                local b=$(( c4_b + (c5_b - c4_b) * t / 100 ))
            else
                local t=$(( (ratio - 80) * 5 ))
                local r=$(( c5_r + (c6_r - c5_r) * t / 100 ))
                local g=$(( c5_g + (c6_g - c5_g) * t / 100 ))
                local b=$(( c5_b + (c6_b - c5_b) * t / 100 ))
            fi
            
            bar+="\033[38;2;${r};${g};${b}m█${NC}"
        else
            bar+="${DIM}${COLOR_PROGRESS_BG}░${NC}"
        fi
    done
    
    echo -ne "\r${COLOR_INFO}[${NC}${bar}${COLOR_INFO}]${NC} ${BOLD}${COLOR_PROGRESS}${percentage}%${NC} ${message}"
}

draw_separator() {
    local char="${1:-═}"
    local color="${2:-$COLOR_SEPARATOR}"
    local width="${3:-70}"
    
    echo -ne "${color}"
    printf "${char}%.0s" $(seq 1 $width)
    echo -e "${NC}"
}

draw_section_header() {
    local title="$1"
    local width=70
    local title_len=${#title}
    local padding=$(( (width - title_len - 2) / 2 ))
    
    echo
    draw_separator "═" "$PURPLE_DARK" $width
    echo -ne "${PURPLE_MID}"
    printf " %.0s" $(seq 1 $padding)
    echo -ne "${BOLD}${PINK_BRIGHT}${title}${NC}${PURPLE_MID}"
    printf " %.0s" $(seq 1 $padding)
    echo -e "${NC}"
    draw_separator "═" "$PURPLE_DARK" $width
    echo
}

print_badge() {
    local status="$1"
    local text="$2"
    
    case "$status" in
        "success")
            echo -e "${BG_CYAN_BRIGHT}${PURPLE_DARK}${BOLD} ✓ ${NC} ${COLOR_SUCCESS}${text}${NC}"
            ;;
        "error")
            echo -e "${BG_PINK_BRIGHT}${PURPLE_DARK}${BOLD} ✗ ${NC} ${COLOR_ERROR}${text}${NC}"
            ;;
        "warning")
            echo -e "${BG_PINK_LIGHT}${PURPLE_DARK}${BOLD} ⚠ ${NC} ${COLOR_WARNING}${text}${NC}"
            ;;
        "info")
            echo -e "${BG_BLUE_DARK}${PURPLE_DARK}${BOLD} ℹ ${NC} ${COLOR_INFO}${text}${NC}"
            ;;
        *)
            echo -e "${text}"
            ;;
    esac
}

highlight_package_line() {
    local line="$1"
    
    # Use printf to properly handle escape sequences
    line=$(printf '%s\n' "$line" | sed -E "s/(==> )([^:]+):/\1$(printf '\033[1m\033[38;2;238;34;125m')\2$(printf '\033[0m'):/g")
    line=$(printf '%s\n' "$line" | sed -E "s/(stable|HEAD|bottled) ([0-9]+\.[0-9]+[^ ]*)/\1 $(printf '\033[38;2;73;128;153m')\2$(printf '\033[0m')/g")
    line=$(printf '%s\n' "$line" | sed -E "s|(https?://[^ ]+)|$(printf '\033[38;2;48;192;183m')\1$(printf '\033[0m')|g")
    line=$(printf '%s\n' "$line" | sed -E "s/(Not installed|Installed)/$(printf '\033[38;2;253;128;131m')\1$(printf '\033[0m')/g")
    
    echo "$line"
}
