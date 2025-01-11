return {
	{
		"nvim-tree/nvim-tree.lua",
		lazy = true,
		event = "CmdlineEnter",
		cmd = {
			"NvimTreeToggle",
			"NvimTreeOpen",
			"NvimTreeFindFile",
			"NvimTreeFindFileToggle",
			"NvimTreeRefresh",
		},
		config = require("plugins.tool.config.nvim-tree"),
		keys = {
			{ "<C-n>", ":NvimTreeToggle<CR>", desc = "NvimTreeToggle", mode = "n", silent = true },
		},
	},

	{
		"folke/which-key.nvim",
		lazy = true,
		event = { "CursorHold", "CursorHoldI" },
		config = require("plugins.tool.config.which-key"),
		dependencies = "echasnovski/mini.icons",
	},

	{
		"dstein64/vim-startuptime",
		lazy = true,
		event = "CmdlineEnter",
	},

	{
		"michaelb/sniprun",
		lazy = true,
		-- You need to cd to `~/.local/share/nvim/site/lazy/sniprun/` and execute `bash ./install.sh`,
		-- if you encountered error about no executable sniprun found.
		event = { "CursorHold", "CursorHoldI" },
		build = "bash ./install.sh",
		cmd = { "SnipRun", "SnipReset", "SnipInfo" },
		config = require("plugins.tool.config.sniprun"),
	},

	{
		"akinsho/toggleterm.nvim",
		event = "CmdlineEnter",
		keys = {
			{ [[<C-\>]] },
			{ [[<C-S-\>]], ":ToggleTerm direction=horizontal<CR>" },
		},
		lazy = true,
		cmd = {
			"ToggleTerm",
			"ToggleTermSetName",
			"ToggleTermToggleAll",
			"ToggleTermSendVisualLines",
			"ToggleTermSendCurrentLine",
			"ToggleTermSendVisualSelection",
		},
		config = require("plugins.tool.config.toggleterm"),
	},

	-- {
	-- 	"folke/trouble.nvim",
	-- 	enabled = false,
	-- 	lazy = true,
	-- 	cmd = { "Trouble", "TroubleToggle", "TroubleRefresh" },
	-- 	config = require("plugins.tool.config.trouble"),
	-- },

	{
		"gelguy/wilder.nvim",
		lazy = true,
		event = "CmdlineEnter",
		config = require("plugins.tool.config.wilder"),
		dependencies = {
			"romgrk/fzy-lua-native",
		},
	},

	{
		"nvim-telescope/telescope.nvim",
		lazy = true,
		event = "CmdlineEnter",
		cmd = "Telescope",
		config = require("plugins.tool.config.telescope"),
		dependencies = {
			{ "nvim-tree/nvim-web-devicons" },
			{ "nvim-lua/plenary.nvim" },
			{ "debugloop/telescope-undo.nvim" },
			{ "jvgrootveld/telescope-zoxide" },
			{ "nvim-telescope/telescope-live-grep-args.nvim" },
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			{ "debugloop/telescope-undo.nvim" },
		},
		keys = {
			{ "<leader>tt", "<cmd>Telescope<CR>", desc = "Telescope", mode = "n" },
			{ "<leader>tl", "<cmd>Telescope live_grep<CR>", desc = "Live Grep", mode = "n" },
			{ "<leader>tf", "<cmd>Telescope find_files<CR>", desc = "Find Files", mode = "n" },
			{ "<leader>tu", "<cmd>Telescope undo<CR>", desc = "Undo" },
		},
	},

	-- TODO:
	-- {
	-- 	"mfussenegger/nvim-dap",
	-- 	lazy = true,
	-- 	cmd = {
	-- 		"DapSetLogLevel",
	-- 		"DapShowLog",
	-- 		"DapContinue",
	-- 		"DapToggleBreakpoint",
	-- 		"DapToggleRepl",
	-- 		"DapStepOver",
	-- 		"DapStepInto",
	-- 		"DapStepOut",
	-- 		"DapTerminate",
	-- 	},
	-- 	config = require("plugins.tool.config.dap"),
	-- 	dependencies = {
	-- 		{
	-- 			"rcarriga/nvim-dap-ui",
	-- 			config = require("plugins.tool.config.dap.dapui"),
	-- 			dependencies = {
	-- 				"nvim-neotest/nvim-nio",
	-- 			},
	-- 		},
	-- 		{ "jay-babu/mason-nvim-dap.nvim" },
	-- 	},
	-- }

	{
		"amitds1997/remote-nvim.nvim",
		lazy = true,
		event = "CmdlineEnter",
		version = "*",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-telescope/telescope.nvim",
		},
		config = true,
		-- config = require("plugins.tool.config.remote-nvim"),
	},

	{
		"nosduco/remote-sshfs.nvim",
		lazy = true,
		event = "CmdlineEnter",
		dependencies = { "nvim-telescope/telescope.nvim" },
		config = require("plugins.tool.config.remote-sshfs"),
	},

	{
		"sindrets/diffview.nvim",
		lazy = true,
		event = "CmdlineEnter",
		keys = {
			{ "<leader>dd", "<cmd>DiffviewOpen", desc = "DiffView Open" },
			{ "<leader>dc", "<cmd>DiffviewClose", desc = "DiffView Close" },
		},
	},

	{
		"stevearc/overseer.nvim",
		lazy = true,
		event = "CmdlineEnter",
		config = require("plugins.tool.config.overseer"),
		keys = {
			{ "<leader>or", "<cmd>OverseerRun<CR>", desc = "Overseer Run" },
			{ "<leader>oo", "<cmd>OverseerToggle<CR>", desc = "Overseer Toggle" },
			{ "<leader>oa", "<cmd>OverseerTaskAction<CR>", desc = "Overseer Task Action" },
		},
	},

	{
		"mbbill/undotree",
		lazy = true,
		event = "CmdlineEnter",
		keys = {
			{ "<leader>u", "<cmd>UndotreeToggle<CR>", desc = "UndoTree Toggle" },
		},
	},

	{
		"jbyuki/venn.nvim",
		lazy = true,
		event = "CmdlineEnter",
		config = require("plugins.tool.config.venn"),
	},

	{
		"uga-rosa/ccc.nvim",
		lazy = true,
		event = "CmdlineEnter",
		opts = {},
	},
}
