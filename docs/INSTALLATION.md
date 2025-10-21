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

### 4. Install BrewSearch

Run the installer:
```bash
./bin/install
```

This will:
- Create `~/.local/bin` if it doesn't exist
- Create a symlink `~/.local/bin/bs` → `bin/brewsearch`
- Check if `~/.local/bin` is in your PATH
- Provide instructions if PATH needs updating

### 5. Add to PATH (if needed)

If the installer says `~/.local/bin` is not in your PATH, add it:

**For Zsh (default on macOS):**
```bash
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc
```

**For Bash:**
```bash
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

### 6. Clear Shell Cache

After installation, clear the shell's command cache:
```bash
hash -r
```

### 7. Verify Installation

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

### Command Not Found: bs

**Issue**: Shell can't find the `bs` command

**Solutions**:

1. **Check if symlink exists**:
   ```bash
   ls -la ~/.local/bin/bs
   ```

2. **Verify PATH**:
   ```bash
   echo $PATH | grep ".local/bin"
   ```

3. **Add to PATH** (if missing):
   ```bash
   export PATH="$HOME/.local/bin:$PATH"
   ```

4. **Clear shell cache**:
   ```bash
   hash -r
   ```

5. **Restart terminal** or reload shell config:
   ```bash
   source ~/.zshrc  # or source ~/.bashrc
   ```

6. **Re-run installer**:
   ```bash
   ./bin/install
   ```

### Symlink Points to Wrong Location

If you moved the project directory:

1. **Remove old symlink**:
   ```bash
   rm ~/.local/bin/bs
   ```

2. **Re-run installer**:
   ```bash
   cd /path/to/new/location/brewsearch
   ./bin/install
   ```

### Permission Denied

Make sure scripts are executable:
```bash
chmod +x bin/brewsearch
chmod +x bin/check-requirements
chmod +x bin/theme
chmod +x bin/install
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

The symlink will continue to work as it points to the script location.

## Uninstallation

Remove the symlink:
```bash
rm ~/.local/bin/bs
```

Remove the repository:
```bash
rm -rf /path/to/brewsearch
```

## Alternative Installation (Without Symlink)

If you prefer not to use a symlink, you can:

1. **Add alias to shell config**:
   ```bash
   echo 'alias bs="/path/to/brewsearch/bin/brewsearch"' >> ~/.zshrc
   source ~/.zshrc
   ```

2. **Run directly**:
   ```bash
   /path/to/brewsearch/bin/brewsearch redis
   ```

3. **Add bin directory to PATH**:
   ```bash
   echo 'export PATH="/path/to/brewsearch/bin:$PATH"' >> ~/.zshrc
   source ~/.zshrc
   ```

## Post-Installation

### Choose a Theme

Browse available themes:
```bash
theme
```

Apply a theme:
```bash
theme dracula
```

### Test Search

Try searching for packages:
```bash
bs python
bs docker
bs redis
```

### Create Shell Alias (Optional)

Add convenient aliases:
```bash
# Add to ~/.zshrc or ~/.bashrc
alias bsf='bs --formula'  # Search formulae only (future feature)
alias bsc='bs --cask'     # Search casks only (future feature)
```

## References

- [Bash Version Guide](BASH_VERSION.md)
- [Theme Guide](THEMES.md)
- [Usage Guide](USAGE.md)
- [Development Guide](DEVELOPMENT.md)
