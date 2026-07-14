-- ~/.config/nvim/lua/b1naryb0t/lazy/mason.lua
-- LSP server management using vim.lsp.config (nvim 0.11+ API)
return {
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    config = function()
      require("mason").setup({
        ui = {
          border = "rounded",
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- LSP keymaps set on attach via autocmd (0.11+ pattern)
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("lsp_attach_keymaps", { clear = true }),
        callback = function(event)
          local bufnr = event.buf
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          local opts = { buffer = bufnr, silent = true }

          -- Enable inlay hints if supported
          if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
            pcall(vim.lsp.inlay_hint.enable, true, { bufnr = bufnr })
          end

          -- LSP keymaps
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
          vim.keymap.set("n", "<leader>f", function()
            vim.lsp.buf.format({ async = true })
          end, opts)
        end,
      })

      -- Server configurations using new vim.lsp.config API
      local servers = {
        marksman = {},

        ts_ls = {
          settings = {
            typescript = {
              inlayHints = {
                includeInlayParameterNameHints = "all",
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
              },
            },
          },
        },

        pylsp = {
          settings = {
            pylsp = {
              plugins = {
                pycodestyle = { enabled = false },
                mccabe = { enabled = false },
                pyflakes = { enabled = false },
                flake8 = { enabled = false },
              },
            },
          },
        },

        clangd = {
          cmd = { "clangd", "--background-index", "--clang-tidy" },
        },

        rust_analyzer = {
          settings = {
            ["rust-analyzer"] = {
              checkOnSave = { command = "clippy" },
              inlayHints = { enable = true },
            },
          },
        },

        kotlin_language_server = {},
        bashls = {},
        jsonls = {},
        yamlls = {},
        html = {},
        cssls = {},

        lua_ls = {
          settings = {
            Lua = {
              workspace = { checkThirdParty = false },
              telemetry = { enable = false },
              diagnostics = { globals = { "vim" } },
              hint = { enable = true },
            },
          },
        },
      }

      -- Register each server with vim.lsp.config then enable it
      for server, config in pairs(servers) do
        local merged = vim.tbl_deep_extend("force", {
          capabilities = capabilities,
        }, config)

        local ok, err = pcall(function()
          vim.lsp.config(server, merged)
          vim.lsp.enable(server)
        end)

        if not ok then
          vim.notify(
            string.format("LSP server '%s' failed to configure: %s", server, err),
            vim.log.levels.WARN
          )
        end
      end
    end,
  },
}
