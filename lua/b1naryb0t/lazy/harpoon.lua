-- ~/.config/nvim/lua/b1naryb0t/lazy/harpoon.lua
return {
	"theprimeagen/harpoon",
	dependencies = { "nvim-lua/plenary.nvim" },
	lazy = false,
	config = function()
		local harpoon = require("harpoon")
		local mark = require("harpoon.mark")
		local ui = require("harpoon.ui")

		-- Setup (v1 style) with custom menu configuration
		harpoon.setup({
			menu = {
				width = vim.api.nvim_win_get_width(0) - 4,
				height = 10,
				borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
			},
		})

		-- Custom function to setup harpoon menu with relative numbers
		local function setup_harpoon_menu_autocmd()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = "harpoon",
				callback = function()
					-- Enable relative line numbers in harpoon menu
					vim.opt_local.relativenumber = true
					vim.opt_local.number = true
					vim.opt_local.cursorline = true

					-- Create custom signs for slots 1-8 on the right side
					local signs = { "1", "2", "3", "4", "5", "6", "7", "8" }
					for i, sign in ipairs(signs) do
						vim.fn.sign_define("HarpoonSlot" .. i, {
							text = sign .. " ",
							texthl = "Number",
						})
						-- Place the sign on line i if it exists
						if vim.api.nvim_buf_line_count(0) >= i then
							vim.fn.sign_place(i, "harpoon", "HarpoonSlot" .. i, 0, { lnum = i })
						end
					end
				end,
			})
		end

		-- Setup the autocmd
		setup_harpoon_menu_autocmd()

		-- Toggle Harpoon quick menu
		vim.keymap.set("n", "<leader>h", ui.toggle_quick_menu, {
			noremap = true,
			silent = true,
			desc = "Toggle Harpoon menu",
		})

		-- Add current buffer to Harpoon
		vim.keymap.set("n", "<leader>a", mark.add_file, {
			noremap = true,
			silent = true,
			desc = "Add current file to Harpoon",
		})

		-- Jump to specific slots (1-8)
		vim.keymap.set("n", "<leader>1", function()
			ui.nav_file(1)
		end, { desc = "Go to Harpoon slot 1" })
		vim.keymap.set("n", "<leader>2", function()
			ui.nav_file(2)
		end, { desc = "Go to Harpoon slot 2" })
		vim.keymap.set("n", "<leader>3", function()
			ui.nav_file(3)
		end, { desc = "Go to Harpoon slot 3" })
		vim.keymap.set("n", "<leader>4", function()
			ui.nav_file(4)
		end, { desc = "Go to Harpoon slot 4" })
		vim.keymap.set("n", "<leader>5", function()
			ui.nav_file(5)
		end, { desc = "Go to Harpoon slot 5" })
		vim.keymap.set("n", "<leader>6", function()
			ui.nav_file(6)
		end, { desc = "Go to Harpoon slot 6" })
		vim.keymap.set("n", "<leader>7", function()
			ui.nav_file(7)
		end, { desc = "Go to Harpoon slot 7" })
		vim.keymap.set("n", "<leader>8", function()
			ui.nav_file(8)
		end, { desc = "Go to Harpoon slot 8" })

		-- Remove slots 1-8
		vim.keymap.set("n", "<leader>d1", function()
			ui.nav_file(1)
			mark.rm_file()
		end, { desc = "Remove Harpoon slot 1" })
		vim.keymap.set("n", "<leader>d2", function()
			ui.nav_file(2)
			mark.rm_file()
		end, { desc = "Remove Harpoon slot 2" })
		vim.keymap.set("n", "<leader>d3", function()
			ui.nav_file(3)
			mark.rm_file()
		end, { desc = "Remove Harpoon slot 3" })
		vim.keymap.set("n", "<leader>d4", function()
			ui.nav_file(4)
			mark.rm_file()
		end, { desc = "Remove Harpoon slot 4" })
		vim.keymap.set("n", "<leader>d5", function()
			ui.nav_file(5)
			mark.rm_file()
		end, { desc = "Remove Harpoon slot 5" })
		vim.keymap.set("n", "<leader>d6", function()
			ui.nav_file(6)
			mark.rm_file()
		end, { desc = "Remove Harpoon slot 6" })
		vim.keymap.set("n", "<leader>d7", function()
			ui.nav_file(7)
			mark.rm_file()
		end, { desc = "Remove Harpoon slot 7" })
		vim.keymap.set("n", "<leader>d8", function()
			ui.nav_file(8)
			mark.rm_file()
		end, { desc = "Remove Harpoon slot 8" })

		-- Navigation shortcuts
		vim.keymap.set("n", "<leader>hk", ui.nav_prev, { desc = "Go to previous Harpoon file" })
		vim.keymap.set("n", "<leader>hj", ui.nav_next, { desc = "Go to next Harpoon file" })

		-- Clear all harpoon marks
		vim.keymap.set("n", "<leader>hd", mark.clear_all, { desc = "Clear all Harpoon marks" })
	end,
}
