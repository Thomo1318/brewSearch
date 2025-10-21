#!/bin/bash
# Progress bar utilities

show_progress() {
    local current=$1
    local total=$2
    local message=$3
    
    local percentage=$(( (current * 100) / total ))
    local bar_length=20
    local filled=$(( (current * bar_length) / total ))
    local bar=$(printf "%*s" "$filled" | tr ' ' '#')
    local spaces=$(printf "%*s" $((bar_length - filled)) | tr ' ' '-')
    
    echo -ne "\r[$bar$spaces] $percentage% $message"
}

clear_progress() {
    echo -e "\n"
}
