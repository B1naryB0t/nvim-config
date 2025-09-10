# B1naryb0t's Neovim Configuration

A modern, feature-rich Neovim configuration focused on productivity and development workflow.

## Features

- **Multiple Color Schemes** - Catppuccin (default), Tokyo Night, Rose Pine, Cyberdream
- **Telescope** - Fuzzy finder for files, grep, and more
- **Treesitter** - Advanced syntax highlighting and code parsing
- **File Management** - nvim-tree for file exploration, Harpoon for quick switching
- **LSP Support** - Language servers for multiple languages with Mason
- **Autocompletion** - nvim-cmp with snippet support
- **Code Formatting** - Automatic formatting with none-ls
- **Git Integration** - Fugitive for Git workflows
- **Focus Modes** - Zen mode and Twilight for distraction-free coding
- **Code Runner** - Execute code snippets directly in Neovim

## Installation

### Prerequisites

- Neovim >= 0.9.0
- Git
- Node.js (for some LSP servers)
- A Nerd Font (for icons)

### Quick Install

1. **Backup existing config** (if you have one):
   ```bash
   mv ~/.config/nvim ~/.config/nvim.backup
   ```

2. **Clone this repository**:
   ```bash
   git clone https://github.com/yourusername/nvim-config.git ~/.config/nvim
   ```

3. **Start Neovim**:
   ```bash
   nvim
   ```

4. **Install LSP servers** (optional):
   ```
   :Mason
   ```

### Manual Installation of Tools

Some tools need to be installed manually:

```bash
# Essential tools
npm install -g typescript typescript-language-server
pip install black isort pylsp-rope

# Optional but recommended
brew install ripgrep fd  # macOS
# or
sudo apt install ripgrep fd-find  # Ubuntu/Debian
```

## Key Mappings

### Leader Key: `<Space>`

### File Navigation
| Key | Action |
|-----|--------|
| `<leader>pv` | Toggle file tree |
| `<leader>pf` | Find files |
| `<C-p>` | Git files (fallback to find files) |
| `<leader>ps` | Live grep search |

### Quick Navigation (Harpoon)
| Key | Action |
|-----|--------|
| `<leader>a` | Add current file to harpoon |
| `<leader>h` | Toggle harpoon menu |
| `<leader>1-8` | Jump to harpoon slot 1-8 |
| `<leader>d1-8` | Remove harpoon slot 1-8 from list |
| `<leader>dr` | Remove current file from harpoon |
| `<C-k>` | Go to previous harpoon file |
| `<C-j>` | Go to next harpoon file |

### LSP & Code
| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `K` | Hover documentation |
| `<leader>vca` | Code actions |
| `<leader>vrr` | References |
| `<leader>vrn` | Rename |
| `<leader>f` | Format code |

### Git (Fugitive)
| Key | Action |
|-----|--------|
| `<leader>gs` | Git status |

### Code Runner
| Key | Action |
|-----|--------|
| `<leader>r` | Run code |
| `<leader>rc` | Close runner |
| `<leader>rp` | Run project |

### Focus Modes
| Key | Action |
|-----|--------|
| `<leader>zz` | Zen mode (90 width) |
| `<leader>zZ` | Zen mode (80 width, minimal) |
| `<leader>tw` | Toggle twilight |

### Utilities
| Key | Action |
|-----|--------|
| `<leader>u` | Toggle undotree |
| `<leader>tt` | Toggle trouble panel |
| `<C-a>` | Select all text |

## Color Schemes

Switch themes using:
```vim
:colorscheme catppuccin-mocha
:colorscheme tokyonight-storm
:colorscheme rose-pine-moon
:colorscheme cyberdream
```

Or use the helper function:
```vim
:lua ColorMyPencils("tokyonight-storm")
```

## Supported Languages

LSP support configured for:
- **Web**: JavaScript, TypeScript, HTML, CSS, JSON
- **Systems**: C, C++, Rust
- **Scripting**: Python, Bash, Lua
- **JVM**: Java, Kotlin
- **Config**: YAML

## Configuration Structure

```
~/.config/nvim/
├── init.lua                    # Entry point
└── lua/b1naryb0t/
    ├── init.lua               # Main config loader
    ├── set.lua                # Neovim settings
    ├── remap.lua              # Key mappings
    ├── lazy_init.lua          # Plugin manager setup
    └── lazy/                  # Plugin configurations
        ├── init.lua           # Plugin imports
        ├── colors.lua         # Color schemes
        ├── telescope.lua      # Fuzzy finder
        ├── treesitter.lua     # Syntax highlighting
        ├── mason.lua          # LSP management
        ├── cmp.lua            # Autocompletion
        └── ...               # Other plugins
```

## Contributing

Feel free to fork this configuration and make it your own! If you have improvements or fixes, pull requests are welcome.

## License

This configuration is open source and available under the [MIT License](LICENSE).

## Credits

This configuration is inspired by and built upon the work of many in the Neovim community, particularly:
- [ThePrimeagen](https://github.com/ThePrimeagen) for the foundational structure
- The maintainers of all the amazing plugins used

---

**Happy coding!**
