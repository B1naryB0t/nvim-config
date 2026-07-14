-- ~/.config/nvim/lua/b1naryb0t/lazy/rest.lua
return {
	"rest-nvim/rest.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			table.insert(opts.ensure_installed, "http")
		end,
	},
	config = function()
		local rest = require("rest-nvim")

		rest.setup({
			result_split_horizontal = false, -- use vertical split
			result_split_in_place = true, -- open split near cursor
			skip_ssl_verification = false,
			highlight = { enabled = true, timeout = 150 },
			result = {
				show_url = true,
				show_http_info = true,
				show_headers = true,
			},
			jump_to_request = false,
			env_file = ".env", -- use {{VARIABLE}} syntax in requests
			custom_dynamic_variables = {},
			encode_url = true,
			yank_dry_run = true,
		})

		local keymap = vim.keymap.set
		local opts = { noremap = true, silent = true }

		-- Run the current request under the cursor
		keymap("n", "<leader>rh", function()
			vim.cmd("silent! write")
			local ok, _ = pcall(function()
				vim.cmd("Rest run")
			end)
			if not ok then
				vim.notify("Rest command not available", vim.log.levels.ERROR)
			end
		end, vim.tbl_extend("force", opts, { desc = "Execute HTTP request" }))

		-- Preview current request as curl
		keymap("n", "<leader>rhp", function()
			vim.cmd("Rest run dry")
		end, vim.tbl_extend("force", opts, { desc = "Preview request as curl" }))

		-- Rerun last request
		keymap("n", "<leader>rhl", function()
			vim.cmd("Rest last")
		end, vim.tbl_extend("force", opts, { desc = "Rerun last request" }))

		-- Run all requests in the current file
		keymap("n", "<leader>rha", function()
			vim.cmd("silent! write") -- save buffer
			local ok, _ = pcall(function()
				vim.cmd("Rest run_all") -- built-in command parses all requests
			end)
			if not ok then
				vim.notify("Failed to run all requests. Make sure rest.nvim is loaded.", vim.log.levels.ERROR)
			end
		end, vim.tbl_extend("force", opts, { desc = "Run all HTTP requests in file" }))

		-- Open .env file
		keymap("n", "<leader>rhe", function()
			local env_file = vim.fn.expand("%:p:h") .. "/.env"
			if vim.fn.filereadable(env_file) == 1 then
				vim.cmd("split " .. env_file)
			else
				vim.notify("No .env file found in current directory", vim.log.levels.WARN)
			end
		end, vim.tbl_extend("force", opts, { desc = "Open .env file" }))
	end,
}
