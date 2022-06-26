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

    local function req(module)
        return require("rit." .. module)
    end

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

    -- Plugins
    local function plugins(use)
         -- Packer
        use {"wbthomason/packer.nvim"}
        use {"lewis6991/impatient.nvim"}

        -- Colorscheme
        use {
            "catppuccin/nvim",
            opt = false,
            as = "catppuccin",
            config = req("catppuccin")
        }

        use {
            "nvim-treesitter/nvim-treesitter",
            opt = true,
            run = ":TSUpdate",
            event = "BufRead",
            config = req("nvim_treesitter")
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
