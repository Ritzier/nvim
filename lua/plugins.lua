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

return packer.startup(function(use)
	use({ "wbthomason/packer.nvim" })
	use({ "lewis6991/impatient.nvim" })
	use({
		"antoinemadec/FixCursorHold.nvim",
		config = function()
			vim.g.cursorhold_updatetime = 100
		end,
	})

	-- UI
	use({ "EdenEast/nightfox.nvim" })
	-- Icons
	use({ "kyazdani42/nvim-web-devicons" })
	-- Bufferline
	use({
		"akinsho/bufferline.nvim",
		config = function()
			require("configuration.bufferline")
		end,
	})
	-- NvimTree
	use({
		"kyazdani42/nvim-tree.lua",
		config = function()
			require("configuration.nvimtree")
		end,
	})
	-- TreeSitter
	use({
		"nvim-treesitter/nvim-treesitter",
		requires = {
			{ "windwp/nvim-ts-autotag" },
			{ "RRethy/nvim-treesitter-endwise" },
			{ "p00f/nvim-ts-rainbow" },
			{ "windwp/nvim-autopairs" },
			{
				"lukas-reineke/indent-blankline.nvim",
			},
			{ "JoosepAlviste/nvim-ts-context-commentstring" },
			{ "nvim-treesitter/playground" },
			{ "andymass/vim-matchup" },
		},
		config = function()
			require("configuration.tree_sitter")
		end,
		run = ":TSUpdate",
	})

	-- Todo
	use({
		"folke/todo-comments.nvim",
		config = function()
			require("configuration.todo-comments")
		end,
	})

	-- Wilder
	use({
		"gelguy/wilder.nvim",
		config = function()
			require("configuration.wilder")
		end,
	})

	-- Comment
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})

	-- Git
	use({
		"lewis6991/gitsigns.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("configuration.gitsigns")
		end,
	})

	-- WhichKey
	use({
		"folke/which-key.nvim",
		config = function()
			require("configuration.which_key")
		end,
	})

	-- Nvim in browser
	use({
		"glacambre/firenvim",
		run = function()
			vim.fn["firenvim#install"](0)
		end,
	})

	-- Align
	use({
		"junegunn/vim-easy-align",
		cmd = "EasyAlign",
	})

	-- UserInterface
	use({
		"stevearc/dressing.nvim",
		config = function()
			require("configuration.dressing")
		end,
		requires = {
			{
				"MunifTanjim/nui.nvim",
				config = function()
					require("configuration.nui")
				end
			}
		}
	})

	-- Color
	use({
		"uga-rosa/ccc.nvim",
		config = function()
			require("configuration.ccc")
		end
	})
	use({
		"brenoprata10/nvim-highlight-colors",
		config = function()
			require("nvim-highlight-colors").setup({
				render = "background",
				enable_tailwind = true
			})
			require("nvim-highlight-colors").turnOn()
		end,
	})

	-- LSP
	use({
		"neovim/nvim-lspconfig",
		requires = {
			{ "williamboman/mason.nvim" },
			{ "WhoIsSethDaniel/mason-tool-installer.nvim" },
			{
				"ray-x/lsp_signature.nvim",
				config = function()
					require("lsp-config.lsp_signature")
				end
			},
			{
				"j-hui/fidget.nvim",
				config = function()
					require("fidget").setup()
				end,
			},
			{
				"creativenull/efmls-configs-nvim",
				config = function()
					require("lsp-config.efm")
				end,
			},
			-- {
			-- 	"glepnir/lspsaga.nvim",
			-- 	config = function()
			-- 		require("lsp-config.lspsaga")
			-- 	end,
			-- },
			{ "RRethy/vim-illuminate" },

			{ "folke/lua-dev.nvim" },
			{ "p00f/clangd_extensions.nvim" },
			{
				"simrat39/rust-tools.nvim",
				requires = { "nvim-lua/plenary.nvim", "rust-lang/rust.vim" },
			},
			{
				"saecki/crates.nvim",
				event = { "BufRead Cargo.toml" },
				config = function()
					require("crates").setup()
				end,
			},
			{ "jose-elias-alvarez/typescript.nvim" },
			{ "b0o/schemastore.nvim" },
			{ "mfussenegger/nvim-jdtls", ft = { "java" } },
			{ "udalov/kotlin-vim", ft = { "kotlin" }, disable = true },
			{ "yuezk/vim-js" },
			{ "HerringtonDarkholme/yats.vim" },
			{ "maxmellon/vim-jsx-pretty" },
			{ "dart-lang/dart-vim-plugin" },
			{ "natebosch/vim-lsc" },
			{ "natebosch/vim-lsc-dart" },
			{ "nanotee/sqls.nvim" },
		},
		config = function()
			require("lsp-config")
		end
	})

	-- CMP
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			{
				"L3MON4D3/LuaSnip",
				config = function()
					require("cmp-config.luasnip")
				end,
				requires = "rafamadriz/friendly-snippets",
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
			{ "windwp/nvim-autopairs", config = function() require("cmp-config.autopairs") end },
		},
		config = function() require("cmp-config") end
	})


	use({
		"stevearc/overseer.nvim",
		config = function()
			require("overseer").setup()
		end
	})

	-- FileType
	use({
		"ray-x/go.nvim",
		ft = { "go" },
		config = function()
			requrie("go").setup()
		end
	})
	use({
		"habamax/vim-godot"
	})

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
