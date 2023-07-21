return {
	{
		"nvim-tree/nvim-web-devicons",
		config = require("modules.ui.devicons"),
		lazy = false,
	},

	{
		-- "Jint-lzxy/nvim",
		"catppuccin/nvim",
		lazy = false,
		-- branch = "refactor/syntax-highlighting",
		name = "catppuccin",
		config = require("modules.ui.catppuccin"),
	},

	{
		"lambdalisue/suda.vim",
		lazy = true,
		cmd = { "SudaRead", "SudaWrite" },
		config = require("modules.editor.suda"),
	},

	{
		"terrortylor/nvim-comment",
		lazy = true,
		event = { "CursorHold", "CursorHoldI" },
		config = require("modules.editor.comment"),
	},

	{
		"RRethy/vim-illuminate",
		lazy = true,
		event = { "CursorHold", "CursorHoldI" },
		config = require("modules.editor.vim-illuminate"),
	},

	{
		"nvim-treesitter/nvim-treesitter",
		lazy = true,
		build = function()
			if #vim.api.nvim_list_uis() ~= 0 then
				vim.api.nvim_command("TSUpdate")
			end
		end,
		event = { "CursorHold", "CursorHoldI" },
		config = require("modules.editor.treesitter"),
		dependencies = {
			{ "RRethy/nvim-treesitter-endwise" },
			{ "nvim-treesitter/nvim-treesitter-textobjects" },
			{ "nvim-treesitter/nvim-treesitter-context" },
			{ "mrjones2014/nvim-ts-rainbow" },
			{ "JoosepAlviste/nvim-ts-context-commentstring" },
			{ "mfussenegger/nvim-treehopper" },
			{ "andymass/vim-matchup" },
			{
				"windwp/nvim-ts-autotag",
				config = require("modules.editor.autotag"),
			},
			{
				"NvChad/nvim-colorizer.lua",
				config = require("modules.editor.colorizer"),
			},
			{
				"abecodes/tabout.nvim",
				config = require("modules.editor.tabout"),
			},
			{
				"lukas-reineke/indent-blankline.nvim",
				lazy = true,
				event = "BufReadPost",
				config = require("modules.ui.indent-blankline"),
			},
		},
	},

	{
		"folke/which-key.nvim",
		lazy = true,
		event = "CmdlineEnter",
		config = require("modules.tools.which-key"),
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
		config = require("modules.ui.nvim-tree"),
	},

	{
		"akinsho/bufferline.nvim",
		lazy = true,
		event = { "BufReadPost", "BufAdd", "BufNewFile" },
		config = require("modules.ui.bufferline"),
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
		config = require("modules.tools.toggleterm"),
	},

	{
		"phaazon/hop.nvim",
		lazy = true,
		version = "*",
		event = "BufReadPost",
		config = require("modules.editor.hop"),
	},

	{
		"jiangmiao/auto-pairs",
		config = require("modules.editor.autopairs"),
		event = "BufReadPost",
	},

	{
		"ojroques/nvim-bufdel",
		lazy = true,
		event = "BufReadPost",
	},

	{
		"neovim/nvim-lspconfig",
		lazy = true,
		event = { "BufReadPost", "BufAdd", "BufNewFile" },
		config = require("modules.completion.lsp"),
		dependencies = {
			{ "ray-x/lsp_signature.nvim" },
			{
				"williamboman/mason.nvim",
				config = require("modules.completion.mason"),
			},
			{
				"nvimdev/lspsaga.nvim",
				config = require("modules.completion.lspsaga"),
			},
			{ "folke/neodev.nvim" },
			{
				"nvimdev/guard.nvim",
				config = require("modules.completion.guard"),
			},
			{
				"simrat39/rust-tools.nvim",
				lazy = true,
				ft = "rust",
			},
			{
				"LHKipp/nvim-nu",
				build = ":TSInstall nu",
				config = require("modules.filetype.nu"),
			},
			{
				"jose-elias-alvarez/null-ls.nvim",
				event = { "BufReadPost", "BufAdd", "BufNewFile" },
			},
		},
	},

	{
		"hrsh7th/nvim-cmp",
		lazy = true,
		event = "InsertEnter",
		config = require("modules.completion.cmp"),
		dependencies = {
			{
				"L3MON4D3/LuaSnip",
				dependencies = { "rafamadriz/friendly-snippets" },
				config = require("modules.completion.luasnip"),
			},
			{ "lukas-reineke/cmp-under-comparator" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },
			{ "andersevenrud/cmp-tmux" },
			{ "hrsh7th/cmp-path" },
			{ "f3fora/cmp-spell" },
			{ "hrsh7th/cmp-buffer" },
			{ "kdheepak/cmp-latex-symbols" },
			{ "ray-x/cmp-treesitter", commit = "c8e3a74" },
			{ "onsails/lspkind.nvim" },
		},
	},

	{
		"j-hui/fidget.nvim",
		branch = "legacy",
		lazy = true,
		event = "LspAttach",
		config = require("modules.completion.fidget"),
	},

	{
		"uga-rosa/ccc.nvim",
		lazy = true,
		event = { "CursorHold", "CursorHoldI" },
		config = require("modules.tools.ccc"),
	},

	{
		"nvim-lualine/lualine.nvim",
		lazy = true,
		event = { "BufReadPost", "BufAdd", "BufNewFile" },
		config = require("modules.ui.lualine"),
	},

	{
		"stevearc/overseer.nvim",
		lazy = true,
		event = "BufWinEnter",
		config = require("modules.tools.overseer"),
	},

	{
		"gelguy/wilder.nvim",
		lazy = true,
		event = "CmdlineEnter",
		config = require("modules.tools.wilder"),
		dependencies = { "romgrk/fzy-lua-native" },
	},

	{
		"tpope/vim-fugitive",
		lazy = true,
		cmd = { "Git", "G" },
	},

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

	{
		"Saecki/crates.nvim",
		lazy = true,
		event = "BufReadPost Cargo.toml",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = require("modules.lang.crates"),
	},
}
