return {
	{
		"Jint-lzxy/nvim",
		lazy = true,
		branch = "refactor/syntax-highlighting",
		name = "catppuccin",
		config = require("plugins.ui.config.catppuccin"),
	},
	{
		"akinsho/bufferline.nvim",
		lazy = true,
		event = { "BufReadPost", "BufAdd", "BufNewFile" },
		config = require("plugins.ui.config.bufferline"),
	},
	{
		"stevearc/dressing.nvim",
		event = "VeryLazy",
		opts = {},
		config = require("plugins.ui.config.dressing"),
	},
	{
		"nvim-tree/nvim-web-devicons",
		lazy = true,
		event = { "BufReadPost", "BufAdd", "BufNewFile" },
	},
	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		config = require("plugins.ui.config.kanagawa"),
	},
	{
		"rose-pine/neovim",
		lazy = false,
		name = "rose-pine",
		config = require("plugins.ui.config.rosepine"),
	},
	{
		"dstein64/nvim-scrollview",
		lazy = true,
		event = { "BufReadPost", "BufAdd", "BufNewFile" },
		config = require("plugins.ui.config.scrollview"),
	},
	{
		"folke/todo-comments.nvim",
		lazy = true,
		event = { "CursorHold", "CursorHoldI" },
		config = require("plugins.ui.config.todo"),
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	{
		"rcarriga/nvim-notify",
		enabled = false,
		lazy = true,
		event = "VeryLazy",
		config = require("plugins.ui.config.notify"),
	},

	{
		"j-hui/fidget.nvim",
		lazy = true,
		event = "LspAttach",
		config = require("plugins.ui.config.fidget"),
	},

	{
		"lewis6991/gitsigns.nvim",
		lazy = true,
		event = { "CursorHold", "CursorHoldI" },
		config = require("plugins.ui.config.gitsigns"),
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		lazy = true,
		event = { "CursorHold", "CursorHoldI" },

		config = require("plugins.ui.config.indent-blankline"),
	},

	{
		"karb94/neoscroll.nvim",
		lazy = true,
		event = { "CursorHold", "CursorHoldI" },
		config = require("plugins.ui.config.neoscroll"),
	},

	{
		"nvim-lualine/lualine.nvim",
		lazy = true,
		event = { "BufReadPost", "BufAdd", "BufNewFile" },
		config = require("plugins.ui.config.lualine"),
	},
}
