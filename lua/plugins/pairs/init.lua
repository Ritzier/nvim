return {
	{
		"ritzier/autoclose.nvim",
		event = { "InsertEnter", "CmdlineEnter" },
		config = require("plugins.pairs.config.autoclose"),
	},

	{
		"altermo/ultimate-autopair.nvim",
		event = { "InsertEnter", "CmdlineEnter" },
		config = require("plugins.pairs.config.ultimate-autopairs"),
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			{
				"abecodes/tabout.nvim",
				config = require("plugins.editor.config.tabout"),
				keys = {
					{ "<C-]>", "<Plug>(TaboutMulti)", mode = "i" },
					{ "<C-[>", "<Plug>(TaboutBackMulti)", mode = "i" },
				},
			},
		},
		enabled = false,
	},

	{
		"windwp/nvim-autopairs",
		config = require("plugins.pairs.config.autopairs"),
		event = { "InsertEnter", "CmdlineEnter" },
		lazy = true,
		enabled = false,
	},
}
