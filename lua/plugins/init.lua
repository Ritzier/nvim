local M = {}

function M.setup()
    -- Indicate first time installation
    local packer_bootstrap = false

    -- packer.nvim configuration
    local conf = {
        profile = {
            enable = true,
            threshold = 0, -- the amount in ms that a plugins load time must be over for it to be included in the profile
        },

        display = {
            open_fn = function()
                return require("packer.util").float({ border = "rounded" })
            end,
        },
    }

    -- Check if packer.nvim is installed
    -- Run PackerCompile if there are changes in this file
    local function packer_init()
        local fn = vim.fn
        local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
        if fn.empty(fn.glob(install_path)) > 0 then
            packer_bootstrap = fn.system({
                "git",
                "clone",
                "--depth",
                "1",
                "https://github.com/wbthomason/packer.nvim",
                install_path,
            })
            vim.cmd([[packadd packer.nvim]])
        end
        vim.cmd("autocmd BufWritePost plugins.lua source <afile> | PackerCompile")
    end

    -- Plugins
    local function plugins(use)
        local function req(module)
            require("plugins." .. module)
        end
        use({ "wbthomason/packer.nvim" })

        -- Performance
        use({ "lewis6991/impatient.nvim" })

        -- Load only when require
        use({ "nvim-lua/plenary.nvim", module = "plenary" })

        -- Colorscheme
        use({
            "EdenEast/nightfox.nvim",
        })

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

        -- Buffer
        use {
            opt = true,
            tag = "*",
            event = "BufRead",
            config = req("nvim_bufferline")
        }

        -- File
        use({
            "kyazdani42/nvim-tree.lua",
            config = req("nvim_tree"),
        })

        -- Startup Screen
        use {
            "goolord/alpha-nvim",
            opt = true,
            event = "BufWinEnter",
            config = req("alpha"),
        }

        -- Treesitter
        use {
            "nvim-treesitter/nvim-treesitter",
            opt = true,
            event = "BufReadPre",
            run = ":TSUpdate",
            config = req("nvim_treesitter"),
            requires = {
                { "nvim-treesitter/nvim-treesitter-textobjects", event = "BufReadPre" },
                { "windwp/nvim-ts-autotag", event = "InsertEnter" },
                { "JoosepAlviste/nvim-ts-context-commentstring", event = "BufReadPre" },
                { "p00f/nvim-ts-rainbow", event = "BufReadPre" },
                { "RRethy/nvim-treesitter-textsubjects", event = "BufReadPre" },
                -- { "nvim-treesitter/nvim-treesitter-context", event = "BufReadPre" },
                -- { "yioneko/nvim-yati", event = "BufReadPre" },
            },
        }
        use {
            "windwp/nvim-autopairs",
            opt = true,
            event = "InsertEnter",
            wants = "nvim-treesitter",
            module = { "nvim-autopairs.completions.cmp", "nvim-autopairs" },
            config = function()
                require("autopairs").setup()
            end
        }
        use {
            "windwp/nvim-ts-autotag",
            opt = true,
            wants = "nvim-treesitter",
            event = "InsertEnter",
            config = function()
                require("nvim-ts-autotag").setup{ enable = true }
            end
        }
        use {
            "RRethy/nvim-treesitter-endwise",
            opt = true,
            wants = "nvim-treesitter",
            event = "InsertEnter",
            disable = false,
        }

        -- Blankline
        use {
            "lukas-reineke/indent-blankline.nvim",
            event = "BufReadPre",
            config = req("indent_blankline")
        }

        -- Git
        use {
            "lewis6991/gitsigns.nvim",
            event = "BufReadPre",
            wants = "plenary.nvim",
            requires = { "nvim-lua/plenary.nvim" },
            config = req("gitsigns")
        }

        -- Notification
        use {
            "rcarriga/nvim-notify",
            event = "BufReadPre",
            config = req("notify")
        }

        -- GPS
        use {
            "SmiteshP/nvim-gps",
            after = "nvim-treesitter",
            config = req("nvim_gps")
        }

        -- Bootstrap Neovim
        if packer_bootstrap then
            print("Neovim restart is required after installation!")
            require("packer").sync()
        end
    end

    -- Init and start packer
    packer_init()
    local packer = require("packer")

    -- Performance
    pcall(require, "impatient")
    -- pcall(require, "packer_compiled")

    packer.init(conf)
    packer.startup(plugins)
end

return M
