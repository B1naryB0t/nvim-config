-- ~/.config/nvim/lua/b1naryb0t/lazy/folding.lua
return {
  {
    "kevinhwang91/nvim-ufo",
    dependencies = {
      "kevinhwang91/promise-async",
      "nvim-treesitter/nvim-treesitter",
    },
    event = "BufReadPost",
    config = function()
      local ufo = require("ufo")

      -- Using treesitter as fold provider
      ufo.setup({
        provider_selector = function(bufnr, filetype, buftype)
          return { "treesitter", "indent" }
        end,
        -- Custom fold text to show what's inside the fold
        fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
          local newVirtText = {}
          local suffix = (" 󰁂 %d lines"):format(endLnum - lnum)
          local sufWidth = vim.fn.strdisplaywidth(suffix)
          local targetWidth = width - sufWidth
          local curWidth = 0
          for _, chunk in ipairs(virtText) do
            local chunkText = chunk[1]
            local chunkWidth = vim.fn.strdisplaywidth(chunkText)
            if targetWidth > curWidth + chunkWidth then
              table.insert(newVirtText, chunk)
            else
              chunkText = truncate(chunkText, targetWidth - curWidth)
              local hlGroup = chunk[2]
              table.insert(newVirtText, { chunkText, hlGroup })
              chunkWidth = vim.fn.strdisplaywidth(chunkText)
              if curWidth + chunkWidth < targetWidth then
                suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
              end
              break
            end
            curWidth = curWidth + chunkWidth
          end
          table.insert(newVirtText, { suffix, "MoreMsg" })
          return newVirtText
        end,
        -- Preview fold content when hovering
        preview = {
          win_config = {
            border = { "", "─", "", "", "", "─", "", "" },
            winhighlight = "Normal:Folded",
            winblend = 0,
          },
          mappings = {
            scrollU = "<C-u>",
            scrollD = "<C-d>",
            jumpTop = "[",
            jumpBot = "]",
          },
        },
      })

      -- Key mappings for folding
      vim.keymap.set("n", "zR", ufo.openAllFolds, { desc = "Open all folds" })
      vim.keymap.set("n", "zM", ufo.closeAllFolds, { desc = "Close all folds" })
      vim.keymap.set("n", "zr", ufo.openFoldsExceptKinds, { desc = "Open folds except kinds" })
      vim.keymap.set("n", "zm", ufo.closeFoldsWith, { desc = "Close folds with" })
      vim.keymap.set("n", "zp", ufo.peekFoldedLinesUnderCursor, { desc = "Peek fold" })

      -- Additional folding keymaps
      vim.keymap.set("n", "zf", "zf", { desc = "Create fold" })
      vim.keymap.set("v", "zf", "zf", { desc = "Create fold from selection" })
      vim.keymap.set("n", "zd", "zd", { desc = "Delete fold" })
      vim.keymap.set("n", "zE", "zE", { desc = "Eliminate all folds" })

      -- Toggle fold under cursor
      vim.keymap.set("n", "<leader>z", "za", { desc = "Toggle fold" })
    end,
  },

  -- Enhanced fold column with additional info and fancy icons
  {
    "luukvbaal/statuscol.nvim",
    event = "BufReadPost",
    config = function()
      local builtin = require("statuscol.builtin")
      require("statuscol").setup({
        relculright = true,
        segments = {
          {
            text = {
              function(args)
                if args.fold.width > 0 then
                  if args.fold.close then
                    return ""  -- Fancy closed fold icon
                  else
                    return ""  -- Fancy open fold icon
                  end
                end
                return " "
              end
            },
            click = "v:lua.ScFa"
          },
          { text = { "%s" }, click = "v:lua.ScSa" },
          { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
        },
      })
    end,
  }
}
