-- ~/.config/nvim/lua/b1naryb0t/lazy/treesitter.lua
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "lua", "vim", "c", "cpp", "rust",
        "python", "kotlin", "javascript",
        "typescript", "bash", "java"
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { "markdown" },
      },
      indent = { enable = true },
      auto_install = true,
    })
  end,
}
