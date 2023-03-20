return {
	{
		"nvim-telescope/telescope.nvim",
		lazy = true,
		cmd = "Telescope",
		config = require("modules.telescope"),
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-lua/popup.nvim" },
			{ "debugloop/telescope-undo.nvim" },
			{
				"ahmedkhalf/project.nvim",
				-- event = "BufReadPost",
				config = require("modules.telescope.project"),
			},
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			{
				"nvim-telescope/telescope-frecency.nvim",
				dependencies = {
					{ "kkharji/sqlite.lua" },
				},
			},
			{ "jvgrootveld/telescope-zoxide" },
			{ "nvim-telescope/telescope-live-grep-args.nvim" },
		},
	},
}
