return {
	{
		"olimorris/persisted.nvim",
		event = "CmdlineEnter",
		lazy = true,
		cmd = {
			"SessionToggle",
			"SessionStart",
			"SessionStop",
			"SessionSave",
			"SessionLoad",
			"SessionLoadLast",
			"SessionLoadFromFile",
			"SessionDelete",
		},
		config = require("plugins.editor.config.persisted"),
	},

	-- Conflict with autopairs <> configuration in Rust
	{
		"ritzier/nvim-ts-autotag",
		config = require("plugins.editor.config.autotag"),
		event = { "BufReadPost", "BufNewFile" },
		lazy = true,
	},

	{
		"ojroques/nvim-bufdel",
		lazy = true,
		cmd = { "BufDel", "BufDelAll", "BufDelOthers" },
		keys = {
			{
				"<C-x>",
				"<cmd>BufDel<CR>",
				"Delete Current Buffer",
			},
			{
				"<C-s-x>",
				"<cmd>BufDelOthers<CR>",
				"Delete Other Buffers",
			},
			{
				"<A-x>",
				"<cmd>BufDelOthers<CR>",
				"Delete Other Buffers",
			},
		},
	},
	{
		"folke/flash.nvim",
		lazy = true,
		event = { "CursorHold", "CursorHoldI" },
		config = require("plugins.editor.config.flash"),
	},

	{
		"smoka7/hop.nvim",
		lazy = true,
		version = "*",
		event = { "CursorHold", "CursorHoldI" },
		config = require("plugins.editor.config.hop"),
		keys = {
			{
				"<leader>f",
				":HopWord<CR>",
				desc = "hop",
			},
		},
	},

	{
		"lambdalisue/suda.vim",
		lazy = true,
		cmd = { "SudaRead", "SudaWrite" },
		config = require("plugins.editor.config.suda"),
	},

	{
		"tpope/vim-sleuth",
		lazy = true,
		event = { "BufNewFile", "BufReadPost", "BufFilePost" },
	},

	{
		"nvim-treesitter/nvim-treesitter",
		lazy = true,
		event = { "BufReadPost", "BufNewFile" },
		cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
		build = ":TSUpdate",
		config = require("plugins.editor.config.treesitter"),
		dependencies = {
			{ "RRethy/nvim-treesitter-endwise" },
			{ "mfussenegger/nvim-treehopper" },
			{ "nvim-treesitter/nvim-treesitter-textobjects" },
			{
				"hiphish/rainbow-delimiters.nvim",
				config = require("plugins.editor.config.rainbow_delims"),
			},
			{
				"nvim-treesitter/nvim-treesitter-context",
				config = require("plugins.editor.config.ts-context"),
			},
			{
				"JoosepAlviste/nvim-ts-context-commentstring",
				config = require("plugins.editor.config.ts-context-commentstring"),
			},
			{
				"rayliwell/tree-sitter-rstml",
				build = ":TSUpdate",
				config = function()
					require("tree-sitter-rstml").setup()
				end,
			},
		},
	},

	{
		"kevinhwang91/nvim-ufo",
		lazy = true,
		event = { "CursorHold", "CursorHoldI" },
		config = require("plugins.editor.config.ufo"),
		dependencies = {
			"kevinhwang91/promise-async",
		},
		priority = 100,
	},

	{
		"abecodes/tabout.nvim",
		event = { "InsertEnter", "CmdlineEnter" },
		config = require("plugins.editor.config.tabout"),
		keys = {
			{ "<C-]>", "<Plug>(TaboutMulti)", mode = "i" },
			{ "<C-[>", "<Plug>(TaboutBackMulti)", mode = "i" },
		},
	},
}
