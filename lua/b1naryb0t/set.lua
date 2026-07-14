-- ~/.config/nvim/lua/b1naryb0t/set.lua
-- Core Neovim settings and editor behavior

-- === CURSOR & UI ===
vim.opt.guicursor = "" -- Use block cursor in all modes
vim.opt.termguicolors = true -- Enable 24-bit RGB colors
vim.opt.signcolumn = "yes" -- Always show sign column (prevents text shifting)
vim.opt.colorcolumn = "80" -- Highlight column 80 for line length guide

-- === LINE NUMBERS ===
vim.opt.nu = true -- Show absolute line numbers
vim.opt.relativenumber = true -- Show relative line numbers (great for motions)

-- === INDENTATION ===
vim.opt.tabstop = 4 -- Tab width of 4 spaces
vim.opt.shiftwidth = 4 -- Indent width of 4 spaces
vim.opt.expandtab = false -- Use actual tabs instead of spaces
vim.opt.smartindent = true -- Smart auto-indenting on new lines

-- === TEXT WRAPPING ===
vim.opt.wrap = false -- Don't wrap long lines

-- === FILE HANDLING ===
vim.opt.swapfile = false -- Disable swap files (can be annoying)
vim.opt.backup = false -- Don't create backup files
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir" -- Persistent undo directory
vim.opt.undofile = true -- Enable persistent undo across sessions

-- === SEARCH ===
vim.opt.hlsearch = false -- Don't highlight all search matches
vim.opt.incsearch = true -- Show search matches as you type

-- === SCROLLING & NAVIGATION ===
vim.opt.scrolloff = 8 -- Keep 8 lines above/below cursor when scrolling
vim.opt.isfname:append("@-@") -- Allow @ in filenames
vim.opt.wrap = true
vim.opt.linebreak = true

-- === PERFORMANCE ===
vim.opt.updatetime = 50 -- Faster completion and better user experience

-- === CLIPBOARD ===
vim.opt.clipboard = "unnamedplus" -- Use system clipboard by default

-- === FOLDING ===
vim.opt.foldcolumn = "1" -- Show fold column
vim.opt.foldlevel = 99 -- Start with all folds open
vim.opt.foldlevelstart = 99 -- Start with all folds open
vim.opt.foldenable = true -- Enable folding

-- === FILL CHARACTERS ===
-- Note: foldopen/foldclose only accept single-byte chars, fancy icons handled by nvim-ufo
vim.opt.fillchars = {
	fold = " ", -- Space for fold fill
	foldsep = " ", -- Space for fold separator
	diff = "╱", -- Fancy diff character
	eob = " ", -- Space for end of buffer
}

vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = "*.md",
	callback = function()
		local vault = "/home/b1naryb0t/Documents/Obsidian Vault"
		-- only run if the file is inside the vault
		local bufpath = vim.api.nvim_buf_get_name(0)
		if not bufpath:find(vault, 1, true) then
			return
		end
		local handle = vim.uv.fs_scandir(vault)
		if not handle then
			return
		end
		while true do
			local name, ftype = vim.uv.fs_scandir_next(handle)
			if not name then
				break
			end
			if ftype == "file" and name:match("^table:") then
				os.remove(vault .. "/" .. name)
			end
		end
	end,
})
