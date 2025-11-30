# BrewSearch Installer Script

## 🚀 Overview

This Bash script automates the installation of **BrewSearch** by creating a symlink (`bs`) in the user’s local bin directory. It ensures the installation directory exists, handles existing symlinks or files, and guides the user to update their `PATH` if needed.

## 📂 Directory & Path Configuration

The script defines key environment variables to locate itself, the project root, and the installation targets.

| Variable | Description |
| --- | --- |
| **SCRIPT_DIR** | Directory where this installer script resides |
| **PROJECT_ROOT** | Parent directory of the project (one level up from `bin/`) |
| **INSTALL_DIR** | Destination for user executables (`$HOME/.local/bin`) |
| **SYMLINK_NAME** | Name of the symlink to create (`bs`) |
| **SYMLINK_PATH** | Full path of the symlink (`$INSTALL_DIR/bs`) |
| **TARGET** | Actual `brewsearch` script in the project (`$PROJECT_ROOT/bin/brewsearch`) |


## 🔗 Symlink Management

The installer carefully handles existing files and symlinks:

- Checks if `**$INSTALL_DIR**` exists; creates it if missing.
- If a symlink at `**$SYMLINK_PATH**` points to the correct target, exits with success.
- If a symlink points elsewhere, prompts to replace it.
- If a non-symlink file exists at that path, errors out and asks for manual removal.
- Creates the symlink with `ln -s "$TARGET" "$SYMLINK_PATH"`.

## ⚙️ Installation Flow

Follow these ordered steps to install BrewSearch:

1. **Ensure local bin exists**

```bash
   mkdir -p "$HOME/.local/bin"
```

![](https://storage.googleapis.com/pieces-web-extensions-cdn/pieces.png)

Copy And Save

![](https://storage.googleapis.com/pieces-web-extensions-cdn/link.png)

Share

![](https://storage.googleapis.com/pieces-web-extensions-cdn/copilot.png)

Ask Copilot

![](https://storage.googleapis.com/pieces-web-extensions-cdn/settings.png)

![](https://storage.googleapis.com/pieces-web-extensions-cdn/pieces.png)

Copy And Save

![](https://storage.googleapis.com/pieces-web-extensions-cdn/link.png)

Share

![](https://storage.googleapis.com/pieces-web-extensions-cdn/copilot.png)

Ask Copilot

![](https://storage.googleapis.com/pieces-web-extensions-cdn/settings.png)

![](https://storage.googleapis.com/pieces-web-extensions-cdn/pieces.png)

Copy And Save

![](https://storage.googleapis.com/pieces-web-extensions-cdn/link.png)

Share

![](https://storage.googleapis.com/pieces-web-extensions-cdn/copilot.png)

Ask Copilot

![](https://storage.googleapis.com/pieces-web-extensions-cdn/settings.png)

![](https://storage.googleapis.com/pieces-web-extensions-cdn/pieces.png)

Copy And Save

![](https://storage.googleapis.com/pieces-web-extensions-cdn/link.png)

Share

![](https://storage.googleapis.com/pieces-web-extensions-cdn/copilot.png)

Ask Copilot

![](https://storage.googleapis.com/pieces-web-extensions-cdn/settings.png)

1. **Verify existing symlink**
2. If correct, script exits early.
3. If incorrect, prompts for replacement.
4. **Create symlink**

```bash
   ln -s "$PROJECT_ROOT/bin/brewsearch" "$HOME/.local/bin/bs"
```

![](https://storage.googleapis.com/pieces-web-extensions-cdn/pieces.png)

Copy And Save

![](https://storage.googleapis.com/pieces-web-extensions-cdn/link.png)

Share

![](https://storage.googleapis.com/pieces-web-extensions-cdn/copilot.png)

Ask Copilot

![](https://storage.googleapis.com/pieces-web-extensions-cdn/settings.png)

![](https://storage.googleapis.com/pieces-web-extensions-cdn/pieces.png)

Copy And Save

![](https://storage.googleapis.com/pieces-web-extensions-cdn/link.png)

Share

![](https://storage.googleapis.com/pieces-web-extensions-cdn/copilot.png)

Ask Copilot

![](https://storage.googleapis.com/pieces-web-extensions-cdn/settings.png)

![](https://storage.googleapis.com/pieces-web-extensions-cdn/pieces.png)

Copy And Save

![](https://storage.googleapis.com/pieces-web-extensions-cdn/link.png)

Share

![](https://storage.googleapis.com/pieces-web-extensions-cdn/copilot.png)

Ask Copilot

![](https://storage.googleapis.com/pieces-web-extensions-cdn/settings.png)

![](https://storage.googleapis.com/pieces-web-extensions-cdn/pieces.png)

Copy And Save

![](https://storage.googleapis.com/pieces-web-extensions-cdn/link.png)

Share

![](https://storage.googleapis.com/pieces-web-extensions-cdn/copilot.png)

Ask Copilot

![](https://storage.googleapis.com/pieces-web-extensions-cdn/settings.png)

1. **Report success or failure**
2. On success, displays symlink and target paths.
3. On failure, exits with an error code.

## :test_tube: Environment Verification

After installation, the script checks whether `$HOME/.local/bin` is on your `PATH`.

- If present, confirms readiness to use `bs`.
- If missing, suggests adding it to shell configuration.

```card
{
    "title": "Add to PATH",
    "content": "Add `export PATH=\"$HOME/.local/bin:$PATH\"` to your ~/.zshrc or ~/.bashrc, then reload your shell."
}
```

## :clipboard: Usage Example

Once installed, simply run:

```bash
bs redis
```

![](https://storage.googleapis.com/pieces-web-extensions-cdn/pieces.png)

Copy And Save

![](https://storage.googleapis.com/pieces-web-extensions-cdn/link.png)

Share

![](https://storage.googleapis.com/pieces-web-extensions-cdn/copilot.png)

Ask Copilot

![](https://storage.googleapis.com/pieces-web-extensions-cdn/settings.png)

![](https://storage.googleapis.com/pieces-web-extensions-cdn/pieces.png)

Copy And Save

![](https://storage.googleapis.com/pieces-web-extensions-cdn/link.png)

Share

![](https://storage.googleapis.com/pieces-web-extensions-cdn/copilot.png)

Ask Copilot

![](https://storage.googleapis.com/pieces-web-extensions-cdn/settings.png)

![](https://storage.googleapis.com/pieces-web-extensions-cdn/pieces.png)

Copy And Save

![](https://storage.googleapis.com/pieces-web-extensions-cdn/link.png)

Share

![](https://storage.googleapis.com/pieces-web-extensions-cdn/copilot.png)

Ask Copilot

![](https://storage.googleapis.com/pieces-web-extensions-cdn/settings.png)

![](https://storage.googleapis.com/pieces-web-extensions-cdn/pieces.png)

Copy And Save

![](https://storage.googleapis.com/pieces-web-extensions-cdn/link.png)

Share

![](https://storage.googleapis.com/pieces-web-extensions-cdn/copilot.png)

Ask Copilot

![](https://storage.googleapis.com/pieces-web-extensions-cdn/settings.png)

This invokes the BrewSearch tool to look up the **redis** package.

## ❌ Error Handling

The script handles common pitfalls:

- **Existing non-symlink file** at `$INSTALL_DIR/bs`: errors out, requires manual deletion.
- **Permission issues** when creating directories or symlinks: check file system permissions.
- **Symlink creation failure**: exits with an error code and message.

Ensure you have write access to `~/.local/bin` and that no conflicting files exist.

---

By following this installer, you’ll have a convenient `bs` command available globally on your system, streamlining your Homebrew package searches.