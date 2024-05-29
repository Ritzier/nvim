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
		"abecodes/tabout.nvim",
		event = { "InsertEnter", "CmdlineEnter" },
		-- lazy = false,
		config = function()
			require("tabout").setup({
				tabkey = "", -- key to trigger tabout, set to an empty string to disable
				backwards_tabkey = "", -- key to trigger backwards tabout, set to an empty string to disable

				act_as_tab = true, -- shift content if tab out is not possible
				act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
				enable_backwards = true,
				completion = false, -- if the tabkey is used in a completion pum
				tabouts = {
					{ open = "'", close = "'" },
					{ open = '"', close = '"' },
					{ open = "`", close = "`" },
					{ open = "(", close = ")" },
					{ open = "[", close = "]" },
					{ open = "{", close = "}" },
				},
				ignore_beginning = true, -- if the cursor is at the beginning of a filled element it will rather tab out than shift the content
				exclude = {}, -- tabout will ignore these filetypes
			})
		end,
		requires = { "nvim-treesitter/nvim-treesitter" },
		-- event = "InsertCharPre",
	},

	{
		"m4xshen/autoclose.nvim",
		enabled = false,
		lazy = true,
		event = "InsertEnter",
		config = require("plugins.editor.config.autoclose"),
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
		"folke/flash.nvim",
		lazy = true,
		event = { "CursorHold", "CursorHoldI" },
		config = require("plugins.editor.config.flash"),
	},

	{
		"numToStr/Comment.nvim",
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
	},

	{
		"tzachar/local-highlight.nvim",
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
		build = function()
			if #vim.api.nvim_list_uis() ~= 0 then
				vim.api.nvim_command([[TSUpdate]])
			end
		end,
		event = "BufReadPre",
		config = require("plugins.editor.config.treesitter"),
		dependencies = {
			{ "RRethy/nvim-treesitter-endwise" },
			{ "andymass/vim-matchup" },
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
				config = require("plugins.editor.config.ts-context"),
			},
			{
				"JoosepAlviste/nvim-ts-context-commentstring",
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
		end
	}
}
