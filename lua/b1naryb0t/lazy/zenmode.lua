-- ~/.config/nvim/lua/b1naryb0t/lazy/zenmode.lua
return {
  "folke/zen-mode.nvim",
  config = function()

    -- Writer mode: centered prose, no distractions, soft wrap
    vim.keymap.set("n", "<leader>zz", function()
      require("zen-mode").setup({
        window = {
          width = 120,
          options = {
            wrap = true,
            linebreak = true,
            number = false,
            relativenumber = true,
            signcolumn = "no",
            colorcolumn = "",
            cursorline = false,
          },
        },
        plugins = {
          twilight = { enabled = true },  -- dim inactive paragraphs
          gitsigns = { enabled = false }, -- hide git signs
        },
      })
      require("zen-mode").toggle()
      vim.wo.wrap = true
      vim.wo.linebreak = true
    end, { desc = "Zen mode for writing" })

    -- Code mode: wider window, line numbers, no wrap
    vim.keymap.set("n", "<leader>zZ", function()
      require("zen-mode").setup({
        window = {
          width = 90,
          options = {
            wrap = false,
            number = true,
            relativenumber = true,
            signcolumn = "yes",
            colorcolumn = "80",
            cursorline = true,
          },
        },
        plugins = {
          twilight = { enabled = false },
          gitsigns = { enabled = true },
        },
      })
      require("zen-mode").toggle()
      vim.wo.wrap = false
      vim.opt.colorcolumn = "80"
    end, { desc = "Zen mode for code" })

  end,
}
