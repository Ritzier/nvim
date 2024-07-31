return {
	{
		"olimorris/persisted.nvim",
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

	{
		"windwp/nvim-autopairs",
		event = { "Insertenter", "CmdlineEnter" },
		config = require("plugins.editor.config.autopairs"),
	},

	{
		"L3MON4D3/LuaSnip",
		keys = function()
			-- Disable default tab keybinding in LuaSnip
			return {}
		end,
	},

	{
		"LunarVim/bigfile.nvim",
		lazy = false,
		config = require("plugins.editor.config.bigfile"),
	},
	{
		"ojroques/nvim-bufdel",
		lazy = true,
		cmd = { "BufDel", "BufDelAll", "BufDelOthers" },
	},
	{
		"folke/flash.nvim",
		lazy = true,
		event = { "CursorHold", "CursorHoldI" },
		config = require("plugins.editor.config.flash"),
	},

	{
		"numToStr/Comment.nvim",
		enabled = false,
		lazy = true,
		event = { "CursorHold", "CursorHoldI" },
		config = require("plugins.editor.config.comment"),
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
		"tzachar/local-highlight.nvim",
		enabled = false,
		lazy = true,
		event = { "CursorHold", "CursorHoldI" },

		config = require("plugins.editor.config.local-highlight"),
	},

	{
		"romainl/vim-cool",
		lazy = true,
		event = { "CursorMoved", "InsertEnter" },
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
		-- config = function()
		-- 	require("nvim-treesitter.configs").setup({
		-- 		endwise = { enable = true }
		-- 	})
		-- end,
		config = require("plugins.editor.config.treesitter"),
		dependencies = {
			{ "RRethy/nvim-treesitter-endwise" },
			{ "mfussenegger/nvim-treehopper" },
			{ "nvim-treesitter/nvim-treesitter-textobjects" },
			{
				"windwp/nvim-ts-autotag",
				config = require("plugins.editor.config.autotag"),
			},
			{
				"NvChad/nvim-colorizer.lua",
				config = require("plugins.editor.config.colorizer"),
			},
			{
				"hiphish/rainbow-delimiters.nvim",
				config = require("plugins.editor.config.rainbow_delims"),
			},
			{
				"nvim-treesitter/nvim-treesitter-context",
				enabled = false,
				config = require("plugins.editor.config.ts-context"),
			},
			{
				"JoosepAlviste/nvim-ts-context-commentstring",
				enabled = false,
				config = require("plugins.editor.config.ts-context-commentstring"),
			},
		},
	},

	{
		"max397574/better-escape.nvim",
		lazy = true,
		event = { "InsertEnter" },
		config = function()
			require("better_escape").setup()
		end,
	},
}
