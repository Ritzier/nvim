local wk = require("which-key")

wk.add({
	{
		mode = { "n" },
		{ "<C-h>", "<C-w>h", desc = "Focus left" },
		{ "<C-j>", "<C-w>j", desc = "Focus down" },
		{ "<C-k>", "<C-w>k", desc = "Focus up" },
		{ "<C-l>", "<C-w>l", desc = "Focus right" },
		{ "<C-x>", ":bdelete<CR>", desc = "Delete buffer" },
		{ "<leader>d", group = "DiffView" },
		{ "<leader>t", group = "Telescope" },
		{ "<space>d", group = "Doc View" },
		{ "<space>l", group = "Lsp" },
	},

	{
		mode = { "v" },
		{ "<", "<gv", desc = "Decrease Indent" },
		{ ">", ">gv", desc = "Increase Indent" },
		{ "<A-j>", ":m '>+1<CR>gv=gv'", desc = "Move line down" },
		{ "<A-k>", ":m '>-2<CR>gv=gv'", desc = "Move line up" },
		-- { "ga", ":'<,'>EasyAlign<CR>", desc = "EasyAlign" },
		{ "s", ":'<,'>Sort u<CR>", desc = "Sort" },
	},
})
