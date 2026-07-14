return {
  "nvim-tree/nvim-tree.lua",
  config = function()
    require("nvim-tree").setup({
      sort = {
        sorter = function(nodes)
          table.sort(nodes, function(a, b)
            local a_name = a.name:lower()
            local b_name = b.name:lower()

            -- Extract leading number if present
            local a_num = tonumber(a_name:match("^([%d%.]+)"))
            local b_num = tonumber(b_name:match("^([%d%.]+)"))

            if a_num and b_num then
              return a_num < b_num
            elseif a_num then
              return true
            elseif b_num then
              return false
            else
              return a_name < b_name
            end
          end)
        end,
      },

      view = {
        number = true,
        relativenumber = true,
        width = 30,
      },
    })

    vim.keymap.set("n", "<leader>pv", function()
      local api = require("nvim-tree.api")
      if not api.tree.is_visible() then
        api.tree.open()
      end
      api.tree.focus()
    end, { desc = "Focus nvim-tree" })

    vim.keymap.set("n", "<leader>pt", ":NvimTreeToggle<CR>", { desc = "Toggle nvim-tree" })
  end,
}
