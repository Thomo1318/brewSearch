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
