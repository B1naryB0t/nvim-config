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
				vim.keymap.set(
					"n",
					"<leader>ch",
					"<cmd>Obsidian toggle_checkbox<cr>",
					{ buffer = true, desc = "Toggle checkbox" }
				)
				vim.keymap.set(
					"n",
					"<leader>ol",
					"<cmd>Obsidian follow_link<cr>",
					{ buffer = true, desc = "Follow link" }
				)
			end,
		},
	},
}
