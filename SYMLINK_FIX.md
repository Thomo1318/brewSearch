# Symlink Resolution Fix

## Problem
When `bs` is called via symlink, the script was looking for libraries relative to the symlink location (`~/.local/bin/`) instead of the actual script location.

## Solution Applied to `bin/brewsearch`

Added symlink resolution code at the beginning:

```bash
# Get the real script directory (resolve symlinks)
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do
  SCRIPT_DIR="$(cd -P "$(dirname "$SOURCE")" && pwd)"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$SCRIPT_DIR/$SOURCE"
done
SCRIPT_DIR="$(cd -P "$(dirname "$SOURCE")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
```

This code:
1. Starts with the script's source location
2. Checks if it's a symlink (`-h`)
3. Follows the symlink to the real file
4. Handles both absolute and relative symlink paths
5. Sets `SCRIPT_DIR` to the actual script location
6. Sets `PROJECT_ROOT` to the parent directory

## Status
✅ `bin/brewsearch` - Fixed and working
✅ `bin/theme` - Works (doesn't use libraries)
✅ `bin/install` - Works (doesn't use libraries)
⚠️  `bin/check-requirements` - May need same fix if called via symlink

## Testing
```bash
# Test via symlink
bs redis

# Test via direct path
./bin/brewsearch redis

# Both should work identically
```

## Other Scripts
If you create symlinks for other scripts, apply the same fix to:
- `bin/check-requirements` (if you want to symlink it)
- Any future scripts that source libraries
