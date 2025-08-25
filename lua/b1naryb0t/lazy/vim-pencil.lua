-- ~/.config/nvim/lua/b1naryb0t/lazy/vim-pencil.lua
-- vim-pencil: Better writing experience with soft wrapping and improved navigation

return {
  "preservim/vim-pencil",
  ft = { "markdown", "text", "tex", "rst", "asciidoc", "wiki" },  -- Load only for writing filetypes
  config = function()
    -- vim-pencil configuration
    vim.g["pencil#wrapModeDefault"] = "soft"   -- Default to soft wrap mode
    vim.g["pencil#autoformat"] = 1             -- Enable auto-formatting
    vim.g["pencil#conceallevel"] = 3           -- Higher conceal level for markdown
    vim.g["pencil#cursorwrap"] = 1             -- Wrap cursor movement
    vim.g["pencil#softDetectSample"] = 20      -- Lines to sample for detection
    vim.g["pencil#softDetectThreshold"] = 130  -- Threshold for soft wrap detection
    
    -- Custom settings for different writing modes
    vim.g["pencil#map#suspend_af"] = "K"       -- Suspend auto-format key
    
    -- Autocommands for writing filetypes
    local pencil_group = vim.api.nvim_create_augroup("pencil", { clear = true })
    
    -- Auto-enable pencil for writing filetypes
    vim.api.nvim_create_autocmd("FileType", {
      group = pencil_group,
      pattern = { "markdown", "mkd", "text", "tex", "textile", "rst", "asciidoc" },
      callback = function()
        vim.cmd("call pencil#init()")
        
        -- Writing-specific settings
        vim.opt_local.spell = true           -- Enable spell checking
        vim.opt_local.wrap = true            -- Enable visual wrapping
        vim.opt_local.linebreak = true       -- Break at word boundaries
        vim.opt_local.colorcolumn = ""       -- Remove column guide for writing
        vim.opt_local.number = false         -- Hide line numbers for distraction-free writing
        vim.opt_local.relativenumber = false
        
        -- Optional: Different settings for hard wrap mode
        -- Uncomment if you prefer hard wrapping for certain files
        -- vim.opt_local.textwidth = 80
      end,
    })
    
    -- Git commit messages - use hard wrap
    vim.api.nvim_create_autocmd("FileType", {
      group = pencil_group,
      pattern = "gitcommit",
      callback = function()
        vim.cmd("call pencil#init({'wrap': 'hard'})")
        vim.opt_local.spell = true
        vim.opt_local.textwidth = 72  -- Standard git commit line length
      end,
    })
    
    -- Keymaps for pencil functionality
    vim.keymap.set("n", "<leader>wp", "<cmd>call pencil#init()<CR>", 
      { desc = "Enable vim-pencil" })
    vim.keymap.set("n", "<leader>ws", "<cmd>TogglePencil<CR>", 
      { desc = "Toggle soft/hard pencil mode" })
    vim.keymap.set("n", "<leader>wf", "<cmd>call pencil#setAutoFormat(1)<CR>", 
      { desc = "Enable pencil auto-format" })
    vim.keymap.set("n", "<leader>wF", "<cmd>call pencil#setAutoFormat(0)<CR>", 
      { desc = "Disable pencil auto-format" })
    
    -- Writing navigation keymaps (work better with soft wrap)
    vim.keymap.set("n", "j", "gj", { desc = "Move down by visual line" })
    vim.keymap.set("n", "k", "gk", { desc = "Move up by visual line" })
    vim.keymap.set("n", "0", "g0", { desc = "Go to beginning of visual line" })
    vim.keymap.set("n", "$", "g$", { desc = "Go to end of visual line" })
    
    vim.keymap.set("i", "<C-e>", "<C-o>g$", { desc = "Go to end of visual line" })
  end,
}
