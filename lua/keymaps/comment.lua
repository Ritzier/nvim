-- TODO:
-- comment for rust

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- Normal mode mappings
keymap("n", "gcl", "^i/// <Esc>", opts)
keymap("n", "gld", "^i//! <Esc>", opts)

keymap("i", "<C-c>", "<Esc>^i// <Esc>A", opts)
keymap("i", "<C-l>", "<Esc>^i/// <Esc>A", opts)
keymap("i", "<C-d>", "<Esc>^i//! <Esc>A", opts)

keymap("v", "gcl", ":lua Insert_at_line_start('/// ')<CR>", opts)
keymap("v", "gcd", ":lua Insert_at_line_start('//! ')<CR>", opts)

function Insert_at_line_start(comment)
	-- Get virtual selected line
	local line_start = vim.fn.line("'<") - 1
	local line_end = vim.fn.line("'>")
	local lines = vim.api.nvim_buf_get_lines(0, line_start, line_end, false)
	for i = 1, #lines do
		lines[i] = comment .. lines[i]
	end
	vim.api.nvim_buf_set_lines(0, line_start, line_end, false, lines)
end
