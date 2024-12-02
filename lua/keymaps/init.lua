vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Focus left" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Focus down" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Focus up" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Focus right" })
vim.keymap.set("v", "<", "<gv", { desc = "Decrease indent" })
vim.keymap.set("v", ">", ">gv", { desc = "Increase indent" })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })
vim.keymap.set("n", "<Esc>", "<Esc>:noh<CR>", { silent = true })
vim.keymap.set("i", "<Esc>", "<Esc>", { silent = true })

local ts_utils = require("nvim-treesitter.ts_utils")

local function print_node_type_at_cursor()
	local node = ts_utils.get_node_at_cursor()
	if not node then
		print("No Tree-sitter node found at cursor.")
		return
	end

	local node_type = node:type()
	print("Node type under cursor:", node_type)
end

-- Map a command to call this function
vim.api.nvim_create_user_command("PrintNodeType", print_node_type_at_cursor, {})

vim.keymap.set("i", "<F1>", "<cmd>PrintNodeType<CR>", { silent = true })
vim.keymap.set("n", "<F1>", "<cmd>PrintNodeType<CR>", { silent = true })
