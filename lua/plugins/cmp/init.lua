return {
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-path",
			"kdheepak/cmp-latex-symbols",
			"onsails/lspkind.nvim",
			"lukas-reineke/cmp-under-comparator",
            {
                "L3MON4D3/LuaSnip",
                version = "v2.*",
                build = "make install_jsregexp",
            },
            {
                "saecki/crates.nvim",
                event = { "BufRead Cargo.toml" },
                dependencies = { "nvim-lua/plenary.nvim" },
                config = function()
                    require("crates").setup()
                end
            },
		},
		config = require("plugins.cmp.config"),
	},
}
