return {
	-------------------------- Colorscheme ---------------------------------------
	{
		"Jint-lzxy/nvim",
		lazy = true,
		branch = "refactor/syntax-highlighting",
		name = "catppuccin",
		config = require("plugins.ui.config.catppuccin"),
	},

	{
		"rebelot/kanagawa.nvim",
		lazy = true,
		config = require("plugins.ui.config.kanagawa"),
		-- enabled = false,
	},

	{
		"rose-pine/neovim",
		lazy = false,
		name = "rose-pine",
		config = require("plugins.ui.config.rosepine"),
		enabled = false,
	},

	{
		"EdenEast/nightfox.nvim",
		lazy = false,
		config = require("plugins.ui.config.nightfox"),
		enabled = false,
	},

	------------------------------------------------------------------------------

	{
		"akinsho/bufferline.nvim",
		lazy = true,
		event = { "BufReadPost", "BufAdd", "BufNewFile" },
		config = require("plugins.ui.config.bufferline"),
		keys = {
			{ "<A-j>", ":BufferLineCycleNext<CR>", desc = "Focus Next Buffer", mode = "n", silent = true },
			{ "<A-k>", ":BufferLineCyclePrev<CR>", desc = "Focus Prev Buffer", mode = "n", silent = true },
			{ "<A-S-j>", ":BufferLineMoveNext<CR>", desc = "Move Next Buffer", mode = "n", silent = true },
			{ "<A-S-k>", ":BufferLineMovePrev<CR>", desc = "Move Prev Buffer", mode = "n", silent = true },
		},
		version = "*",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
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
		"folke/todo-comments.nvim",
		lazy = true,
		event = { "CursorHold", "CursorHoldI" },
		config = require("plugins.ui.config.todo"),
		dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
		keys = {
			{ "<leader>td", "<cmd>TodoTelescope<CR>", "Find Todo" },
		},
	},

	{
		"ritzier/fidget.nvim",
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
		"ritzier/indent-blankline.nvim",
		lazy = true,
		event = { "CursorHold", "CursorHoldI" },
		config = require("plugins.ui.config.indent-blankline"),
	},

	{
		"nvim-lualine/lualine.nvim",
		lazy = true,
		event = { "BufReadPost", "BufAdd", "BufNewFile" },
		config = require("plugins.ui.config.lualine"),
		dependencies = {
			"stevearc/overseer.nvim",
		},
	},

	{
		"karb94/neoscroll.nvim",
		lazy = true,
		event = { "BufReadPost", "BufAdd", "BufNewFile" },
		config = require("plugins.ui.config.neoscroll"),
	},
}
