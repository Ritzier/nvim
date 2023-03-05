return {
	{
		"lambdalisue/suda.vim",
		event = { "BufReadPost", "BufNewFile" },
	},

	{
		"rmagatti/auto-session",
		lazy = true,
		cmd = { "SaveSession", "RestoreSession", "DeleteSession" },
		config = require("modules.editor.auto-session"),
	},

    {
		"jiangmiao/auto-pairs",
		config = require("modules.editor.autopairs"),
    },

	{
		"max397574/better-escape.nvim",
		lazy = true,
		event = { "CursorHold", "CursorHoldI" },
		config = require("modules.editor.better-escape"),
	},

	{
		"LunarVim/bigfile.nvim",
		lazy = false,
		config = require("modules.editor.bigfile"),
		cond = require("core.settings").load_big_files_faster,
	},

	{ "ojroques/nvim-bufdel", lazy = true, event = "BufReadPost" },

	{
		"rhysd/clever-f.vim",
		lazy = true,
		event = { "BufReadPost", "BufAdd", "BufNewFile" },
		config = require("modules.editor.cleverf"),
	},

	{
		"numToStr/Comment.nvim",
		lazy = true,
		event = { "CursorHold", "CursorHoldI" },
		config = require("modules.editor.comment"),
	},

	{ "sindrets/diffview.nvim", lazy = true, cmd = { "DiffviewOpen", "DiffviewClose" } },

	{ "junegunn/vim-easy-align", lazy = true, cmd = "EasyAlign" },
	{
		"phaazon/hop.nvim",
		lazy = true,
		branch = "v2",
		event = "BufReadPost",
		config = require("modules.editor.hop"),
	},
	{
		"RRethy/vim-illuminate",
		lazy = true,
		event = { "CursorHold", "CursorHoldI" },
		config = require("modules.editor.vim-illuminate"),
	},
	{ "luukvbaal/stabilize.nvim", lazy = true, event = "BufReadPost" },
	{ "romainl/vim-cool", lazy = true, event = { "CursorMoved", "InsertEnter" } },
}
