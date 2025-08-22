-- ~/.config/nvim/lua/b1naryb0t/lazy/mason.lua
-- LSP server management without mason-lspconfig bridge (avoids v2.0 compatibility issues)
return {
  {
    "williamboman/mason.nvim",
    cmd = "Mason",  -- Load when :Mason command is run
    config = function()
      require("mason").setup({
        ui = {
          border = "rounded",
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
          }
        }
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },  -- Load when editing files
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- LSP keymaps and behavior
      local on_attach = function(client, bufnr)
        -- Enable inlay hints if supported
        if client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
          pcall(vim.lsp.inlay_hint.enable, true, { bufnr = bufnr })
        end

        -- LSP keymaps (buffer-local)
        local opts = { buffer = bufnr, silent = true }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
        vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
        vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
        vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
        vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
        vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)

        -- Format keymaps
        vim.keymap.set("n", "<leader>f", function()
          vim.lsp.buf.format({ async = true })
        end, opts)
      end

      -- LSP server configurations
      -- Install these manually via :Mason
      local servers = {
        -- Web Development
        ts_ls = {
          settings = {
            typescript = {
              inlayHints = {
                includeInlayParameterNameHints = 'all',
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
              }
            }
          }
        },

        -- Python
        pylsp = {
          settings = {
            pylsp = {
              plugins = {
                pycodestyle = { enabled = false },  -- Use ruff via LSP instead
                mccabe = { enabled = false },
                pyflakes = { enabled = false },
                flake8 = { enabled = false },
              }
            }
          }
        },

        -- Systems Programming
        clangd = {
          cmd = { "clangd", "--background-index", "--clang-tidy" }
        },
        rust_analyzer = {
          settings = {
            ["rust-analyzer"] = {
              checkOnSave = { command = "clippy" },
              inlayHints = { enable = true }
            }
          }
        },

        -- JVM Languages
        kotlin_language_server = {},

        -- Scripting & Config
        bashls = {},
        jsonls = {},
        yamlls = {},
        html = {},
        cssls = {},

        -- Lua (Neovim configuration)
        lua_ls = {
          settings = {
            Lua = {
              workspace = { checkThirdParty = false },
              telemetry = { enable = false },
              diagnostics = { globals = { "vim" } },
              hint = { enable = true },  -- Enable inlay hints
            },
          },
        }
      }

      -- Setup each server with error handling
      for server, config in pairs(servers) do
        local server_config = vim.tbl_deep_extend("force", {
          capabilities = capabilities,
          on_attach = on_attach,
        }, config)

        -- Only setup if server is installed (graceful degradation)
        local ok, _ = pcall(function()
          lspconfig[server].setup(server_config)
        end)

        if not ok then
          vim.notify(
            string.format("LSP server '%s' not found. Install via :Mason", server),
            vim.log.levels.WARN
          )
        end
      end
    end,
  },
}
