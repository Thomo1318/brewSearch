#!/bin/bash

# Create new directory structure
mkdir -p bin lib config docs tests archive/{v1-call-progress-bar,v2-per-item-progress}

# Move main executable
mv brewsearch bin/brewsearch
chmod +x bin/brewsearch

# Move old versions to archive
mv versions/callProgressBarVersion/progressBar.sh archive/v1-call-progress-bar/
mv versions/perItemProgressBar/brewSearch.sh archive/v2-per-item-progress/
rm -rf versions

# Move standalone progressBar to archive
mv progressBar archive/progressBar-standalone

# Create lib files (extracted from main script)
cat > lib/progress.sh << 'PROGRESS'
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
PROGRESS

cat > lib/search.sh << 'SEARCH'
#!/bin/bash
# Brew search utilities

search_formulae() {
    local query=$1
    brew search --formula "$query" | grep -E '^[a-zA-Z0-9_-]+$'
}

search_casks() {
    local query=$1
    brew search --cask "$query" | grep -E '^[a-zA-Z0-9_-]+$'
}
SEARCH

cat > lib/format.sh << 'FORMAT'
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
FORMAT

# Create config
cat > config/defaults.conf << 'CONFIG'
# BrewSearch Configuration

# Progress bar settings
PROGRESS_BAR_LENGTH=20
PROGRESS_UPDATE_DELAY=0.5

# Output settings
SHOW_SEPARATORS=true
SEPARATOR_STYLE="***--------------------------------------------------------------------***"
CONFIG

# Create documentation
cat > docs/INSTALLATION.md << 'INSTALL'
# Installation

## Prerequisites
- Homebrew installed
- Bash 4.0+
- mise (optional, for environment management)

## Steps

1. Clone the repository:
   ```bash
   git clone <repo-url> brewsearch
   cd brewsearch
   ```

2. Set up environment:
   ```bash
   cp .env.example .env
   # Edit .env and add your API keys
   ```

3. Create symlink:
   ```bash
   ln -s $(pwd)/bin/brewsearch ~/.local/bin/bs
   ```

4. Verify installation:
   ```bash
   bs --help
   ```
INSTALL

cat > docs/USAGE.md << 'USAGE'
# Usage

## Basic Search

Search for packages:
```bash
bs redis
```

## Options

- Search formulae only: `bs --formula redis`
- Search casks only: `bs --cask redis`
- Verbose output: `bs -v redis`

## Examples

```bash
# Search for Python packages
bs python

# Search for Docker
bs docker
```
USAGE

cat > docs/DEVELOPMENT.md << 'DEV'
# Development Guide

## Project Structure

- `bin/` - Executable scripts
- `lib/` - Reusable functions
- `config/` - Configuration files
- `tests/` - Test scripts
- `archive/` - Old versions

## Adding Features

1. Add functions to appropriate `lib/` file
2. Update main script in `bin/brewsearch`
3. Add tests in `tests/`
4. Update documentation

## Testing

Run tests:
```bash
./tests/test_search.sh
```
DEV

# Create test files
cat > tests/test_search.sh << 'TEST'
#!/bin/bash
# Test search functionality

source "$(dirname "$0")/../lib/search.sh"

echo "Testing search_formulae..."
result=$(search_formulae "redis")
if [ -n "$result" ]; then
    echo "✓ search_formulae works"
else
    echo "✗ search_formulae failed"
fi
TEST

chmod +x tests/test_search.sh

# Update README
cat > README.md << 'README'
# BrewSearch

A Homebrew search utility with progress indicators and formatted output.

## Features

- 🔍 Search both formulae and casks
- 📊 Real-time progress indicators
- 📋 Formatted output with separators
- ⚙️ Configurable settings

## Quick Start

```bash
# Install
ln -s $(pwd)/bin/brewsearch ~/.local/bin/bs

# Search
bs redis
```

## Documentation

- [Installation Guide](docs/INSTALLATION.md)
- [Usage Examples](docs/USAGE.md)
- [Development Guide](docs/DEVELOPMENT.md)

## Project Structure

```
brewsearch/
├── bin/          # Executables
├── lib/          # Libraries
├── config/       # Configuration
├── docs/         # Documentation
├── tests/        # Tests
└── archive/      # Old versions
```

## License

MIT
README

echo "Restructure complete!"
echo "New structure created in current directory"
