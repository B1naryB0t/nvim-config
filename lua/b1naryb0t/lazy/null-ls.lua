-- ~/.config/nvim/lua/b1naryb0t/lazy/null-ls.lua
-- Code formatting via none-ls (successor to null-ls)
-- Note: Diagnostics/linting handled by LSP servers for better performance
return {
  {
    "nvimtools/none-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },  -- Load when editing files
    dependencies = {
      "williamboman/mason.nvim",
      "jay-babu/mason-null-ls.nvim",  -- Bridge for automatic tool installation
    },
    config = function()
      -- Automatic installation of formatting tools via Mason
      require("mason-null-ls").setup({
        ensure_installed = {
          -- Web Development
          "prettierd",           -- JS/TS/JSON/CSS/HTML formatter (faster than prettier)

          -- Python
          "black",               -- Python code formatter
          "isort",               -- Python import sorter

          -- Systems Programming
          "clang-format",        -- C/C++ formatter

          -- Other Languages
          "stylua",              -- Lua formatter
          "google-java-format",  -- Java formatter
        },
        automatic_installation = true,
      })

      local null_ls = require("null-ls")
      local formatting = null_ls.builtins.formatting

      null_ls.setup({
        -- Only formatting sources (diagnostics handled by LSP servers)
        sources = {
          -- JavaScript/TypeScript/JSON/CSS/HTML
          formatting.prettierd.with({
            filetypes = {
              "javascript", "javascriptreact",
              "typescript", "typescriptreact",
              "json", "css", "html", "markdown"
            }
          }),

          -- Python
          formatting.black.with({
            extra_args = { "--line-length", "88" }  -- Black's default
          }),
          formatting.isort.with({
            extra_args = { "--profile", "black" }   -- Compatible with black
          }),

          -- Systems Programming
          formatting.clang_format.with({
            filetypes = { "c", "cpp" }
          }),

          -- Other Languages
          formatting.stylua.with({
            filetypes = { "lua" }
          }),
          formatting.google_java_format.with({
            filetypes = { "java" }
          }),
        },

        -- Optional: Format on save (uncomment to enable)
        -- on_attach = function(client, bufnr)
        --   if client.supports_method("textDocument/formatting") then
        --     vim.api.nvim_create_autocmd("BufWritePre", {
        --       buffer = bufnr,
        --       callback = function()
        --         vim.lsp.buf.format({ bufnr = bufnr })
        --       end,
        --     })
        --   end
        -- end,
      })
    end,
  },
}
