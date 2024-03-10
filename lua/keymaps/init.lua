local wk = require("which-key")
wk.register({
    ["<C-a>"] = { ":wincmd w<CR>", "Focus Float" },
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
    ["1"] = { ":OverseerRun<CR>", "Overseer" },
    ["!"] = { ":OverseerToggle<CR>", "Overseer" },
	["6"] = { ":lua require('dap').continue()<CR>", "debug: Run/Continue" },
	["7"] = { ":lua require('dap').terminate()<CR>", "debug: Stop" },
	["8"] = { ":lua require('dap').toggle_breakpoint()<CR>", "debug: Toggle breakpoint" },
	["9"] = { ":lua require('dap').step_into()<CR>", "debug: Step into" },
	["10"] = { ":lua require('dap').step_out()<CR>", "debug: Step out" },
	["11"] = { ":lua require('dap').step_over()<CR>", "debug: Step over" },
}, { mode = "n", prefix = "", {silent = true, noremap = true} })

wk.register({
	["<"] = { "<gv", "Decrease Indent" },
	[">"] = { ">gv", "Increase Indent" },
	["<A-j>"] = { ":m '>+1<CR>gv=gv'", "Move line down" },
	["<A-k>"] = { ":m '>-2<CR>gv=gv'", "Move line up" },
	["ga"] = { ":'<,'>EasyAlign<CR>", "EasyAlign" },
	["e"] = { "<cmd>lua require('dapui').eval()<CR>", "Evaluate" },
	["<space>v"] = { "<cmd>GuardFmt<CR>", "Formatter" },
	["<space>"] = ":'<,'>Sort",
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
	["D"] = {
		name = "Diffview",
		d = { "<cmd>DiffviewOpen<CR>", "DiffviewOpen" },
		c = { "<cmd>DiffviewClose<CR>", "DiffviewClose" },
	},
	d = {
		name = "Dap",
		d = { ':lua require("dapui").eval()<CR>', "DapEval" },
		u = { ':lua require("dapui").toggle()<CR>', "Toggle" },
		o = { ':lua require("dap").repl.open()<CR>', "Debug: Open REPL" },
		l = { ':lua require("dap").run_last()<CR>', "Run Last" },
		c = { ':lua require("dap").run_to_cursor()<CR>', "Run to cursor" },
		b = { ':lua require("dap").toggle_breakpoint()<CR>', "Toggle Breakpoint" },
		-- d = { ':lua require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))', "BreakPoint condition: " },
	},
}, { mode = "n", prefix = "<leader>", silent = true })

wk.register({
	["c"] = {
		name = "Code",
		c = { "<cmd>OverseerToggle<CR>", "OverseerTogkoiogle" },
		r = { "<cmd>OverseerRun<CR>", "OverseerRun" },
	},
}, { mode = "n", prefix = "<space>", silent = true })
