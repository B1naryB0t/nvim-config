-- ~/.config/nvim/lua/b1naryb0t/lazy/colors.lua
-- Color scheme configurations

return {
  -- === PRIMARY THEME ===
  {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000,               -- Load first for default theme
    lazy = false,                  -- Don't lazy load (needed for startup theme)
    config = function()
      require("rose-pine").setup({
        variant = "moon",          -- moon variant
        disable_background = true, -- Transparent background
        styles = {
          italic = false,
          transparency = true,
        },
      })
      -- Set rose-pine-moon as default
      vim.cmd.colorscheme("rose-pine")
    end,
  },

  -- === ALTERNATIVE THEMES ===
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        transparent_background = true,
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          telescope = true,
          treesitter = true,
          harpoon = false,
        },
      })
    end,
  },

  {
    "folke/tokyonight.nvim",
    config = function()
      require("tokyonight").setup({
        style = "storm",
        transparent = true,
        terminal_colors = true,
        styles = {
          comments = { italic = true },
          keywords = { italic = true },
        },
      })
    end,
  },

  {
    "scottmckendry/cyberdream.nvim",
    name = "cyberdream",
    config = function()
      require("cyberdream").setup({
        transparent = true,
        italic_comments = true,
        hide_fillchars = true,
        terminal_colors = true,
      })
    end,
  },
}

-- === THEME SWITCHING ===
-- :colorscheme rose-pine
-- :colorscheme cyberdream
-- :colorscheme catppuccin-mocha
-- :colorscheme tokyonight-storm
-- Or use :lua ColorMyPencils("<theme>")
