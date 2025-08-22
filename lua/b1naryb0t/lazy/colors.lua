-- ~/.config/nvim/lua/b1naryb0t/lazy/colors.lua
-- Color scheme configurations
-- ColorMyPencils() function is defined in init.lua and can be called from anywhere

return {
  -- === PRIMARY THEME ===
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,           -- Load first (highest priority)
    lazy = false,              -- Don't lazy load (needed for startup theme)
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",               -- Dark theme variant
        transparent_background = true,   -- Transparent background for terminal
        integrations = {
          cmp = true,                    -- nvim-cmp integration
          gitsigns = true,               -- Git integration
          nvimtree = true,               -- File explorer integration
          telescope = true,              -- Fuzzy finder integration
          treesitter = true,             -- Syntax highlighting integration
          harpoon = true,                -- Quick file switching integration
        }
      })
      -- Set as default theme
      vim.cmd.colorscheme("catppuccin-mocha")
    end,
  },

  -- === ALTERNATIVE THEMES ===
  -- Switch using :colorscheme <name> or ColorMyPencils("<name>")

  {
    "folke/tokyonight.nvim",
    config = function()
      require("tokyonight").setup({
        style = "storm",              -- Available: storm, moon, night, day
        transparent = true,           -- Transparent background
        terminal_colors = true,       -- Configure terminal colors
        styles = {
          comments = { italic = true },
          keywords = { italic = true },
        },
      })
    end,
  },

  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require("rose-pine").setup({
        variant = "moon",             -- Available: auto, main, moon, dawn
        disable_background = true,    -- Transparent background
        styles = {
          italic = false,             -- Disable italics if preferred
          transparency = true,
        },
      })
    end,
  },

  {
    "scottmckendry/cyberdream.nvim",
    name = "cyberdream",
    config = function()
      require("cyberdream").setup({
        transparent = true,           -- Transparent background
        italic_comments = true,       -- Italic comments
        hide_fillchars = true,        -- Hide fillchars
        terminal_colors = true,       -- Terminal colors
      })
    end,
  },
}

-- === THEME SWITCHING ===
-- Use these commands to switch themes:
-- :colorscheme catppuccin-mocha
-- :colorscheme tokyonight-storm
-- :colorscheme rose-pine-moon
-- :colorscheme cyberdream
--
-- Or use the helper function from init.lua:
-- :lua ColorMyPencils("tokyonight-storm")
