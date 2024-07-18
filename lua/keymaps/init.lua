local wk = require("which-key")

wk.add({
	{
		mode = { "n" },
		{ "<C-n>", ":NvimTreeToggle<CR>", desc = "NvimTreeToggle" },
		{ "<C-h>", "<C-w>h", desc = "Focus left" },
		{ "<C-j>", "<C-w>j", desc = "Focus down" },
		{ "<C-k>", "<C-w>k", desc = "Focus up" },
		{ "<C-l>", "<C-w>l", desc = "Focus right" },
		{ "<A-j>", ":BufferLineCycleNext<CR>", desc = "Focus Next Buffer" },
		{ "<A-k>", ":BufferLineCyclePrev<CR>", desc = "Focus Prev Buffer" },
		{ "<A-S-j>", ":BufferLineMoveNext<CR>", desc = "Move Next Buffer" },
		{ "<A-S-k>", ":BufferLineMovePrev<CR>", desc = "Move Prev Buffer" },
		{ "<C-x>", ":bdelete<CR>", desc = "Delete buffer" },
		{ "<leader>t", group = "Telescope" },
		{ "<leader>tt", "<cmd>Telescope<CR>", desc = "Telescope" },
		{ "<leader>tl", "<cmd>Telescope live_grep<CR>", desc = "Live Grep" },
		{ "<leader>tf", "<cmd>Telescope find_files<CR>", desc = "Find Files" },
		{ "<leader>d", group = "DiffView" },
		{ "<leader>dd", "<cmd>DiffviewOpen", desc = "DiffView Open" },
		{ "<leader>dc", "<cmd>DiffviewClose", desc = "DiffView Close" },
	},

	-- {
	-- 	mode = { "i" },
	-- 	{ "<A-l>", "<Plug>(TaboutMulti)<CR>", desc = "Tabout Next" },
	-- 	{ "<A-h>", "<Plug>(TaboutBackMulti)<CR>", desc = "Tabout Prev" },
	-- },

	{
		mode = { "v" },
		{ "<", "<gv", desc = "Decrease Indent" },
		{ ">", ">gv", desc = "Increase Indent" },
		{ "<A-j>", ":m '>+1<CR>gv=gv'", desc = "Move line down" },
		{ "<A-k>", ":m '>-2<CR>gv=gv'", desc = "Move line up" },
		-- { "ga", ":'<,'>EasyAlign<CR>", desc = "EasyAlign" },
		-- { "<space>", ":'<,'>Sort", desc = "" },
	},
})
