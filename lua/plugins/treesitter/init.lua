vim.opt.list = true
return {
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"RRethy/nvim-treesitter-endwise",
			"windwp/nvim-ts-autotag",
			"nvim-treesitter/playground",
			{
				-- Weried settings
				"lukas-reineke/indent-blankline.nvim",
				enabled = false,
				main = "ibl",
				config = require("plugins.treesitter.ibl"),
			},
			{
				"shellRaining/hlchunk.nvim",
				-- enabled = false,
				event = { "UIEnter" },
				config = function()
					require("hlchunk").setup({
						chunk = {
							enable = true,
							notify = true,
							use_treesitter = false,
						},
						indent = {
							use_treesitter = false,
							chars = { "┆" },
						},
						blank = {
							enable = true,
						},
					})
				end,
			},
			{ "HiPhish/rainbow-delimiters.nvim" },
		},
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		config = require("plugins.treesitter.config"),
	},
}
