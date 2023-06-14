return {
	{
		"hrsh7th/nvim-cmp",
		lazy = true,
		event = "InsertEnter",
		config = require("modules.cmp.cmp"),
		dependencies = {
			{
				"L3MON4D3/LuaSnip",
				dependencies = { "rafamadriz/friendly-snippets" },
				config = function()
					local snippet_path = vim.fn.stdpath("config") .. "/snips/"
					if not vim.tbl_contains(vim.opt.rtp:get(), snippet_path) then
						vim.opt.rtp:append(snippet_path)
					end

					require("luasnip").config.set_config({
						history = true,
						updateevents = "TextChanged,TextChangedI",
						delete_check_events = "TextChanged,InsertLeave",
					})
					require("luasnip.loaders.from_lua").lazy_load()
					require("luasnip.loaders.from_vscode").lazy_load()
					require("luasnip.loaders.from_snipmate").lazy_load()
				end,
			},
			{
				"onsails/lspkind.nvim",
				-- config = require("modules.cmp.lspkind"),
			},
			{ "lukas-reineke/cmp-under-comparator" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },
			{ "andersevenrud/cmp-tmux" },
			{ "hrsh7th/cmp-path" },
			{ "f3fora/cmp-spell" },
			{ "hrsh7th/cmp-buffer" },
			{ "kdheepak/cmp-latex-symbols", enabled = false },
			-- { "ray-x/cmp-treesitter" },
			-- { "tzachar/cmp-tabnine", build = "./install.sh", config = require("completion.tabnine") },
			-- {
			-- 	"jcdickinson/codeium.nvim",
			-- 	dependencies = {
			-- 		"nvim-lua/plenary.nvim",
			-- 		"MunifTanjim/nui.nvim",
			-- 	},
			-- 	config = require("completion.codeium"),
			-- },
			{
				"zbirenbaum/copilot.lua",
				event = "InsertEnter",
				config = function()
					vim.schedule(function()
						-- require("copilot").setup()
						require("modules.cmp.copilot")
					end)
				end,
				enbaled = false,
			},
			{ "zbirenbaum/copilot-cmp", enabled = false },
			{
				"Saecki/crates.nvim",
				lazy = true,
				event = "BufReadPost Cargo.toml",
				dependencies = { "nvim-lua/plenary.nvim" },
				config = require("modules.lang.crates"),
				-- config = function()
				-- 	require("crates").setup()
				-- end,
				ft = "rust",
			},
		},
	},
}
