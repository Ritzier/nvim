return {
	{
		"catppuccin/nvim",
		enabled = true,
		lazy = false,
		name = "catppuccin",
		-- priority = 1000,
		config = require("plugins.colorscheme.catppuccin"),
	},

	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		enabled = true,
		config = require("plugins.colorscheme.kanagawa"),
	},

	{
		"EdenEast/nightfox.nvim",
		enabled = true,
		lazy = false,
		config = require("plugins.colorscheme.nightfox"),
	},

    {
        "folke/tokyonight.nvim",
        enabled = true,
        lazy = false,
        config = require("plugins.colorscheme.tokyonight"),
    }
}
