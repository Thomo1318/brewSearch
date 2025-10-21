# Installation Guide

## Prerequisites

### Required
- **Bash 4.0+** - Usually pre-installed on macOS/Linux
- **Homebrew** - Package manager for macOS/Linux
  - Install: `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
  - Website: https://brew.sh

### Optional (Recommended)
Choose one package manager for better environment management:

#### Option 1: mise (Recommended)
- **Installation**: `curl https://mise.run | sh`
- **Website**: https://mise.jdx.dev
- **Why**: Unified tool version management, environment variables, task runner

#### Option 2: uv
- **Installation**: `curl -LsSf https://astral.sh/uv/install.sh | sh`
- **Website**: https://docs.astral.sh/uv/
- **Why**: Fast Python package installer and resolver (if extending with Python)

## Installation Steps

### 1. Check Requirements

Run the requirements checker:
```bash
./bin/check-requirements
```

This will verify all dependencies and provide installation instructions for missing ones.

### 2. Clone Repository

```bash
git clone <repository-url> brewsearch
cd brewsearch
```

### 3. Configure Environment

Copy the example environment file:
```bash
cp .env.example .env
```

Edit `.env` and add your API keys:
```bash
# Open in your preferred editor
nano .env
# or
vim .env
# or
code .env
```

Add your Exa API key:
```
EXA_API_KEY=your_actual_api_key_here
```

### 4. Create Symlink (Optional)

For easier access, create a symlink to use `bs` command anywhere:

```bash
# Ensure ~/.local/bin exists
mkdir -p ~/.local/bin

# Create symlink
ln -s $(pwd)/bin/brewsearch ~/.local/bin/bs

# Add to PATH if not already (add to ~/.zshrc or ~/.bashrc)
export PATH="$HOME/.local/bin:$PATH"
```

### 5. Verify Installation

Test the installation:
```bash
bs redis
```

You should see a progress bar and search results for Redis packages.

## Troubleshooting

### Bash Version Too Old

Check your Bash version:
```bash
bash --version
```

If less than 4.0, install newer Bash via Homebrew:
```bash
brew install bash
```

### Homebrew Not Found

Install Homebrew:
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Follow the post-installation instructions to add Homebrew to your PATH.

### Permission Denied

Make sure the script is executable:
```bash
chmod +x bin/brewsearch
chmod +x bin/check-requirements
```

### .env File Issues

Ensure `.env` file exists and contains valid API keys:
```bash
# Check if file exists
ls -la .env

# Verify contents (without exposing secrets)
grep "EXA_API_KEY" .env
```

## Updating

To update to the latest version:
```bash
cd brewsearch
git pull origin main
./bin/check-requirements
```

## Uninstallation

Remove the symlink:
```bash
rm ~/.local/bin/bs
```

Remove the repository:
```bash
rm -rf /path/to/brewsearch
```
