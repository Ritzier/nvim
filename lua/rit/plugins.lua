local M = {}

function M.setup()
    -- Indicate first time installation
    local packer_bootstrap = false

    -- packer.nvim configuration
    local conf = {
        profile = {
            enable = true,
            threshold = 0 -- the amount in ms that a plugins load time must be over for it to be included in the profile
        },
        display = {
            open_fn = function()
                return require("packer.util").float {border = "rounded"}
            end
        }
    }

    -- Check if packer.nvim is installed
    -- Run PackerCompile if there are changes in this file
    local function packer_init()
        local fn = vim.fn
        local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
        if fn.empty(fn.glob(install_path)) > 0 then
            packer_bootstrap =
                fn.system {
                "git",
                "clone",
                "--depth",
                "1",
                "https://github.com/wbthomason/packer.nvim",
                install_path
            }
            vim.cmd [[packadd packer.nvim]]
        end
        vim.cmd "autocmd BufWritePost plugins.lua source <afile> | PackerCompile"
    end

    local Script = require("rit.script")
    local function req(modules)
        require("rit.config."..modules)
    end

    -- Plugins
    local function plugins(use)
        use {"wbthomason/packer.nvim"}

        -- Colorscheme
        use {"EdenEast/nightfox.nvim"}
        use {
            "catppuccin/nvim",
            opt = false,
            as = "catppuccin",
            config = Script.req("catppuccin")
        }

        -- Bufferline
        use {
            "akinsho/bufferline.nvim",
            opt = true,
            tag = "*",
            evetn = "BufRead",
            config = Script.req("bufferline")
        }

        -- NvimTree
        use {
            "kyazdani42/nvim-tree.lua",
            opt = true,
            cmd = { "NvimTreeToggle" },
            --config = Script.req("nvim_tree")
        }

        -- Git
        use {
            "lewis6991/gitsigns.nvim",
            opt = true,
            event = { "BufRead", "BufNewFile" },
            config = Script.req("gitsigns"),
            requires = { "nvim-lua/plenary.nvim", opt=true},
        }

        -- Blankline
        use {
            "lukas-reineke/indent-blankline.nvim",
            opt = true,
            event = "BufRead",
            config = Script.req("indent_blankline"),
        }

        if packer_bootstrap then
            print "Restart Neovim required after installation!"
            require("packer").sync()
        end
    end

    -- Init and start packer
    packer_init()
    local packer = require "packer"

    -- Performance
    pcall(require, "impatient")
    -- pcall(require, "packer_compiled")

    packer.init(conf)
    packer.startup(plugins)
end

function M.a()
    local fn = vim.fn

    local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        PACKER_BOOTSTRAP = fn.system {
            "git",
            "clone",
            "--depth",
            "1",
            "https://github.com/wbthomason/packer.nvim",
            install_path,
        }
        print "Installing packer close and reopen Neovim..."
        vim.cmd [[packadd packer.nvim]]
    end

     vim.cmd [[
     augroup packer_user_config
        autocmd!
        autocmd BufWritePost rit.plugins.lua source <afile> | PackerSync
    augroup end
    ]]

    local status_ok, packer = pcall(require, "packer")
    if not status_ok then
        return
    end

    packer.init {
        display = {
            open_fn = function()
                return require("packer.util").float { border = "rounded" }
            end,
        },
    }

    return packer.startup(function(use)
        use "wbthomason/packer.nvim" -- Have packer manage itself
        use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
        use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
        use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
        use "numToStr/Comment.nvim" -- Easily comment stuff
        use "kyazdani42/nvim-web-devicons"
        use "kyazdani42/nvim-tree.lua"
        use "akinsho/bufferline.nvim"
        use "moll/vim-bbye"
        use "nvim-lualine/lualine.nvim"
        use "akinsho/toggleterm.nvim"
        use "ahmedkhalf/project.nvim"
        use "lewis6991/impatient.nvim"
        use "lukas-reineke/indent-blankline.nvim"
        use "goolord/alpha-nvim"
        use "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlight
        use "folke/which-key.nvim"

        -- Colorschemes
        -- use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
        use {"catppuccin/nvim",as="catppuccin"}
        use "EdenEast/nightfox.nvim"

        -- cmp plugins
        use "hrsh7th/nvim-cmp" -- The completion plugin
        use "hrsh7th/cmp-buffer" -- buffer completions
        use "hrsh7th/cmp-path" -- path completions
        use "hrsh7th/cmp-cmdline" -- cmdline completions
        use "saadparwaiz1/cmp_luasnip" -- snippet completions
        use "hrsh7th/cmp-nvim-lsp"

        -- snippets
        use "L3MON4D3/LuaSnip" --snippet engine
        use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

        -- LSP
        use "neovim/nvim-lspconfig" -- enable LSP
        use "williamboman/nvim-lsp-installer" -- simple to use language server installer
        use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
        use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters

        -- Telescope
        use "nvim-telescope/telescope.nvim"

        -- Treesitter
        use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        }
        use "JoosepAlviste/nvim-ts-context-commentstring"

        -- Git
        use "lewis6991/gitsigns.nvim"

        if PACKER_BOOTSTRAP then
            require("packer").sync()
        end
    end)
end

return M
