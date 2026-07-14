-- ~/.config/nvim/lua/b1naryb0t/lazy/obsidian.lua
return {
  "obsidian-nvim/obsidian.nvim",
  version = "*",
  lazy = true,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  opts = {
    legacy_commands = false,

    workspaces = {
      {
        name = "vault",
        path = "/home/b1naryb0t/Documents/Obsidian Vault",
      },
    },

    new_notes_location = "current_dir",

    note_id_func = function(title)
      if title ~= nil and type(title) == "string" and title ~= "" then
        return title
      else
        return tostring(os.time())
      end
    end,

    link = {
      style = "wiki",
      auto_update = true,
    },

    ui = {
      enable = false,
    },

    templates = {
      folder = {
        "00-09 System Admin/00 System Management/00.03 Templates for System Admin",
        "40-49 Teaching/40 Management of Teaching/40.03 Templates for Teaching",
        "40-49 Teaching/42 Keyboarding/42.03 Templates for Keyboarding",
        "40-49 Teaching/43 PLTW App Creators/43.03 Templates for PLTW App Creators",
        "40-49 Teaching/44 PLTW Building for the Future/44.03 Templates for PLTW Building for the Future",
        "40-49 Teaching/46 Contact Logs and Meeting Notes/46.03 Templates for Contact Logs and Meeting Notes",
        "40-49 Teaching/48 Teaching Daily Journal/48.03 Templates for Teaching Daily Journal",
        "50-59 Knowledge/51 Books/51.03 Templates for Books",
        "60-69 Hobbies/65 Writing/65.03 Templates for Writing",
        "70-79 Technology/74 Programming and Robotics/74.03 Templates for Programming and Robotics",
        "80-89 Projects/80 Management of Projects/80.03 Templates for Projects",
        "80-89 Projects/82 Blog and Website/82.03 Templates for Blog and Website",
      },
    },

    daily_notes = {
      folder = "50-59 Knowledge/59 Personal Thoughts Notes and Reflections",
      date_format = "%Y-%m-%d-%A",
    },

    completion = {
      min_chars = 3,
    },

    picker = {
      name = "telescope.nvim",
    },

    callbacks = {
      enter_note = function(note)
        vim.keymap.set("n", "<leader>ch", "<cmd>Obsidian toggle_checkbox<cr>",
          { buffer = true, desc = "Toggle checkbox" })
        vim.keymap.set("n", "<leader>ol", "<cmd>Obsidian follow_link<cr>",
          { buffer = true, desc = "Follow link" })
      end,
    },
  },
}
