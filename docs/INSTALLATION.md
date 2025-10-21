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
