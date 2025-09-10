-- ~/.config/nvim/lua/b1naryb0t/lazy/harpoon.lua
return {
  "theprimeagen/harpoon",
  dependencies = { "nvim-lua/plenary.nvim" },
  lazy = false,
	config = function()
    local harpoon = require("harpoon")
    local mark = require("harpoon.mark")
    local ui = require("harpoon.ui")

    -- Setup (v1 style)
    harpoon.setup()

    -- Toggle Harpoon quick menu
    vim.keymap.set("n", "<leader>h", ui.toggle_quick_menu, {
      noremap = true,
      silent = true,
      desc = "Toggle Harpoon menu",
    })

    -- Add current buffer to Harpoon
    vim.keymap.set("n", "<leader>a", mark.add_file, {
      noremap = true,
      silent = true,
      desc = "Add current file to Harpoon",
    })

    -- Jump to specific slots (1-8)
    vim.keymap.set("n", "<leader>1", function() mark.goto_file(1) end, { desc = "Go to Harpoon slot 1" })
    vim.keymap.set("n", "<leader>2", function() mark.goto_file(2) end, { desc = "Go to Harpoon slot 2" })
    vim.keymap.set("n", "<leader>3", function() mark.goto_file(3) end, { desc = "Go to Harpoon slot 3" })
    vim.keymap.set("n", "<leader>4", function() mark.goto_file(4) end, { desc = "Go to Harpoon slot 4" })
    vim.keymap.set("n", "<leader>5", function() mark.goto_file(5) end, { desc = "Go to Harpoon slot 5" })
    vim.keymap.set("n", "<leader>6", function() mark.goto_file(6) end, { desc = "Go to Harpoon slot 6" })
    vim.keymap.set("n", "<leader>7", function() mark.goto_file(7) end, { desc = "Go to Harpoon slot 7" })
    vim.keymap.set("n", "<leader>8", function() mark.goto_file(8) end, { desc = "Go to Harpoon slot 8" })

    -- Remove slots 1-8
    vim.keymap.set("n", "<leader>d1", function() mark.rm_file(1) end, { desc = "Remove Harpoon slot 1" })
    vim.keymap.set("n", "<leader>d2", function() mark.rm_file(2) end, { desc = "Remove Harpoon slot 2" })
    vim.keymap.set("n", "<leader>d3", function() mark.rm_file(3) end, { desc = "Remove Harpoon slot 3" })
    vim.keymap.set("n", "<leader>d4", function() mark.rm_file(4) end, { desc = "Remove Harpoon slot 4" })
    vim.keymap.set("n", "<leader>d5", function() mark.rm_file(5) end, { desc = "Remove Harpoon slot 5" })
    vim.keymap.set("n", "<leader>d6", function() mark.rm_file(6) end, { desc = "Remove Harpoon slot 6" })
    vim.keymap.set("n", "<leader>d7", function() mark.rm_file(7) end, { desc = "Remove Harpoon slot 7" })
    vim.keymap.set("n", "<leader>d8", function() mark.rm_file(8) end, { desc = "Remove Harpoon slot 8" })

    -- Navigation shortcuts
    vim.keymap.set("n", "<leader>hk", ui.nav_prev, { desc = "Go to previous Harpoon file" })
    vim.keymap.set("n", "<leader>hj", ui.nav_next, { desc = "Go to next Harpoon file" })
  end,
}
