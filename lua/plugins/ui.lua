return {
	{ "kyazdani42/nvim-web-devicons" },

	{
		"goolord/alpha-nvim",
		lazy = true,
		event = "BufWinEnter",
		config = require("modules.ui.alpha"),
	},

	{
		"akinsho/bufferline.nvim",
		lazy = true,
		event = { "BufReadPost", "BufAdd", "BufNewFile" },
		config = require("modules.ui.bufferline"),
	},

	{ "catppuccin/nvim", lazy = false, name = "catppuccin", config = require("modules.ui.catppuccin") },

	{
		"rebelot/kanagawa.nvim",
		lazy = false,
        config = require("modules.ui.kanagawa")
	},

	{ "rktjmp/lush.nvim" },

	{
		"lewis6991/gitsigns.nvim",
		lazy = true,
		event = { "CursorHold", "CursorHoldI" },
		config = require("modules.ui.gitsigns"),
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		lazy = true,
		event = "BufReadPost",
		config = require("modules.ui.indent-blankline"),
	},

	{
		"nvim-lualine/lualine.nvim",
		lazy = true,
		event = { "BufReadPost", "BufAdd", "BufNewFile" },
		config = require("modules.ui.lualine"),
		dependencies = {
			"arkav/lualine-lsp-progress",
		},
	},

	{
		"zbirenbaum/neodim",
		lazy = true,
		event = "LspAttach",
		config = require("modules.ui.neodim"),
	},

	{
		"karb94/neoscroll.nvim",
		lazy = true,
		event = "BufReadPost",
		config = require("modules.ui.neoscroll"),
	},

	{ "shaunsingh/nord.nvim", lazy = true, config = require("modules.ui.nord") },

	{
		"rcarriga/nvim-notify",
		lazy = true,
		event = "VeryLazy",
		config = require("modules.ui.notify"),
	},

	{
		"folke/paint.nvim",
		lazy = true,
		event = { "CursorHold", "CursorHoldI" },
		config = require("modules.ui.paint"),
	},

	{
		"dstein64/nvim-scrollview",
		lazy = true,
		event = "BufReadPost",
		config = require("modules.ui.scrollview"),
	},

	{
		"edluffy/specs.nvim",
		lazy = true,
		event = "CursorMoved",
		config = require("modules.ui.specs"),
	},

	{ "MunifTanjim/nui.nvim" },
	{
		"stevearc/dressing.nvim",
		-- lazy = true,
		-- event = "BufReadPre",
		config = require("modules.ui.dressing"),
	},
}
