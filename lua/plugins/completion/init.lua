return {
	{
		"nvimdev/lspsaga.nvim",
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
		},
	},

	{
		"neovim/nvim-lspconfig",
		lazy = true,
		event = { "CursorHold", "CursorHoldI" },
		config = require("plugins.completion.config.lsp"),
		dependencies = {
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },
			{ "folke/neoconf.nvim" },
			{
				"MysticalDevil/inlay-hints.nvim",
				config = require("plugins.completion.config.inlay_hint"),
			},
		},
	},

	{
		"stevearc/aerial.nvim",
		lazy = true,
		event = "LspAttach",
		config = require("plugins.completion.config.aerial"),
	},

	{
		"dnlhc/glance.nvim",
		lazy = true,
		event = "LspAttach",
		config = require("plugins.completion.config.glance"),
	},

	{
		"nvimtools/none-ls.nvim",
		lazy = true,
		event = { "CursorHold", "CursorHoldI" },
		config = require("plugins.completion.config.null-ls"),
		dependencies = {
			"nvim-lua/plenary.nvim",
			"jay-babu/mason-null-ls.nvim",
		},
	},

	{
		"stevearc/conform.nvim",
		lazy = true,
		event = { "BufWritePre" },
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
		},
	},

	{
		"hrsh7th/nvim-cmp",
		lazy = true,
		event = "InsertEnter",
		config = require("plugins.completion.config.cmp"),
		dependencies = {
			{
				"L3MON4D3/LuaSnip",
				dependencies = { "rafamadriz/friendly-snippets" },
			},
			{ "lukas-reineke/cmp-under-comparator" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },
			{ "andersevenrud/cmp-tmux" },
			{ "hrsh7th/cmp-path" },
			{ "f3fora/cmp-spell" },
			{ "hrsh7th/cmp-buffer" },
			{ "kdheepak/cmp-latex-symbols" },
			{ "ray-x/cmp-treesitter", commit = "c8e3a74" },
			{ "onsails/lspkind.nvim" },
			-- { "tzachar/cmp-tabnine", build = "./install.sh", config = require("completion.tabnine") },
			-- {
			-- 	"jcdickinson/codeium.nvim",
			-- 	dependencies = {
			-- 		"nvim-lua/plenary.nvim",
			-- 		"MunifTanjim/nui.nvim",
			-- 	},
			-- 	config = require("completion.codeium"),
			-- },
		},
	},

	{
		"amrbashir/nvim-docs-view",
		lazy = true,
		event = "LspAttach",
		config = require("plugins.completion.config.nvimd-doc-view"),
		keys = {
			{ "<space>dt", "<cmd>DocsViewToggle<CR>", desc = "DocsViewToggle", mode = "n" },
			{ "<space>du", "<cmd>DocsViewUpdate<CR>", desc = "DocsViewUpdate", mode = "n" },
		},
	},
}
