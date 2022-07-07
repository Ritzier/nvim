local fn = vim.fn

if vim.loop.os_uname().sysname == "Windows_NT" then
	packer_path = fn.stdpath("data") .. "\\site\\pack\\packer\\start\\packer.nvim"
else
	packer_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
end

if fn.empty(fn.glob(packer_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		packer_path,
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
	use({ "lewis6991/impatient.nvim" })
	use({ "nathom/filetype.nvim" })
	use({ "mrjones2014/legendary.nvim" })

	-- Colorscheme
	use("EdenEast/nightfox.nvim")

	--     useins
	use({ "kyazdani42/nvim-web-devicons" })
	use({ "windwp/nvim-autopairs" })
	use({ "kyazdani42/nvim-tree.lua" })
	use({ "akinsho/bufferline.nvim" })
	use({ "rcarriga/nvim-notify" })
	use({ "nvim-lualine/lualine.nvim" })
	use({
		"norcalli/nvim-colorizer.lua",
		cmd = "ColorizerToggl",
		config = function()
			require("colorizer").setup()
		end,
	})
	use({
		"lewis6991/gitsigns.nvim",
		wants = "plenary.nvim",
		requires = { "nvim-lua/plenary.nvim" },
	})
	use({ "goolord/alpha-nvim" })

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
	})
	use({
		"windwp/nvim-ts-autotag",
		wants = "nvim-treesitter",
		event = "InsertEnter",
	})
	use({
		"RRethy/nvim-treesitter-endwise",
		after = "nvim-treesitter",
	})
	use({
		"p00f/nvim-ts-rainbow",
		after = "nvim-treesitter",
	})
	-- Indent Line
	use({
		"lukas-reineke/indent-blankline.nvim",
		after = "nvim-treesitter",
	})

	-- Neovim gps
	use({
		"SmiteshP/nvim-gps",
		after = "nvim-treesitter",
	})

	-- Toggleterm
	use({
		"akinsho/toggleterm.nvim",
	})

	-- Other plugins
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})
	use({ "folke/lua-dev.nvim" })
	use({ "RRethy/vim-illuminate" })
	use({
		"j-hui/fidget.nvim",
		config = function()
			require("fidget")
		end,
	})

	-- Whichkey
	use({
		"folke/which-key.nvim",
	})

	-- Show symbols
	use({ "simrat39/symbols-outline.nvim" })

    -- LSP
    use ({'neovim/nvim-lspconfig'})
    use ({'tamago324/nlsp-settings.nvim'})
    use ({'williamboman/nvim-lsp-installer'})

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end

	pcall(require, "impatient")
	require("manual_modules.configuration")
end)
