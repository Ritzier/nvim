return {
	{
		"tpope/vim-fugitive",
		lazy = true,
		cmd = { "Git", "G" },
	},

	{
		"folke/which-key.nvim",
		lazy = true,
		event = "VeryLazy",
		config = require("modules.tool.which-key"),
	},

	{
		"nvim-tree/nvim-tree.lua",
		lazy = true,
		cmd = {
			"NvimTreeToggle",
			"NvimTreeOpen",
			"NvimTreeFindFile",
			"NvimTreeFindFileToggle",
			"NvimTreeRefresh",
		},
		config = require("modules.tool.nvim-tree"),
	},

	{
		"ibhagwan/smartyank.nvim",
		lazy = true,
		event = "BufReadPost",
		config = require("modules.tool.smartyank"),
	},

	{
		"gelguy/wilder.nvim",
		lazy = true,
		event = "CmdlineEnter",
		config = require("modules.tool.wilder"),
		dependencies = { "romgrk/fzy-lua-native" },
	},

	{
		"folke/trouble.nvim",
		lazy = true,
		cmd = { "Trouble", "TroubleToggle", "TroubleRefresh" },
		config = require("modules.tool.trouble"),
	},

	{
		"akinsho/toggleterm.nvim",
		lazy = true,
		cmd = {
			"ToggleTerm",
			"ToggleTermSetName",
			"ToggleTermToggleAll",
			"ToggleTermSendVisualLines",
			"ToggleTermSendCurrentLine",
			"ToggleTermSendVisualSelection",
		},
		config = require("modules.tool.toggleterm"),
	},

	{
		"michaelb/sniprun",
		lazy = true,
		-- You need to cd to `~/.local/share/nvim/site/lazy/sniprun/` and execute `bash ./install.sh`,
		-- if you encountered error about no executable sniprun found.
		build = "bash ./install.sh",
		cmd = { "SnipRun" },
		config = require("modules.tool.sniprun"),
	},

	-- DAP
	{
		"mfussenegger/nvim-dap",
		lazy = true,
		cmd = {
			"DapSetLogLevel",
			"DapShowLog",
			"DapContinue",
			"DapToggleBreakpoint",
			"DapToggleRepl",
			"DapStepOver",
			"DapStepInto",
			"DapStepOut",
			"DapTerminate",
		},
		config = require("modules.tool.dap"),
		dependencies = {
			{
				"rcarriga/nvim-dap-ui",
				config = require("modules.tool.dap.dapui"),
			},
		},
	},

	{
		"stevearc/overseer.nvim",
		lazy = true,
		event = "BufWinEnter",
		config = require("modules.tool.overseer"),
	},

	{
		"folke/todo-comments.nvim",
		-- config = function()
		-- 	require("configuration.todo-comments")
		lazy = true,
		config = require("modules.tool.todo_comments"),
		event = { "BufReadPost", "BufAdd", "BufNewFile" },
	},

	{
		"uga-rosa/ccc.nvim",
		lazy = true,
		event = { "CursorHold", "CursorHoldI" },
		config = require("modules.tool.ccc"),
	},
	{
		"jackMort/ChatGPT.nvim",
		config = require("modules.tool.chatgpt"),
		event = { "BufReadPost", "BufAdd", "BufNewFile" },
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
		enabled = false,
	},
}
