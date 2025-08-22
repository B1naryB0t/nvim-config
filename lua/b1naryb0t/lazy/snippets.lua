-- ~/.config/nvim/lua/b1naryb0t/lazy/snippets.lua
-- Note: LuaSnip is already configured in cmp.lua, this adds extra snippet keymaps
return {
  {
    "L3MON4D3/LuaSnip",
    -- Extra keymaps
    keys = {
      { "<C-s>e", function() require("luasnip").expand() end, mode = { "i", "s" }, desc = "Expand snippet" },
      { "<C-s>;", function() require("luasnip").jump(1) end, mode = { "i", "s" }, desc = "Jump forward" },
      { "<C-s>,", function() require("luasnip").jump(-1) end, mode = { "i", "s" }, desc = "Jump backward" },
      { "<C-E>", function()
        local ls = require("luasnip")
        if ls.choice_active() then ls.change_choice(1) end
      end, mode = { "i", "s" }, desc = "Change choice" },
    },
    config = function()
      -- Additional filetype extensions
      require("luasnip").filetype_extend("javascript", { "jsdoc" })
    end,
  },
}
