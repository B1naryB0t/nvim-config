-- ~/.config/nvim/lua/b1naryb0t/lazy/twilight.lua
return {
  "folke/twilight.nvim",
  config = function()
    require("twilight").setup()
    vim.keymap.set("n","<leader>tw",":Twilight<CR>")
  end
}
