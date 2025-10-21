#!/usr/bin/env bash
# Test search functionality

source "$(dirname "$0")/../lib/search.sh"

echo "Testing search_formulae..."
result=$(search_formulae "redis")
if [ -n "$result" ]; then
    echo "✓ search_formulae works"
else
    echo "✗ search_formulae failed"
fi
