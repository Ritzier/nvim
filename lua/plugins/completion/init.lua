return {

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
				version = "1.11",
			},
			{ "mason-org/mason-lspconfig.nvim", version = "1.32" },
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
			{ "williamboman/mason.nvim", version = "1.11" },
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
				"<space>f",
				function()
					require("conform").format({ async = true, lsp_fallback = true })
				end,
				desc = "Format",
				mode = "n",
			},
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
		"hrsh7th/nvim-cmp",
		lazy = true,
		event = "InsertEnter",
		config = require("plugins.completion.config.cmp"),
		dependencies = {
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-path" },
			{ "onsails/lspkind.nvim" },
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

	{
		url = "git@github.com:Ritzier/lsp-tool.nvim.git",
	},
}
