#!/usr/bin/env bash
# Progress bar utilities

# Get script directory and source colors
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/colors.sh"

show_progress() {
    local current=$1
    local total=$2
    local message=$3
    
    draw_progress_bar "$current" "$total" "$message"
}

clear_progress() {
    echo -e "\n"
}
