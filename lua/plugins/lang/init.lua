return {
	{
		"ray-x/go.nvim",
		lazy = true,
		ft = { "go", "gomod", "gosum" },
		build = ":GoInstallBinaries",
		config = require("plugins.lang.config.go"),
		dependencies = { "ray-x/guihua.lua" },
	},

	{
		"mrcjkb/rustaceanvim",
		lazy = true,
		ft = "rust",
		init = require("plugins.lang.config.rust"),
		dependencies = { "nvim-lua/plenary.nvim" },
		keys = {
			{
				"<space>E",
				"<cmd>RustLsp expandMacro<CR>",
				desc = "Expand Macro",
			},
			{
				"<space>R",
				":RustAnalyzer restart<CR>",
				desc = "LSP Restart",
			},
		},
	},

	{
		"Saecki/crates.nvim",
		lazy = true,
		event = "BufReadPost Cargo.toml",
		config = require("plugins.lang.config.crates"),
		dependencies = { "nvim-lua/plenary.nvim", "hrsh7th/nvim-cmp" },
		keys = {
			{
				"<leader>cf",
				function()
					require("crates").show_features_popup()
				end,
				desc = "Show Features",
			},
			{
				"<leader>cd",
				function()
					require("crates").show_dependencies_popup()
				end,
				desc = "Show Dependencies",
			},
			{
				"<leader>cv",
				function()
					require("crates").show_versions_popup()
				end,
				desc = "Show Version",
			},
		},
	},

	{
		"iamcco/markdown-preview.nvim",
		lazy = true,
		ft = "markdown",
		event = "CmdlineEnter",
		build = ":call mkdp#util#install()",
	},

	{
		"Kicamon/markdown-table-mode.nvim",
		lazy = true,
		event = { "CursorHold", "CursorHoldI" },
		ft = "markdown",
		opts = {},
	},

	{
		"chrisbra/csv.vim",
		lazy = true,
		ft = "csv",
	},

	{
		"HiPhish/jinja.vim",
		event = { "BufNewFile", "BufReadPost", "BufFilePost" },
		lazy = true,
		ft = "jinja",
	},
}
