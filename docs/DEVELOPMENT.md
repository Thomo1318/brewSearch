# Development Guide

## Project Structure

```
brewsearch/
├── bin/                    # Executable scripts
│   ├── brewsearch         # Main application
│   └── check-requirements # Dependency checker
├── lib/                    # Reusable libraries
│   ├── progress.sh        # Progress bar functions
│   ├── search.sh          # Brew search utilities
│   └── format.sh          # Output formatting
├── config/                 # Configuration files
│   └── defaults.conf      # Default settings
├── docs/                   # Documentation
│   ├── INSTALLATION.md    # Installation guide
│   ├── USAGE.md           # Usage examples
│   └── DEVELOPMENT.md     # This file
├── tests/                  # Test scripts
│   └── test_search.sh     # Search functionality tests
├── archive/                # Old versions (not in repo)
├── .env                    # Environment variables (not in repo)
├── .env.example            # Environment template
├── .gitignore              # Git ignore rules
├── requirements.txt        # System requirements
├── mise.toml               # Mise configuration
└── README.md               # Project overview
```

## Development Setup

### 1. Clone and Configure

```bash
git clone <repository-url> brewsearch
cd brewsearch
cp .env.example .env
# Edit .env with your API keys
```

### 2. Check Requirements

```bash
./bin/check-requirements
```

### 3. Make Changes

Edit files in `bin/` or `lib/` directories.

### 4. Test Changes

```bash
# Test main script
./bin/brewsearch redis

# Run tests
./tests/test_search.sh
```

## Code Style

### Shell Script Guidelines

1. **Use bash strict mode** (where appropriate):
   ```bash
   set -euo pipefail
   ```

2. **Quote variables**:
   ```bash
   # Good
   echo "$variable"
   
   # Bad
   echo $variable
   ```

3. **Use functions**:
   ```bash
   function_name() {
       local param=$1
       # function body
   }
   ```

4. **Add comments**:
   ```bash
   # Explain complex logic
   # Document function parameters
   ```

5. **Use meaningful names**:
   ```bash
   # Good
   search_formulae() { ... }
   
   # Bad
   sf() { ... }
   ```

## Adding Features

### 1. Create New Library Function

Add to appropriate file in `lib/`:

```bash
# lib/search.sh
search_with_filter() {
    local query=$1
    local filter=$2
    brew search "$filter" "$query" | grep -E '^[a-zA-Z0-9_-]+$'
}
```

### 2. Update Main Script

Source and use the new function in `bin/brewsearch`:

```bash
source "$PROJECT_ROOT/lib/search.sh"

# Use the function
RESULTS=$(search_with_filter "$1" "--formula")
```

### 3. Add Tests

Create test in `tests/`:

```bash
# tests/test_new_feature.sh
#!/bin/bash
source "$(dirname "$0")/../lib/search.sh"

echo "Testing search_with_filter..."
result=$(search_with_filter "redis" "--formula")
if [ -n "$result" ]; then
    echo "✓ Test passed"
else
    echo "✗ Test failed"
    exit 1
fi
```

### 4. Update Documentation

Update relevant docs in `docs/`:
- `USAGE.md` - If user-facing
- `DEVELOPMENT.md` - If developer-facing
- `README.md` - If major feature

## Testing

### Manual Testing

```bash
# Test basic search
./bin/brewsearch redis

# Test with non-existent package
./bin/brewsearch nonexistent-package-xyz

# Test with special characters
./bin/brewsearch "python@3.12"
```

### Automated Testing

```bash
# Run all tests
for test in tests/*.sh; do
    echo "Running $test..."
    bash "$test"
done
```

### Test Checklist

- [ ] Search returns results for valid packages
- [ ] Search handles non-existent packages gracefully
- [ ] Progress bar displays correctly
- [ ] Separators appear between results
- [ ] Both formulae and casks are searched
- [ ] Output formatting is correct
- [ ] Script works from any directory

## Debugging

### Enable Debug Mode

Add to top of script:
```bash
set -x  # Print commands as they execute
```

### Check Variables

```bash
# Print variable values
echo "DEBUG: FORMULAE=$FORMULAE"
echo "DEBUG: CASKS=$CASKS"
```

### Test Individual Functions

```bash
# Source library
source lib/search.sh

# Test function directly
search_formulae "redis"
```

## Common Tasks

### Update Progress Bar

Edit `lib/progress.sh`:
```bash
show_progress() {
    # Modify bar length, characters, etc.
    local bar_length=30  # Change from 20 to 30
    # ...
}
```

### Change Output Format

Edit `lib/format.sh`:
```bash
print_separator() {
    echo "================================"  # New separator
}
```

### Add Configuration Option

Edit `config/defaults.conf`:
```bash
# New option
SHOW_ANALYTICS=true
```

Use in script:
```bash
if [ "$SHOW_ANALYTICS" = true ]; then
    # Show analytics
fi
```

## Git Workflow

### 1. Create Feature Branch

```bash
git checkout -b feature/new-feature
```

### 2. Make Changes

```bash
# Edit files
vim bin/brewsearch

# Test changes
./bin/brewsearch redis
```

### 3. Commit Changes

```bash
git add .
git commit -m "feat: add new feature"
```

### 4. Push and Create PR

```bash
git push origin feature/new-feature
# Create pull request on GitHub
```

## Commit Message Format

Use conventional commits:

```
feat: add new feature
fix: resolve bug in search
docs: update installation guide
test: add tests for search function
refactor: reorganize library functions
chore: update dependencies
```

## Release Process

### 1. Update Version

Update version in relevant files (if versioning is added).

### 2. Update Changelog

Document changes in `CHANGELOG.md` (if exists).

### 3. Tag Release

```bash
git tag -a v1.0.0 -m "Release version 1.0.0"
git push origin v1.0.0
```

## Troubleshooting Development Issues

### Script Not Executable

```bash
chmod +x bin/brewsearch
chmod +x bin/check-requirements
```

### Library Not Found

Check paths in main script:
```bash
# Verify PROJECT_ROOT is correct
echo "$PROJECT_ROOT"

# Check if library exists
ls -la "$PROJECT_ROOT/lib/"
```

### Environment Variables Not Loading

```bash
# Check .env file
cat .env

# Verify mise.toml configuration
cat mise.toml
```

## Resources

- **Bash Guide**: https://mywiki.wooledge.org/BashGuide
- **ShellCheck**: https://www.shellcheck.net/ (linter)
- **Homebrew Docs**: https://docs.brew.sh
- **mise Documentation**: https://mise.jdx.dev
- **uv Documentation**: https://docs.astral.sh/uv/

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests
5. Update documentation
6. Submit a pull request

## Code Review Checklist

- [ ] Code follows style guidelines
- [ ] Functions are documented
- [ ] Tests are included
- [ ] Documentation is updated
- [ ] No secrets in code
- [ ] Error handling is present
- [ ] Variables are quoted
- [ ] Script is executable
