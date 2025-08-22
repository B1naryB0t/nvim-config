-- ~/.config/nvim/lua/b1naryb0t/lazy/cmp.lua
-- Autocompletion engine with LSP, buffer, path, and snippet sources
return {
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",  -- Load only when entering insert mode for better startup time
    dependencies = {
      -- Completion sources
      "hrsh7th/cmp-nvim-lsp",      -- LSP completions (functions, variables, etc.)
      "hrsh7th/cmp-buffer",        -- Words from current buffer
      "hrsh7th/cmp-path",          -- File system paths

      -- Snippet engine and library
      {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = "make install_jsregexp",  -- For advanced regex features
      },
      "rafamadriz/friendly-snippets",    -- Pre-made snippets for many languages
    },
    config = function()
      -- Better completion behavior
      vim.o.completeopt = "menu,menuone,noselect"

      -- Initialize snippet engine
      local luasnip = require("luasnip")
      require("luasnip.loaders.from_vscode").lazy_load()  -- Load friendly-snippets

      local cmp = require("cmp")
      cmp.setup({
        -- Snippet expansion
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },

        -- Key mappings
        mapping = cmp.mapping.preset.insert({
          -- Navigation
          ["<C-p>"] = cmp.mapping.select_prev_item(),
          ["<C-n>"] = cmp.mapping.select_next_item(),

          -- Confirm selection
          ["<C-y>"] = cmp.mapping.confirm({ select = true }),

          -- Manual trigger
          ["<C-Space>"] = cmp.mapping.complete(),

          -- Smart tab - completion navigation or snippet jumping
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),

          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),

        -- Completion sources (order matters - higher priority first)
        sources = cmp.config.sources({
          { name = "nvim_lsp", priority = 1000 },  -- LSP completions first
          { name = "luasnip", priority = 750 },    -- Snippets second
          { name = "path", priority = 250 },       -- File paths third
        }, {
          { name = "buffer", priority = 50 },      -- Buffer words as fallback
        }),
      })
    end,
  },
}
