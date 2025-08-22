-- ~/.config/nvim/lua/b1naryb0t/lazy/nvim-tree.lua
return {
  "nvim-tree/nvim-tree.lua",
  config = function()
    require("nvim-tree").setup({})
    vim.keymap.set("n", "<leader>pv", ":NvimTreeToggle<CR>")
  end,
}
