local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here

	use({ "wbthomason/packer.nvim" })
	use({ "nvim-lua/plenary.nvim" })
	use({ "rcarriga/nvim-notify" })
	use({ "lewis6991/impatient.nvim" })
	use({ "folke/which-key.nvim" })
	use({ "antoinemadec/FixCursorHold.nvim" })
	use({ "nvim-lua/popup.nvim" })
	use({ "RishabhRD/popfix" })
	use({ "hood/popui.nvim" })
	use({ "marko-cerovac/material.nvim" })
	use({ "pineapplegiant/spaceduck" })

	-- UI
	--Colorscheme
	use({ "EdenEast/nightfox.nvim" })
	use({ "folke/tokyonight.nvim" })
	use({ "rose-pine/neovim", as = "rose-pine" })
	use({ "ellisonleao/gruvbox.nvim" })
	use({ "Everblush/everblush.nvim" })
	-- NvimTree
	use({ "kyazdani42/nvim-web-devicons" })
	use({ "kyazdani42/nvim-tree.lua" })
	-- Bufferline
	use({ "akinsho/bufferline.nvim" })
	-- TreeSitter
	use({ "nvim-treesitter/nvim-treesitter" })
	use({ "windwp/nvim-ts-autotag" })
	use({ "RRethy/nvim-treesitter-endwise" })
	use({ "p00f/nvim-ts-rainbow" })
	use({ "windwp/nvim-autopairs" })
	-- use({ "jiangmiao/auto-pairs" })
	use({ "lukas-reineke/indent-blankline.nvim" })
	use({ "JoosepAlviste/nvim-ts-context-commentstring" })
	-- Lualine
	use({ "nvim-lualine/lualine.nvim" })
	-- Startup Screen
	use({ "goolord/alpha-nvim" })
	use({ "sheerun/vim-polyglot" })
	-- Todo
	use({ "folke/todo-comments.nvim" })

	-- Tools
	-- Terminal
	use({ "akinsho/toggleterm.nvim" })
	--Comment
	use({ "numToStr/Comment.nvim" })
	-- Git
	use({ "lewis6991/gitsigns.nvim" })
	-- Show colors
	use({ "norcalli/nvim-colorizer.lua" })
	use({
		"rktjmp/lush.nvim",
		cmd = { "LushRunQuickstart", "LushRunTutorial", "Lushify", "LushImport" },
		disable = false,
	})
	-- Sniprun
	use({
		"michaelb/sniprun",
		run = "bash ./install.sh",
		cmd = { "SnipRun", "'<,'>SnipRun" },
	})
	-- Align
	use({
		"junegunn/vim-easy-align",
		cmd = "EasyAlign",
	})
	-- Wilder
	use({ "gelguy/wilder.nvim" })
	-- Sudo
	use({ "lambdalisue/suda.vim" })

	-- Open neovim in browser
	use({
		"glacambre/firenvim",
		run = function()
			vim.fn["firenvim#install"](0)
		end,
	})

	-- FIleytpe
	use({
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		setup = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	})
	use({ "Vimjas/vim-python-pep8-indent" })
	use({
		"akinsho/flutter-tools.nvim",
		module = "rust-tools",
		ft = { "rust" },
	})
	use({
		"saecki/crates.nvim",
		event = { "BufRead Cargo.toml" },
		requires = { { "nvim-lua/plenary.nvim" } },
		config = function()
			-- local null_ls = require "null-ls"
			require("crates").setup({
				null_ls = {
					enabled = true,
					name = "crates.nvim",
				},
			})
		end,
	})
	use({
		"udalov/kotlin-vim",
		ft = { "kotlin" },
	})
	-- Go
	use({
		"ray-x/go.nvim",
		ft = { "go" },
		config = function()
			require("go").setup()
		end,
	})
	-- Java
	use({ "mfussenegger/nvim-jdtls", ft = { "java" } })

	-- renamer.nvim
	use({
		"filipdutescu/renamer.nvim",
		module = { "renamer" },
		config = function()
			require("renamer").setup({})
		end,
	})

	use({ "jose-elias-alvarez/typescript.nvim" })

	use({
		"simrat39/inlay-hints.nvim",
		config = function()
			require("inlay-hints").setup()
		end,
	})

	-- Completion
	use({ "neovim/nvim-lspconfig" })
	use({ "creativenull/efmls-configs-nvim" })
	use({ "williamboman/mason.nvim" })
	use({ "williamboman/mason-lspconfig.nvim" })
	use({ "WhoIsSethDaniel/mason-tool-installer.nvim" })
	use({ "glepnir/lspsaga.nvim" })
	use({ "ray-x/lsp_signature.nvim" })
	use({ "hrsh7th/nvim-cmp" })
	use({ "lukas-reineke/cmp-under-comparator" })
	use({ "kdheepak/cmp-latex-symbols" })
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "hrsh7th/cmp-nvim-lua" })
	use({ "SmiteshP/nvim-navic" })
	use({ "SmiteshP/nvim-gps" })
	use({ "folke/lsp-colors.nvim" })
	use({ "j-hui/fidget.nvim" })
	use({ "folke/lua-dev.nvim" })
	use({ "hrsh7th/cmp-path" })
	use({ "b0o/SchemaStore.nvim" })
	use({ "mrshmllow/document-color.nvim" })
	use({ "p00f/clangd_extensions.nvim" })
	use({ "folke/trouble.nvim" })
	use({ "L3MON4D3/LuaSnip" })
	use({ "onsails/lspkind.nvim" })
	use({ "hrsh7th/nvim-compe" })
	use({ "hrsh7th/vim-vsnip" })
	use({ "hrsh7th/cmp-buffer" })
	use({ "hrsh7th/cmp-cmdline" })
	use({ "hrsh7th/cmp-calc" })
	use({ "tzachar/cmp-tabnine", run = "./install.sh" })
	use({ "David-Kunz/cmp-npm" })
	use({ "saadparwaiz1/cmp_luasnip" })
	use({ "MunifTanjim/nui.nvim" })
	use({ "stevearc/dressing.nvim" })
	use({ "simrat39/rust-tools.nvim" })

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
