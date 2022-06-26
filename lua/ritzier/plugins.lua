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
        return require("ritzier." .. module)
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

        -- Icons
        use {
            "kyazdani42/nvim-web-devicons",
            opt = false,
        }

        -- NvimTree
        use {
            "kyazdani42/nvim-tree.lua",
            opt = true,
            cmd = { "NvimTreeToggle" },
            config = req("nvim_tree"),
            requires = {"nvim-web-devicons"},
        }

        -- Bufferline
        use {
            "akinsho/bufferline.nvim",
            otp = true,
            tag = "*",
            event = "BufRead",
            config = req("nvim_bufferline")
        }

        --  Alpha, Startup Clean
        use {
            "goolord/alpha-nvim",
            opt = true,
            event = "BufWinEnter",
            config = req("alpha")
        }

        -- Notify
        use {
            "rcarriga/nvim-notify",
            opt = false,
            config = req("nvim_notify")
        }

        -- Treesitter
        use {
            "nvim-treesitter/nvim-treesitter",
            opt = true,
            run = ":TSUpdate",
            event = "BufRead",
            config = req("nvim_treesitter")
        }

        use {
            "terrortylor/nvim-comment",
            opt = false,
            config = function()
                require("nvim_comment").setup({
                    hook = function()
                        require("ts_context_commentstring.internal").update_commentstring()
                    end,
                })
            end,
        }

        use {
            "nvim-treesitter/nvim-treesitter-textobjects",
            opt = true,
            after = "nvim-treesitter",
        }

        use {
            "p00f/nvim-ts-rainbow",
            opt = true,
            after = "nvim-treestter",
            event = "BufRead",
        }

        use {
            "JoosepAlviste/nvim-ts-context-commentstring",
            opt = true,
            after = "nvim-treesitter",
        }
        
        use {
            "mfussenegger/nvim-ts-hint-textobject",
            opt = true,
            after = "nvim-treesitter",
        }

        use {
            "windwp/nvim-ts-autotag",
            opt = true,
            after = "nvim-treesitter",
            config = req("autotag"),
        }

        use {
            "andymass/vim-matchup",
            opt = true,
            after = "nvim-treesitter",
            config = req("matchup"),
        }

        use {
            "norcalli/nvim-colorizer.lua",
            opt = true,
            event = "BufRead",
            config = req("nvim_colorizer"),
        }

        -- Status line
        use {
            "hoob3rt/lualine.nvim",
            opt = true,
            after = "nvim-gps",
            config = req("lualine")
        }

        -- Gps
        use {
            "SmiteshP/nvim-gps",
            opt = true,
            after = "nvim-treesitter",
            config = req("nvim_gps")
        }

        -- Git
        use {
            "lewis6991/gitsigns.nvim",
            opt = true,
            event = { "BufRead", "BufNewFile" },
            config = req("gitsigns"),
            requires = {"nvim-lua/plenary.nvim", opt=true}
        }

        use {
            "lukas-reineke/indent-blankline.nvim",
            opt = true,
            after = "nvim-treesitter",
            event = "BufRead",
            config = req("indent_blankline"),
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
