# BrewSearch

A Homebrew search utility with real-time progress indicators and formatted output.

## Features

- 🔍 **Comprehensive Search** - Search both formulae (CLI tools) and casks (GUI apps)
- 📊 **Progress Indicators** - Real-time progress bar during search
- 📋 **Formatted Output** - Clean, separated results with detailed package info
- ⚙️ **Configurable** - Customizable settings via config files
- 🔒 **Secure** - Environment-based API key management
- 🧪 **Tested** - Includes test suite for reliability

## Quick Start

### Installation

```bash
# Clone repository
git clone <repository-url> brewsearch
cd brewsearch

# Check requirements
./bin/check-requirements

# Configure environment
cp .env.example .env
# Edit .env and add your API keys

# Create symlink for easy access
ln -s $(pwd)/bin/brewsearch ~/.local/bin/bs
```

### Usage

```bash
# Search for packages
bs redis

# Search for Python
bs python

# Search for GUI apps
bs chrome
```

## Example Output

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

## Requirements

### Required
- **Bash 4.0+** - Shell interpreter
- **Homebrew** - Package manager ([install](https://brew.sh))

### Optional (Recommended)
Choose one for environment management:
- **mise** - Unified tool manager ([install](https://mise.jdx.dev))
- **uv** - Fast package installer ([install](https://docs.astral.sh/uv/))

Run `./bin/check-requirements` to verify all dependencies.

## Documentation

- 📖 [Installation Guide](docs/INSTALLATION.md) - Detailed setup instructions
- 📘 [Usage Guide](docs/USAGE.md) - Examples and tips
- 🛠️ [Development Guide](docs/DEVELOPMENT.md) - Contributing and development

## Project Structure

```
brewsearch/
├── bin/              # Executable scripts
│   ├── brewsearch           # Main application
│   └── check-requirements   # Dependency checker
├── lib/              # Reusable libraries
│   ├── progress.sh          # Progress bar functions
│   ├── search.sh            # Search utilities
│   └── format.sh            # Output formatting
├── config/           # Configuration files
├── docs/             # Documentation
├── tests/            # Test suite
└── requirements.txt  # System requirements
```

## Configuration

### Environment Variables

Create `.env` file from template:
```bash
cp .env.example .env
```

Configure your API keys:
```bash
EXA_API_KEY=your_api_key_here
```

### Settings

Edit `config/defaults.conf` to customize:
- Progress bar appearance
- Output formatting
- Separator styles

## Development

### Setup Development Environment

```bash
# Clone repository
git clone <repository-url> brewsearch
cd brewsearch

# Install dependencies
./bin/check-requirements

# Run tests
./tests/test_search.sh
```

### Running Tests

```bash
# Run all tests
for test in tests/*.sh; do bash "$test"; done
```

### Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Make your changes
4. Add tests for new functionality
5. Update documentation
6. Commit changes (`git commit -m 'feat: add amazing feature'`)
7. Push to branch (`git push origin feature/amazing-feature`)
8. Open a Pull Request

See [Development Guide](docs/DEVELOPMENT.md) for detailed instructions.

## Troubleshooting

### Common Issues

**Script not executable:**
```bash
chmod +x bin/brewsearch
```

**Homebrew not found:**
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

**No results found:**
- Check spelling
- Try partial names (e.g., `bs post` instead of `postgresql`)
- Update Homebrew: `brew update`

See [Installation Guide](docs/INSTALLATION.md) for more troubleshooting.

## License

MIT License - See LICENSE file for details

## Acknowledgments

- Built with [Homebrew](https://brew.sh)
- Environment management via [mise](https://mise.jdx.dev) or [uv](https://docs.astral.sh/uv/)
- Inspired by the need for better Homebrew search visualization

## Support

- 📫 Report issues: [GitHub Issues](<repository-url>/issues)
- 💬 Discussions: [GitHub Discussions](<repository-url>/discussions)
- 📚 Documentation: [docs/](docs/)

## Roadmap

- [ ] Add filtering options (--formula-only, --cask-only)
- [ ] Implement caching for faster searches
- [ ] Add JSON output format
- [ ] Support for custom output templates
- [ ] Integration with other package managers

---

**Made with ❤️ for the Homebrew community**
