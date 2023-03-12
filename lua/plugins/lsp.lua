return {
	{
		"neovim/nvim-lspconfig",
		lazy = true,
		event = { "BufReadPost", "BufAdd", "BufNewFile" },
		dependencies = {
			{
				"amrbashir/nvim-docs-view",
				config = require("modules.lsp.nvim_doc"),
			},
			{
				"williamboman/mason.nvim",
				config = require("modules.lsp.mason"),
			},
			{
				"WhoIsSethDaniel/mason-tool-installer.nvim",
			},
			{
				"ray-x/lsp_signature.nvim",
				event = "BufReadPost",
				config = require("modules.lsp.lsp_signature"),
			},
			{
				-- Show too much information
				"j-hui/fidget.nvim",
				event = "BufReadPost",
				config = require("modules.lsp.fidget"),
				enabled = true,
			},
			{
				"nvim-lua/lsp-status.nvim",
				event = "BufReadPost",
				config = require("modules.lsp.lsp_status"),
				enabled = false,
			},
			{
				"glepnir/lspsaga.nvim",
				config = require("modules.lsp.lspsaga"),
			},
			{
				"RRethy/vim-illuminate",
				config = require("modules.lsp.illuminate"),
			},
			{
				"folke/trouble.nvim",
				config = require("modules.lsp.trouble"),
			},
			{ "folke/neodev.nvim", },
			{ "p00f/clangd_extensions.nvim", },
			{ "simrat39/rust-tools.nvim" },
			{ "b0o/schemastore.nvim" },
			{
				"jose-elias-alvarez/null-ls.nvim",
				event = { "BufReadPost", "BufAdd", "BufNewFile" },
			},
		},
		config = require("modules.lsp.lsp"),
	},
}
