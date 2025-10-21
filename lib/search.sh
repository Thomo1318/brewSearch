#!/usr/bin/env bash
# Brew search utilities

search_formulae() {
    local query=$1
    brew search --formula "$query" | grep -E '^[a-zA-Z0-9_-]+$'
}

search_casks() {
    local query=$1
    brew search --cask "$query" | grep -E '^[a-zA-Z0-9_-]+$'
}
