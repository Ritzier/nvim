local wk = require("which-key")
wk.register({
	["<C-h>"] = { "<C-w>h", "Focus left" },
	["<C-j>"] = { "<C-w>l", "Focus down" },
	["<C-k>"] = { "<C-w>k", "Focus up" },
	["<C-l>"] = { "<C-w>l", "Focus right" },
	["<C-n>"] = { ":NvimTreeToggle<CR>", "NvimTreeToggle" },
	["<A-j>"] = { ":BufferLineCycleNext<CR>", "Focus Next Buffer" },
	["<A-k>"] = { ":BufferLineCyclePrev<CR>", "Focus Prev Buffer" },
	["<A-S-j>"] = { ":BufferLineMoveNext<CR>", "Move Next Buffer" },
	["<A-S-k>"] = { ":BufferLineMovePrev<CR>", "Move Prev Buffer" },
	["<C-x>"] = { ":bdelete<CR>", "Delete buffer" },
}, { mode = "n", prefix = "", silent = true })

wk.register({
	["<"] = { "<gv", "Decrease Indent" },
	[">"] = { ">gv", "Increase Indent" },
	["<A-j>"] = { ":m '>+1<CR>gv=gv'", "Move line down" },
	["<A-k>"] = { ":m '>-2<CR>gv=gv'", "Move line up" },
	["ga"] = { ":'<, '>EasyAlign<CR>", "EasyAlign" },
	["e"] = { "<cmd>lua require('dapui').eval()<CR>", "Evaluate" },
	["<space>v"] = { "<cmd>GuardFmt<CR>", "Formatter" },
}, { mode = "v", prefix = "", silent = true })

wk.register({

	["t"] = {
		name = "Telescope",
		t = { "<cmd>Telescope<CR>", "Telescope" },
		l = { "<cmd>Telescope live_grep<CR>", "Live Grep" },
		f = { "<cmd>Telescope find_files<CR>", "Find Files" },
		h = { "<cmd>Telescope highlights<CR>", "Highlight" },
	},

	["v"] = { ":lua Toggle_venn()<CR>", "Toggle Venn" },

	["c"] = {
		name = "Color",
		c = { ":CccHighlighterToggle<CR>", "Highlighter Toggle" },
		v = { ":CccCovert<CR>", "Convert" },
		p = { ":CccPick<CR>", "Pick" },
	},
	["f"] = { "<cmd>GuardFmt<CR>", "Formatter" },
    ["d"] = {
        name = "Diffview",
        d = { "<cmd>DiffviewOpen<CR>", "DiffviewOpen" },
        c = { "<cmd>DiffviewClose<CR>", "DiffviewClose" },
    }
}, { mode = "n", prefix = "<leader>", silent = true })

wk.register({
    ["c"] = {
        name = "Code",
        c = {"<cmd>OverseerToggle<CR>", "OverseerToggle"},
        r = { "<cmd>OverseerRun<CR>", "OverseerRun" }
    }
}, { mode = "n", prefix = "<space>", silent = true })
