# Usage Guide

## Basic Usage

### Simple Search

Search for packages by name:
```bash
bs redis
```

This will search both formulae (command-line tools) and casks (GUI applications).

### Example Output

```
Searching for: redis
[####################] 100% Complete!

Results for: redis

***Formulae***
--------------
==> redis: stable 8.2.2 (bottled), HEAD
Persistent key-value database, with built-in net interface
https://redis.io/
Not installed
...

***--------------------------------------------------------------------***

==> hiredis: stable 1.3.0 (bottled), HEAD
Minimalistic client for Redis
...
```

## Common Searches

### Development Tools

```bash
# Search for Python
bs python

# Search for Node.js
bs node

# Search for Docker
bs docker

# Search for Git tools
bs git
```

### GUI Applications

```bash
# Search for browsers
bs chrome

# Search for editors
bs vscode

# Search for communication tools
bs slack
```

### Databases

```bash
# Search for PostgreSQL
bs postgres

# Search for MongoDB
bs mongo

# Search for MySQL
bs mysql
```

## Understanding Results

### Formulae Section
- **Command-line tools and libraries**
- Installed via: `brew install <formula-name>`
- Examples: redis, python, node, git

### Cask Section
- **GUI applications**
- Installed via: `brew install --cask <cask-name>`
- Examples: google-chrome, visual-studio-code, slack

### Package Information

Each result shows:
- **Name and version**: Package identifier and current stable version
- **Description**: What the package does
- **Homepage**: Official website
- **Installation status**: Whether it's already installed
- **Dependencies**: Required packages
- **Analytics**: Installation statistics
- **Caveats**: Special installation notes or post-install instructions

## Tips and Tricks

### Narrow Your Search

Be specific with search terms:
```bash
# Instead of "python"
bs python@3.12

# Instead of "node"
bs node@20
```

### Check Before Installing

Use brewsearch to verify package names before installing:
```bash
# Search first
bs docker

# Then install the correct package
brew install docker
```

### Find Alternatives

Search for similar tools:
```bash
# Find Redis alternatives
bs redis

# Results might include: redis, valkey, keydb, etc.
```

### Verify Installation Status

Check if a package is already installed:
```bash
bs <package-name>
# Look for "Not installed" or version info
```

## Integration with Homebrew

After finding a package, install it with Homebrew:

```bash
# Install a formula
brew install redis

# Install a cask
brew install --cask google-chrome

# Install with options
brew install redis --HEAD
```

## Performance Notes

- **Search speed**: Depends on Homebrew's index size
- **Progress bar**: Shows real-time search progress
- **Results**: Limited to packages matching your search term

## Troubleshooting

### No Results Found

```bash
bs nonexistent-package
# Output: No formulae found. No casks found.
```

Try:
- Check spelling
- Use partial names: `bs post` instead of `postgresql`
- Search on Homebrew website: https://formulae.brew.sh

### Slow Search

If searches are slow:
```bash
# Update Homebrew
brew update

# Clean up old files
brew cleanup
```

### Incorrect Results

Homebrew's search is fuzzy. Refine your query:
```bash
# Too broad
bs py  # Returns: python, pypy, pybind11, etc.

# More specific
bs python@3.12  # Returns: python@3.12
```

## Advanced Usage

### Scripting

Use brewsearch in scripts:
```bash
#!/bin/bash
# Check if package exists before installing

if bs redis | grep -q "redis:"; then
    echo "Redis found, installing..."
    brew install redis
else
    echo "Redis not found in Homebrew"
fi
```

### Batch Searches

Search for multiple packages:
```bash
for pkg in redis postgres mongodb; do
    echo "Searching for $pkg..."
    bs $pkg
    echo "---"
done
```

## Getting Help

- **Homebrew documentation**: https://docs.brew.sh
- **Formulae browser**: https://formulae.brew.sh
- **Cask browser**: https://formulae.brew.sh/cask/
- **Report issues**: [Project repository issues page]
