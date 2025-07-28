return {

	{
		"dnlhc/glance.nvim",
		lazy = true,
		event = "LspAttach",
		config = require("plugins.completion.config.glance"),
	},

	-- Formatter without LSP, seperate from it

	-- Downloader formatter, lint, lsp
	{
		"neovim/nvim-lspconfig",
		lazy = true,
		event = { "CursorHold", "CursorHoldI" },
		config = require("plugins.completion.config.mason-lsp"),
		dependencies = {
			{
				"mason-org/mason.nvim",
				config = require("plugins.completion.config.mason"),
			},
			{ "mason-org/mason-lspconfig.nvim" },
			"nvim-lua/plenary.nvim",
		},
		keys = {
			{
				"<space>R",
				":LspRestart<CR>",
				desc = "Restart LSP server",
				silent = true,
			},
		},
	},

	-- Mason download, configuration in conform and none-ls
	{
		"ritzier/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "williamboman/mason.nvim" },
			"nvimtools/none-ls.nvim",
		},
		config = require("plugins.completion.config.mason-null-ls"),
	},

	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		dependencies = {
			"ritzier/mason-null-ls.nvim",
		},
		config = require("plugins.completion.config.conform"),
		keys = {
			{
				"<C-f>",
				function()
					require("conform").format({ async = true, lsp_fallback = true })
				end,
				desc = "Format",
				mode = "i",
			},
		},
	},

	{
		"ritzier/lspsaga.nvim",
		lazy = true,
		event = "LspAttach",
		config = require("plugins.completion.config.lspsaga"),
		keys = {
			{
				"K",
				"<cmd>Lspsaga hover_doc<CR>",
				desc = "Hover",
				mode = "n",
			},
			{ "gd", "<cmd>Lspsaga peek_definition<CR>", desc = "Peek Definition", mode = "n" },
			{ "gD", "<cmd>Lspsaga goto_definition<CR>", desc = "Goto Definition", mode = "n" },
			{ "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", desc = "Jump prev Diagnostic" },
			{ "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", desc = "Jump next Diagnostic" },
			{
				"[e",
				function()
					require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
				end,
				desc = "Jump prev error",
				mode = "n",
			},
			{
				"]e",
				function()
					require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
				end,
				desc = "Jump next error",
				mode = "n",
			},
			{
				"<space>n",
				vim.lsp.buf.rename,
				desc = "Rename",
			},
			{
				"<space>e",
				"<cmd>Lspsaga show_line_diagnostics<CR>",
				desc = "Show Diagnostic",
			},
			{
				"<space>D",
				"<cmd>Lspsaga show_workspace_diagnostics<CR>",
				desc = "Show Workspace Diagnostic",
			},
			{
				"<C-a>",
				"<cmd>Lspsaga code_action<CR>",
				desc = "Code Action",
			},
			{
				"<C-/>",
				"<cmd>Lspsaga code_action<CR>",
				desc = "Code Action",
			},
			{
				"<space>f",
				"<cmd>Lspsaga finder<CR>",
				desc = "Finder",
			},
		},
	},

	{
		"folke/trouble.nvim",
		lazy = true,
		cmd = { "Trouble", "TroubleToggle", "TroubleRefresh" },
		event = "CmdlineEnter",
		config = require("plugins.completion.config.trouble"),
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>xX",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>cs",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Symbols (Trouble)",
			},
			{
				"<leader>cl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{
				"<leader>xL",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>xQ",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
			{
				"<space>D",
				"<cmd>Trouble diagnostics win = { type = split, position=right}<cr>",
				desc = "Show workspace diagnostic",
			},
		},
	},

	{
		"saghen/blink.cmp",
		lazy = true,
		event = "InsertEnter",
		config = require("plugins.completion.config.blink"),
		version = "1.*",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"onsails/lspkind.nvim",
		},
	},

	{
		"amrbashir/nvim-docs-view",
		lazy = true,
		event = "LspAttach",
		config = require("plugins.completion.config.nvim-doc-view"),
		keys = {
			{ "<space>dt", "<cmd>DocsViewToggle<CR>", desc = "DocsViewToggle", mode = "n" },
			{ "<space>du", "<cmd>DocsViewUpdate<CR>", desc = "DocsViewUpdate", mode = "n" },
		},
	},

	{
		"rachartier/tiny-inline-diagnostic.nvim",
		lazy = false,
		event = "LspAttach",
		config = require("plugins.completion.config.tiny-inline-diagnostic"),
		keys = {
			{
				"<space>t",
				":lua require('tiny-inline-diagnostic').toggle()<CR>",
			},
		},
	},
}
