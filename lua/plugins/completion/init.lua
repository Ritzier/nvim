return {
	{
		"nvimdev/lspsaga.nvim",
		lazy = true,
		event = "LspAttach",
		config = require("plugins.completion.config.lspsaga")
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
				"Jint-lzxy/lsp_signature.nvim",
				config = require("plugins.completion.config.lsp-signature"),
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
		"joechrisellis/lsp-format-modifications.nvim",
		lazy = true,
		event = "LspAttach",
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
		config = require("plugins.completion.config.conform")
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
			{ "ray-x/cmp-treesitter",              commit = "c8e3a74" },
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
}
