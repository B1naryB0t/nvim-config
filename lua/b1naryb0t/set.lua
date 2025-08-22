-- ~/.config/nvim/lua/b1naryb0t/set.lua
-- Core Neovim settings and editor behavior

-- === CURSOR & UI ===
vim.opt.guicursor = ""                    -- Use block cursor in all modes
vim.opt.termguicolors = true              -- Enable 24-bit RGB colors
vim.opt.signcolumn = "yes"                -- Always show sign column (prevents text shifting)
vim.opt.colorcolumn = "80"                -- Highlight column 80 for line length guide

-- === LINE NUMBERS ===
vim.opt.nu = true                         -- Show absolute line numbers
vim.opt.relativenumber = true             -- Show relative line numbers (great for motions)

-- === INDENTATION ===
vim.opt.tabstop = 4                       -- Tab width of 4 spaces
vim.opt.shiftwidth = 4                    -- Indent width of 4 spaces
vim.opt.expandtab = false                 -- Use actual tabs instead of spaces
vim.opt.smartindent = true                -- Smart auto-indenting on new lines

-- === TEXT WRAPPING ===
vim.opt.wrap = false                      -- Don't wrap long lines

-- === FILE HANDLING ===
vim.opt.swapfile = false                  -- Disable swap files (can be annoying)
vim.opt.backup = false                    -- Don't create backup files
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"  -- Persistent undo directory
vim.opt.undofile = true                   -- Enable persistent undo across sessions

-- === SEARCH ===
vim.opt.hlsearch = false                  -- Don't highlight all search matches
vim.opt.incsearch = true                  -- Show search matches as you type

-- === SCROLLING & NAVIGATION ===
vim.opt.scrolloff = 8                     -- Keep 8 lines above/below cursor when scrolling
vim.opt.isfname:append("@-@")             -- Allow @ in filenames

-- === PERFORMANCE ===
vim.opt.updatetime = 50                   -- Faster completion and better user experience

-- === CLIPBOARD ===
vim.opt.clipboard = "unnamedplus"         -- Use system clipboard by default

-- === ADDITIONAL QUALITY OF LIFE ===
-- These settings make Neovim more pleasant to use:
-- - guicursor = "" gives you block cursor in insert mode (more visible)
-- - signcolumn = "yes" prevents text jumping when diagnostics appear
-- - scrolloff = 8 keeps context visible when navigating
-- - undofile = true means you can undo even after closing and reopening files
