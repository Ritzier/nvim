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
		"nvim-tree/nvim-web-devicons",
		lazy = true,
		event = { "BufReadPost", "BufAdd", "BufNewFile" },
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
        config = require("plugins.ui.config.lualine")
    }
}
