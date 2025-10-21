#!/bin/bash
# Output formatting utilities

print_separator() {
    echo
    echo "***--------------------------------------------------------------------***"
    echo
}

print_section_header() {
    local title=$1
    echo
    echo "***$title***"
    echo "$(printf '%*s' ${#title} | tr ' ' '-')"
}
