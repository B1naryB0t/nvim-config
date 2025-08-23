-- ~/.config/nvim/lua/b1naryb0t/lazy/nvim-tree.lua
return {
  "nvim-tree/nvim-tree.lua",
  config = function()
    require("nvim-tree").setup({
      view = {
        number = true,         -- Show absolute line numbers
        relativenumber = true, -- Show relative line numbers
        width = 30,           -- Set width of the tree
      },
    })
    -- Focus tree instead of toggling
    vim.keymap.set("n", "<leader>pv", function()
      local api = require("nvim-tree.api")
      if not api.tree.is_visible() then
        api.tree.open()
      end
      api.tree.focus()
    end, { desc = "Focus nvim-tree" })

    -- Optional: Add a separate toggle keymap
    vim.keymap.set("n", "<leader>pt", ":NvimTreeToggle<CR>", { desc = "Toggle nvim-tree" })
  end,
}
