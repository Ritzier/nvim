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

	-- UI
	--Colorscheme
	use({ "EdenEast/nightfox.nvim" })
	use({ "folke/tokyonight.nvim" })
	use({ "rose-pine/neovim", as = "rose-pine" })
	use({ "catppuccin/nvim", as = "catppuccin" })
	use({ "ellisonleao/gruvbox.nvim" })
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
	use({ "lukas-reineke/indent-blankline.nvim" })
	use({ "JoosepAlviste/nvim-ts-context-commentstring" })
	-- GPS
	use({ "SmiteshP/nvim-gps" })
	-- Lualine
	use({ "nvim-lualine/lualine.nvim" })
	-- Startup Screen
	use({ "goolord/alpha-nvim" })

	-- Tools
	-- Terminal
	use({ "akinsho/toggleterm.nvim" })
	--Comment
	use({ "numToStr/Comment.nvim" })
	-- Git
	use({ "lewis6991/gitsigns.nvim" })
	-- Show colors
	use({
		"norcalli/nvim-colorizer.lua",
		cmd = "ColorizerToggle",
		config = function()
			require("colorizer").setup()
		end,
	})
	use({
		"rktjmp/lush.nvim",
		cmd = { "LushRunQuickstart", "LushRunTutorial", "Lushify", "LushImport" },
		disable = false,
	})
	-- Show all function and variable
	use({ "simrat39/symbols-outline.nvim" })
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

	-- Open neovim in browser
	use({
		"glacambre/firenvim",
		run = function()
			vim.fn["firenvim#install"](0)
		end,
	})

    -- Completion
    use({ "neovim/nvim-lspconfig" })
    use({ "SmiteshP/nvim-navic" })
    use({"hrsh7th/nvim-cmp"})
    use({ "lukas-reineke/cmp-under-comparator" })
    use({ "saadparwaiz1/cmp_luasnip" })
    use({ "hrsh7th/cmp-nvim-lsp" })
    use({ "hrsh7th/cmp-nvim-lua" })
    use({ "andersevenrud/cmp-tmux" })
    use({ "hrsh7th/cmp-path" })
    use({ "f3fora/cmp-spell" })
    use({ "hrsh7th/cmp-buffer" })
    use({ "kdheepak/cmp-latex-symbols" })
    use({ "creativenull/efmls-configs-nvim" })
    use({ "williamboman/nvim-lsp-installer" })
    -- use({"kevinhwang91/nvim-bqf"})
    use({ "tami5/lspsaga.nvim" })
    use({
        "stevearc/aerial.nvim",
        config = function()
            require("aerial").setup()
        end
    })
    use({ "kosayoda/nvim-lightbulb" })
    use({ "L3MON4D3/LuaSnip" })
    use({ "rafamadriz/friendly-snippets" })
    use({ "github/copilot.vim", cmd="Copilot" })

    -- FIleytpe
    use({ "p00f/clangd_extensions.nvim"})

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
