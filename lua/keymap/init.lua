local M = {}
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
	["<C-x>"] = { ":bd<CR>", "Close buffer" },
	["<C-s>"] = { ":w<CR>", "Write buffer" },

	["[t"] = { "<cmd>lua require('todo-comments').jump_prev()<CR>", "Previous Todo Comments" },
	["]t"] = { "<cmd>lua require('todo-comments').jump_next()<CR>", "Next Todo Comments" },
	["ga"] = { ":EasyAlign<CR>", "EasyAlign" },

	["<C-\\>"] = { ":ToggleTerm<CR>", "ToggleTerm" },

	["1"] = { ":OverseerRun<CR>", "Overseer Run" },
}, { mode = "n", prefix = "", silent = true })

wk.register({
	["<C-h>"] = { "<C-\\><C-n><C-w>h", "Focus left" },
	["<C-j>"] = { "<C-\\><C-n><C-w>j", "Focus down" },
	["<C-k>"] = { "<C-\\><C-n><C-w>k", "Focus up" },
	["<C-l>"] = { "<C-\\><C-n><C-w>l", "Focus right" },
	["jk"] = { "<C-\\><C-n>", "" },
	["<Esc>"] = { "<C-\\><C-n>", "" },
}, { mode = "t", prefix = "", silent = true })

wk.register({
	["<"] = { "<gv", "Decrease Indent" },
	[">"] = { ">gv", "Increase Indent" },
	["<A-j>"] = { ":m '>+1<CR>gv=gv'", "Move line down" },
	["<A-k>"] = { ":m '>-2<CR>gv=gv'", "Move line up" },
	["ga"] = { ":'<, '>EasyAlign<CR>", "EasyAlign" },
	["e"] = { "<cmd>lua require('dapui').eval()<CR>", "Evaluate" },
}, { mode = "v", prefix = "", silent = true })

function M.lsp(bufnr)
	wk.register({
		["<space>w"] = {
			name = "Workspace",
			a = { ":lua vim.lsp.buf.add_workspace_folder", "Add WorkSpace Folder" },
			r = { ":lua vim.lsp.buf.remove_workspace_folder", "Remove WorkSpace Folder" },
			l = {
				function()
					print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
				end,
				"List Workspace Folder",
			},
		},
		["<space>f"] = { ":lua vim.lsp.buf.format()<CR>", "Format" },
		["<space>n"] = { ":lua vim.lsp.buf.rename()<CR>", "Rename" },
		["<space>e"] = { ":lua vim.diagnostic.open_float()<CR>", "Diagnostic Open Float" },
		["gd"] = { "<cmd>Lspsaga peek_definition<CR>", "Peek Definition" },
		["gD"] = { "<cmd>Lspsaga goto_definition<CR>", "Goto Definition" },
		["K"] = { "<cmd>Lspsaga hover_doc<CR>", "Hover Doc" },
		["[d"] = { "<cmd>Lspsaga diagnostic_jump_prev<CR>", "Jump prev Diagnostic" },
		["]d"] = { "<cmd>Lspsaga diagnostic_jump_next<CR>", "Jump next Diagnostic" },
		["<space>l"] = {
			name = "Lspsaga",
			c = {
				name = "Calls",
				i = { "<cmd>Lspsaga incoming_calls<CR>", "Incoming Calls" },
				o = { "<cmd>Lspsaga outgoing_calls<CR>", "Outgoing Calls" },
			},
			t = { "<cmd>Lspsaga term_toggle<CR>", "Term Toggle" },
			o = { "<cmd>Lspsaga outline<CR>", "Outline" },
			l = { "<cmd>Lspsaga show_line_diagnsotics<CR>", "Show Line Diagnostic" },
			f = { "<cmd>Lspsaga lsp_finder<CR>", "Finder" },
		},
	}, { mode = "n", prefix = "", silent = true, buffer = bufnr })
end

wk.register({
	o = {
		name = "Overseer",
		o = { ":OverseerToggle<CR>", "Overseer Toggle" },
		b = { ":OverseerBuild<CR>", "Overseer Build" },
		c = { ":OverseerClearCache<CR>", "Overseer Clear Cache" },
		i = { ":OverseerInfo<CR>", "Overseer Info" },
		r = { ":OverseerRun<CR>", "Overseer Run" },
		R = { ":OverseerRunCmd<CR>", "Overseer Run CMD" },
		q = { ":OverseerQuickAction<CR>", "Overseer Quick Action" },
	},
	t = {
		name = "Telescope",
		t = { "<cmd>Telescope<CR>", "Telescope" },
		l = { "<cmd>Telescope live_grep<CR>", "Live Grep" },
		f = { "<cmd>Telescope find_files<CR>", "Find Files" },
	},
	c = {
		name = "Color",
		c = { ":CccHighlighterToggle<CR>", "Highlighter Toggle" },
		v = { ":CccCovert<CR>", "Convert" },
		p = { ":CccPick<CR>", "Pick" },
	},
	l = {
		name = "Lsp",
		i = { "<cmd>LspInfo<CR>", "LspInfo" },
	},
	d = {
		name = "Dap",
		c = {
			function()
				require("dap").terminate()
				require("dapui").close()
			end,
			"debug: Stop",
		},
		d = {
			function()
				require("dap").continue()
			end,
			"debug: Run",
		},
		b = {
			function()
				require("dap").toggle_breakpoint()
			end,
			"debug: Toggle Breakpoint",
		},
		i = {
			function()
				require("dap").step_into()
			end,
			"debug: Step Into",
		},
		o = {
			function()
				require("dap").step_out()
			end,
			"debug: Step Out",
		},
		O = {
			function()
				require("dap").step_over()
			end,
			"debug: Step Over",
		},
		C = {
			function()
				require("dap").run_to_cursor()
			end,
			"debug: Run to cursor",
		},
		r = {
			function()
				require("dap").repl.open()
			end,
			"debug: Open REPL",
		},
		-- R = { "<cmd>lua require('dap').run_to_cursor()<CR>", "Run to cursor" },
		-- E = { "<cmd>lua require('dapui').eval(vim.fn.input '[Expression] > ')<CR>", "Evaluate Input" },
		-- U = { "<cmd>lua require('dapui').toggle<CR>", "Toggle UI" },
		-- b = { "<cmd>lua require('dap').step_back<CR>", "Step Back" },
		-- c = { "<cmd>lua require('dap').continue()<CR>", "Continue" },
		-- d = { "<cmd>lua require('dap').disconnect()<CR>", "Disconnect" },
		-- e = { "<cmd>lua require('dapui').eval()<CR>", "Evaluate" },
		-- g = { "<cmd>lua require('dap').session()CR>", "Get Session" },
		-- h = { "<cmd>lua require('dap.ui.widgets').hover()<CR>", "Hover variables" },
		-- S = { "<cmd>lua require('dap.ui.widgets').scopes()<CR>", "Scopes" },
		-- i = { "<cmd>lua require('dap').step_into<CR>", "Step Into" },
		-- o = { "<cmd>lua require('dap').step_over()<CR>", "Step Over" },
		-- p = { "<cmd>lua require('dap').pause.toggle()<CR>", "Pause" },
		-- q = { "<cmd>lua require('dap').close()<CR>", "Quit" },
		-- r = { "<cmd>lua require('dap').repl.toggle<CR>", "Toggle Repl" },
		-- s = { "<cmd>lua require('dap').continue()<CR>", "Start" },
		-- t = { "<cmd>lua require('dap').toggle_breakpoint()<CR>", "Toggle Breakpoint" },
		-- x = { "<cmd>lua require('dap').terminate()<CR>", "Terminate" },
		-- u = { "<cmd>lua require('dap').step_out()<CR>", "Step Out" },
	},
}, { mode = "n", prefix = "<leader>", silent = true })

return M
