local M = {}

-- Define the pairs
local pairs = {
	{ "(", ")" },
	{ "[", "]" },
	{ "{", "}" },
	{ '"', '"' },
	{ "'", "'" },
	{ "<", ">" },
}

-- Function to insert closing pair
local function insert_pair(open, close)
	local line = vim.api.nvim_get_current_line()
	local col = vim.api.nvim_win_get_cursor(0)[2]
	local after = line:sub(col + 1, col + 1)

	if after:match("%s") or after == "" then
		return open .. close .. "<Left>"
	else
		return open
	end
end

-- Function to handle backspace
local function handle_backspace()
	local line = vim.api.nvim_get_current_line()
	local col = vim.api.nvim_win_get_cursor(0)[2]
	local before = line:sub(col, col)
	local after = line:sub(col + 1, col + 1)

	for _, pair in ipairs(pairs) do
		if before == pair[1] and after == pair[2] then
			return "<BS><Del>"
		end
	end

	return "<BS>"
end

-- Function to handle closing pair
local function handle_close(close)
	local line = vim.api.nvim_get_current_line()
	local col = vim.api.nvim_win_get_cursor(0)[2]
	local after = line:sub(col + 1, col + 1)

	if after == close then
		return "<Right>"
	else
		return close
	end
end

-- Function to handle newline
local function handle_newline()
	local line = vim.api.nvim_get_current_line()
	local col = vim.api.nvim_win_get_cursor(0)[2]
	local before = line:sub(col, col)
	local after = line:sub(col + 1, col + 1)

	for _, pair in ipairs(pairs) do
		if before == pair[1] and after == pair[2] then
			return "<CR><ESC>O"
		end
	end

	return "<CR>"
end

local valid_node_types = {
	"type_arguments",
	"type_parameter",
	"where_clause",
	"reference_type",
	"parameters",
}

-- Function to check if cursor is in a valid Rust context for <>
local function is_valid_rust_context()
	local filetype = vim.bo.filetype
	if filetype ~= "rust" then
		return false
	end

	local ts_utils = require("nvim-treesitter.ts_utils")
	local node = ts_utils.get_node_at_cursor()

	if node then
		local node_type = node:type()
		print(node_type)
		for _, valid_type in ipairs(valid_node_types) do
			if node_type == valid_type then
				return true
			end
		end
	end

	return false
end

-- Set up keymaps
function M.setup()
	for _, pair in ipairs(pairs) do
		vim.keymap.set("i", pair[1], function()
			if pair[1] == "<" and not is_valid_rust_context() then
				return "<"
			end
			return insert_pair(pair[1], pair[2])
		end, { expr = true, noremap = true })
		vim.keymap.set("i", pair[2], function()
			return handle_close(pair[2])
		end, { expr = true, noremap = true })
	end

	vim.keymap.set("i", "<BS>", handle_backspace, { expr = true, noremap = true })
	vim.keymap.set("i", "<CR>", handle_newline, { expr = true, noremap = true })
end

return M
