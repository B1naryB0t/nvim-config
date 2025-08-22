-- ~/.config/nvim/lua/b1naryb0t/lazy/fugitive.lua
return {
  "tpope/vim-fugitive",
  config = function()
    vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
    local aug = vim.api.nvim_create_augroup("B1naryb0t_Fugitive", {})
    vim.api.nvim_create_autocmd("BufWinEnter", {
      group = aug,
      pattern="*",
      callback = function()
        if vim.bo.ft ~= "fugitive" then return end
        local opts = { buffer = 0 }
        vim.keymap.set("n","<leader>p",function() vim.cmd.Git('push') end,opts)
        vim.keymap.set("n","<leader>P",function() vim.cmd.Git({'pull','--rebase'}) end,opts)
        vim.keymap.set("n","<leader>t",":Git push -u origin ",opts)
      end
    })
  end
}
