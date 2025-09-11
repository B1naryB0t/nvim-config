-- ~/.config/nvim/lua/b1naryb0t/lazy/autopairs.lua
return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  config = function()
    local autopairs = require("nvim-autopairs")

    autopairs.setup({
      check_ts = true, -- Enable treesitter integration
      ts_config = {
        lua = { "string", "source" },
        javascript = { "string", "template_string" },
        java = false, -- Don't check treesitter on java
      },
      disable_filetype = { "TelescopePrompt", "spectre_panel" },
      disable_in_macro = true, -- Disable when recording or executing a macro
      disable_in_visualblock = false, -- Disable in visual block mode
      disable_in_replace_mode = true,
      ignored_next_char = [=[[%w%%%'%[%"%.%`%$]]=],
      enable_moveright = true,
      enable_afterquote = true, -- Add bracket pairs after quote
      enable_check_bracket_line = true, -- Check bracket in same line
      enable_bracket_in_quote = true, -- Enable bracket in quote
      enable_abbr = false, -- Trigger abbreviation
      break_undo = true, -- Switch for basic rule break undo sequence
      check_comma = true,
      map_cr = true,
      map_bs = true, -- Map the <BS> key
      map_c_h = false, -- Map the <C-h> key to delete a pair
      map_c_w = false, -- Map <C-w> to delete a pair if possible
    })

    -- Integration with nvim-cmp (if you have it installed)
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    local cmp = require("cmp")
    cmp.event:on(
      "confirm_done",
      cmp_autopairs.on_confirm_done()
    )

    -- Custom rules
    local Rule = require("nvim-autopairs.rule")
    local ts_conds = require("nvim-autopairs.ts-conds")

    -- Add spaces between parentheses for specific languages
    autopairs.add_rules({
      Rule(" ", " ")
        :with_pair(function(opts)
          local pair = opts.line:sub(opts.col - 1, opts.col)
          return vim.tbl_contains({ "()", "[]", "{}" }, pair)
        end),
      Rule("( ", " )")
        :with_pair(function() return false end)
        :with_move(function(opts)
          return opts.prev_char:match(".%)") ~= nil
        end)
        :use_key(")"),
      Rule("{ ", " }")
        :with_pair(function() return false end)
        :with_move(function(opts)
          return opts.prev_char:match(".%}") ~= nil
        end)
        :use_key("}"),
      Rule("[ ", " ]")
        :with_pair(function() return false end)
        :with_move(function(opts)
          return opts.prev_char:match(".%]") ~= nil
        end)
        :use_key("]"),
    })

    -- Language specific rules
    autopairs.add_rules({
      -- Arrow function for JavaScript/TypeScript
      Rule("%(.*%)%s*%=>$", " {  }", { "typescript", "typescriptreact", "javascript", "javascriptreact" })
        :use_regex(true)
        :set_end_pair_length(2),
    })
  end,
}
