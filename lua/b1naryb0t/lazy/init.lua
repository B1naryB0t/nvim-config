-- ~/.config/nvim/lua/b1naryb0t/lazy/init.lua
-- Main plugin imports - individual files handle their own dependencies
return {

  -- Import modular configurations
  { import = "b1naryb0t.lazy.telescope" },    -- File finder, grep, git files
  { import = "b1naryb0t.lazy.treesitter" },   -- Syntax highlighting, parsing
  { import = "b1naryb0t.lazy.harpoon" },      -- Quick file switching
  { import = "b1naryb0t.lazy.undotree" },     -- Undo history visualization
  { import = "b1naryb0t.lazy.nvim-tree" },    -- File explorer
  { import = "b1naryb0t.lazy.trouble" },      -- Diagnostics panel
  { import = "b1naryb0t.lazy.zenmode" },      -- Distraction-free editing
  { import = "b1naryb0t.lazy.twilight" },     -- Dim inactive code
  { import = "b1naryb0t.lazy.code_runner" },  -- Execute code snippets
  { import = "b1naryb0t.lazy.vim-pencil" },   -- Better prose writing
  { import = "b1naryb0t.lazy.rest" },
	-- Core functionality modules
  { import = "b1naryb0t.lazy.mason" },        -- LSP server management
  { import = "b1naryb0t.lazy.cmp" },          -- Autocompletion engine
  { import = "b1naryb0t.lazy.null-ls" },      -- Formatting & linting
  { import = "b1naryb0t.lazy.colors" },       -- Color schemes
}
