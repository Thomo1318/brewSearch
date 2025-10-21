# Bash Version Compatibility

## The Problem

macOS ships with Bash 3.2.57 (from 2007) due to licensing restrictions. BrewSearch requires Bash 4.0+ for modern features.

## Solution

### Check Your Bash Version

```bash
# System bash (usually 3.2.57)
/bin/bash --version

# Homebrew bash (4.0+)
/opt/homebrew/bin/bash --version
```

### Option 1: Use Homebrew Bash (Recommended)

The scripts now use `#!/usr/bin/env bash` which automatically finds the first `bash` in your PATH.

**Install Homebrew Bash:**
```bash
brew install bash
```

**Add to PATH (if not already):**
```bash
# Add to ~/.zshrc or ~/.bash_profile
export PATH="/opt/homebrew/bin:$PATH"
```

**Reload shell:**
```bash
source ~/.zshrc  # or source ~/.bash_profile
```

**Verify:**
```bash
which bash
# Should show: /opt/homebrew/bin/bash

bash --version
# Should show: GNU bash, version 5.x.x
```

### Option 2: Change Default Shell

Make Homebrew Bash your default shell:

```bash
# Add to allowed shells
sudo bash -c 'echo /opt/homebrew/bin/bash >> /etc/shells'

# Change default shell
chsh -s /opt/homebrew/bin/bash

# Restart terminal
```

### Option 3: Run Explicitly

Run scripts with Homebrew Bash explicitly:

```bash
/opt/homebrew/bin/bash ./bin/brewsearch redis
```

## Why Bash 4.0+?

BrewSearch uses features introduced in Bash 4.0:

- **Associative arrays** - For better data structures
- **`mapfile`/`readarray`** - Efficient array reading
- **`&>>` redirection** - Simplified error handling
- **Better string manipulation** - Enhanced parameter expansion

## Verification

Run the requirements checker:

```bash
./bin/check-requirements
```

It will:
- Detect your current Bash version
- Find Homebrew Bash if installed
- Provide specific instructions for your setup

## Troubleshooting

### "Bad substitution" errors

This usually means you're running with Bash 3.2. Use Homebrew Bash:

```bash
/opt/homebrew/bin/bash ./bin/brewsearch redis
```

### "Command not found: bash"

Ensure Homebrew is in your PATH:

```bash
export PATH="/opt/homebrew/bin:$PATH"
```

### Scripts still use old Bash

Check the shebang line:

```bash
head -1 bin/brewsearch
# Should show: #!/usr/bin/env bash
```

Check which bash is found first:

```bash
which bash
# Should show: /opt/homebrew/bin/bash (not /bin/bash)
```

## References

- [Bash 4.0 Release Notes](https://tiswww.case.edu/php/chet/bash/NEWS)
- [Why macOS uses old Bash](https://apple.stackexchange.com/questions/193411/update-bash-to-version-4-0-on-osx)
- [Homebrew Bash Formula](https://formulae.brew.sh/formula/bash)
