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
				keys = {
					{
						"<leader>Cd",
						desc = "Show Dependencies",
					},
					{
						"<leader>Cf",
						":Crates show_features_popup<CR>",
						desc = "Show Features",
						-- "show features"
						-- description = "Show features"
					},
                    {
                        "<leader>Cp",
                        ":Crates expand_plain_crate_to_inline_table<CR>",
                        desc = "Expand To Inline Table"
                    },
                    {
                        "<leader>Ct",
                        ":Crates extract_crate_into_table<CR>",
                        desc = "Extract Into Table",
                    }
				},
				event = { "BufRead Cargo.toml" },
				dependencies = { "nvim-lua/plenary.nvim" },
				config = function()
					require("crates").setup()
					-- require("keymaps.crates")
				end,
			},
		},
		config = require("plugins.cmp.config"),
	},
}
