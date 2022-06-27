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
            config = Script.req("nvim_tree")
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

return M
