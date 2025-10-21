#!/usr/bin/env bash
# Output formatting utilities

# Get script directory and source colors
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/colors.sh"

print_separator() {
    echo
    draw_separator "─" "$COLOR_SEPARATOR" 70
    echo
}

print_section_header() {
    local title="$1"
    draw_section_header "$title"
}

print_result_separator() {
    echo
    echo -ne "${PURPLE_MID}"
    printf "━%.0s" $(seq 1 70)
    echo -e "${NC}"
    echo
}
