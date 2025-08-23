-- ~/.config/nvim/lua/b1naryb0t/remap.lua
-- Global keymaps and leader key configuration

vim.g.mapleader = " "  -- Set space as leader key

-- === FILE NAVIGATION ===
-- Note: <leader>pv opens nvim-tree (configured in nvim-tree.lua), not default file explorer
-- vim.cmd.Ex is kept as fallback for when nvim-tree isn't loaded

-- === VISUAL MODE EDITING ===
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- === NAVIGATION & SCROLLING ===
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines and keep cursor position" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down and center" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up and center" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result and center" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result and center" })

-- === CLIPBOARD OPERATIONS ===
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste without yanking selection" })
vim.keymap.set({"n","v"}, "<leader>y", [["+y]], { desc = "Yank to system clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Yank line to system clipboard" })
vim.keymap.set({"n","v"}, "<leader>d", [["_d]], { desc = "Delete without yanking" })

-- === QUICKFIX & LOCATION LISTS ===
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz", { desc = "Next quickfix item" })
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz", { desc = "Previous quickfix item" })
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "Next location list item" })
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "Previous location list item" })

-- === TEXT MANIPULATION ===
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "Replace word under cursor" })

-- === UTILITY ===
vim.keymap.set("i", "<C-c>", "<Esc>", { desc = "Escape insert mode" })
vim.keymap.set("n", "Q", "<nop>", { desc = "Disable Ex mode" })
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>",
  { silent = true, desc = "Make current file executable" })
-- Select all (like Ctrl+A in other editors)
vim.keymap.set("n", "<C-a>", "ggVG", { desc = "Select all" })
vim.keymap.set("i", "<C-a>", "<Esc>ggVG", { desc = "Select all from insert mode" })

-- === TMUX INTEGRATION ===
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>",
  { desc = "Open tmux sessionizer" })
vim.keymap.set("n", "<leader>gg", "<cmd>silent !tmux new-window -c $(pwd) lazygit<CR>",
  { desc = "Open LazyGit in tmux window" })

-- === CONFIG MANAGEMENT ===
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end, { desc = "Reload Neovim configuration" })

-- === CODE RUNNER ===
-- These keymaps work with the code_runner.nvim plugin
vim.keymap.set("n", "<leader>r", ":RunCode<CR>",
  { noremap = true, silent = true, desc = "Run code" })
vim.keymap.set("n", "<leader>rc", ":RunClose<CR>",
  { noremap = true, silent = true, desc = "Close code runner" })
vim.keymap.set("n", "<leader>rp", ":RunProject<CR>",
  { noremap = true, silent = true, desc = "Run project" })

-- NOTE: LSP-specific keymaps are configured in mason.lua on_attach function
-- NOTE: Plugin-specific keymaps are configured in their respective files
