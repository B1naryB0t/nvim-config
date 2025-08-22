-- ~/.config/nvim/lua/b1naryb0t/init.lua
require("b1naryb0t.set")
require("b1naryb0t.remap")
require("b1naryb0t.lazy_init")

-- helper to change colorscheme easily
function ColorMyPencils(color)
  color = color or "catppuccin-mocha"
  vim.cmd.colorscheme(color)
end
