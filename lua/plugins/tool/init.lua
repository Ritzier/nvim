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
		"uga-rosa/ccc.nvim",
		lazy = true,
		event = "CmdlineEnter",
		keys = {
			{
				"<leader>pp",
				":CccPick<CR>",
				desc = "CccPick",
				silent = true,
			},
		},
		config = require("plugins.tool.config.ccc"),
	},

	{
		"NTBBloodbath/color-converter.nvim",
		lazy = true,
		event = "CmdlineEnter",
		keys = {
			{
				"<leader>pc",
				"<Plug>ColorConvertCycle<CR>",
				desc = "Convert Cycle",
			},
			{
				"<leader>ph",
				"<Plug>ColorConvertHEX<CR>",
				desc = "To Hex",
			},
			{
				"<leader>pr",
				"<Plug>ColorConvertHEX<CR>",
				desc = "To RGB",
			},
		},
	},

	{
		"jmbuhr/otter.nvim",
		lazy = false,
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		config = require("plugins.tool.config.otter"),
	},
}
