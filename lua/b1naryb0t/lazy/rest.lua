return {
  "rest-nvim/rest.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      table.insert(opts.ensure_installed, "http")
    end,
  },
  config = function()
    local rest = require("rest-nvim")

    rest.setup({
      result_split_horizontal = false,  -- use vertical split
      result_split_in_place = true,     -- open split near cursor
      skip_ssl_verification = false,
      highlight = { enabled = true, timeout = 150 },
      result = {
        show_url = true,
        show_http_info = true,
        show_headers = true,
      },
      jump_to_request = false,
      env_file = ".env",                -- use {{VARIABLE}} syntax in requests
    })

    -- safer keymaps
    local keymap = vim.api.nvim_set_keymap
    local opts = { noremap = true, silent = true }

    keymap("n", "<leader>rh", "<Plug>RestNvim", opts)      -- execute request
    keymap("n", "<leader>rhp", "<Plug>RestNvimPreview", opts) -- preview curl
    keymap("n", "<leader>rhl", "<Plug>RestNvimLast", opts)    -- rerun last
  end,
}
