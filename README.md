# nvim-config

Personal Neovim config built on [LazyVim](https://github.com/LazyVim/LazyVim).

## Keymaps

| Key | Action |
|-----|--------|
| `jj` | Exit insert mode |
| `Space + r` | Compile & run current C++ file |
| `Space + ac` | Toggle Claude Code (right split) |
| `Space + Space` | Fuzzy file finder |
| `Space + ,` | Open buffers list |
| `Space + e` | File tree (neo-tree) |
| `Space + b + d` | Close current buffer |
| `Shift + H / L` | Previous / next buffer |

## C++ Setup

### Compile & Run (`Space + r`)

Saves the current file, compiles all `.cpp` files in the directory, and runs the output in a bottom split. Press Enter to close the terminal when done.

Compiler flags match the VS Code tasks.json setup:

```
g++ -fdiagnostics-color=always -g -ggdb -pedantic-errors
    -Wall -Weffc++ -Wextra -Wconversion -Wsign-conversion
    -std=c++23 <dir>/**.cpp -o <dir>/<filename> -I./source/includes
```

- Output binary is placed next to the source file (not `/tmp/`)
- Compiles all `.cpp` files in the current file's directory
- Debug symbols included (`-g -ggdb`)

### Formatting

Auto-format on save via `conform.nvim` using `clang-format`.

Configured in `lua/plugins/cpp.lua`.

## Options

- Inlay hints disabled (`vim.opt.inlayHints = { enabled = false }`)

## Plugin Notes

- Uses `Snacks.terminal` for the Claude Code terminal (right split, 40% width)
- C++ run terminal uses a plain vim split (`botright 15split`) to avoid conflicts with the Snacks terminal toggle
