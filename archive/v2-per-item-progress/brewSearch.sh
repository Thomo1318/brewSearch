#!/bin/bash
###***brewsearch***###

# Progress bar function
show_progress() {
    local current=$1
    local total=$2
    local message=$3
    
    if [ "$total" -eq 0 ]; then
        echo -ne "\r[####################] 100% $message"
        return
    fi
    
    local percentage=$(( (current * 100) / total ))
    local bar_length=20
    local filled=$(( (current * bar_length) / total ))
    local bar=$(printf "%*s" "$filled" | tr ' ' '#')
    local spaces=$(printf "%*s" $((bar_length - filled)) | tr ' ' ' ')
    
    echo -ne "\r[$bar$spaces] $percentage% $message"
}

# Check if an argument is provided
if [ -z "$1" ]; then
  echo "Usage: bs [ARGUMENT]"
  exit 1
fi

echo "Searching for: $1"
echo

# Get formulae and casks
FORMULAE=$(brew search --formula "$1" | grep -E '^[a-zA-Z0-9_-]+$')
CASKS=$(brew search --cask "$1" | grep -E '^[a-zA-Z0-9_-]+$')

# Count total items for progress tracking
FORMULAE_COUNT=$(echo "$FORMULAE" | grep -c .)
CASKS_COUNT=$(echo "$CASKS" | grep -c .)
TOTAL_COUNT=$((FORMULAE_COUNT + CASKS_COUNT))

if [ "$TOTAL_COUNT" -eq 0 ]; then
    echo "No packages found matching '$1'"
    exit 0
fi

echo "Found $FORMULAE_COUNT formulae and $CASKS_COUNT casks. Gathering info..."
echo

current=0

echo "***Formulae***"
echo "--------------"
if [ -n "$FORMULAE" ] && [ "$FORMULAE_COUNT" -gt 0 ]; then
    while IFS= read -r formula; do
        if [ -n "$formula" ]; then
            current=$((current + 1))
            show_progress $current $TOTAL_COUNT "Processing $formula..."
            brew info --formula "$formula"
            echo
        fi
    done <<< "$FORMULAE"
else
    echo "No formulae found."
    echo
fi

echo
echo "***Cask***"
echo "----------"
if [ -n "$CASKS" ] && [ "$CASKS_COUNT" -gt 0 ]; then
    while IFS= read -r cask; do
        if [ -n "$cask" ]; then
            current=$((current + 1))
            show_progress $current $TOTAL_COUNT "Processing $cask..."
            brew info --cask "$cask"
            echo
        fi
    done <<< "$CASKS"
else
    echo "No casks found."
fi

echo -e "\nSearch complete!"
