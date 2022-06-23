local M = {}

function M.setup()
    -- Indicate first time installation
    local packer_bootstrap = false

    local ui     = require("config.ui")
    local editor = require("config.editor")
    local compl  = require("config.compl")

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

    -- Plugins
    local function plugins(use)
         -- Packer
        use {"wbthomason/packer.nvim"}

        
        use {
            "nvim-lua/plenary.nvim",
            opt = false,
        }
        
        -- Colorscheme
        use {
            "EdenEast/nightfox.nvim",
            config = ui.colorscheme
        }
        
        -- Icons
        use {
            "kyazdani42/nvim-web-devicons",
            opt = false,
        }

        -- Make notification looks better!!!
        use {
            "rcarriga/nvim-notify",
            opt    = false,
            config = ui.notify
        }

        -- Startup screen
        use {
            "goolord/alpha-nvim",
            opt    = true,
            event  = "BufWinEnter",
            config = ui.alpha
        }

        -- File Explorer
        use {
            "kyazdani42/nvim-tree.lua",
            opt    = true,
            cmd    = { "NvimTreeToggle" },
            config = ui.nvim_tree
        }

        -- Git
        use {
            "lewis6991/gitsigns.nvim",
            opt      = true,
            event    = { "BufRead", "BufNewFile" },
            config   = ui.gitsigns,
            requires = { "nvim-lua/plenary.nvim", opt = true },
        }

        -- Blankline
        use {
            "lukas-reineke/indent-blankline.nvim",
            opt    = true,
            event  = "BufRead",
            config = ui.indent_blankline,
        }

        -- Bufferline
        use {
            "akinsho/bufferline.nvim",
            opt    = true,
            tag    = "*",
            event  = "BufRead",
            config = ui.nvim_bufferline,
        }

        -- UndoTree
        use {
            "mbbill/undotree",
            opt = true,
            cmd = "UndoTreeToggle"
        }

        -- provide a UI for nvim-lsp's progress handler
        use {
            "j-hui/fidget.nvim",
            opt    = true,
            event  = "BufRead",
            config = function()
                require("fidget").setup({})
            end
        }

        -- Treesitter
        use {
            "nvim-treesitter/nvim-treesitter",
            opt      = true,
            event    = "BufReadPre",
            run      = ":TSUpdate",
            config   = editor.nvim_treesitter,
            requires = {
                { "nvim-treesitter/nvim-treesitter-textobjects", event = "BufReadPre" },
                { "windwp/nvim-ts-autotag",                      event = "InsertEnter" },
                { "JoosepAlviste/nvim-ts-context-commentstring", event = "BufReadPre" },
                { "p00f/nvim-ts-rainbow",                        event = "BufReadPre" },
                { "RRethy/nvim-treesitter-textsubjects",         event = "BufReadPre" },
                { "RRethy/nvim-treesitter-endwise",              opt   = true, event = "InsertEnter", disable = false}
            },
        }

        use {
            "windwp/nvim-autopairs",
            opt    = true,
            event  = "InsertEnter",
            wants  = "nvim-treesitter",
            module = { "nvim-autopairs.completion.cmp", "nvim-autopairs" },
            config = function()
                require("nvim-autopairs").setup({
                    fast_wrap = {
                        map            = '<M-e>',
                        chars          = { '{', '[', '(', '"', "'" },
                        pattern        = [=[[%'%"%)%>%]%)%}%,]]=],
                        end_key        = '$',
                        keys           = 'qwertyuiopzxcvbnmasdfghjkl',
                        check_comma    = true,
                        highlight      = 'Search',
                        highlight_grey = 'Comment',
                    }
                })
            end
        }

          -- Auto tag
        use {
            "windwp/nvim-ts-autotag",
            opt    = true,
            wants  = "nvim-treesitter",
            event  = "InsertEnter",
            config = function()
                require("nvim-ts-autotag").setup { enable = true }
            end,
        }

        -- Colorizer
        use {
            "norcalli/nvim-colorizer.lua",
            opt    = true,
            event  = "BufRead",
            config = editor.nvim_colorizer
        }

        -- Term
        use {
            "akinsho/toggleterm.nvim",
            opt    = true,
            event  = "BufRead",
            config = editor.toggleterm,
        }

        -- GPS
        use {
            "SmiteshP/nvim-gps",
            opt    = true,
            after  = "nvim-treesitter",
            config = ui.nvim_gps
        }

        -- Lualine
        use {
            "hoob3rt/lualine.nvim",
            opt    = true,
            after  = "nvim-gps",
            config = ui.lualine,
        }

        -- Trouble
        use {
            "folke/trouble.nvim",
            opt = true,
            cmd = {"Trouble", "TroubleToggle", "TroubleRefresh"},
            config = editor.trouble,
        }

        -- Telescope
        use {
            "nvim-telescope/telescope.nvim",
            cmd = "Telescope",
            config = editor.telescope,
        }

        -- Aligning code
        use {
            "junegunn/vim-easy-align",
        }

        -- Comment
        use {
            "numToStr/Comment.nvim",
            module = "Comment",
            keys = {"gc", "gb"},
            config = function()
                require("nvim_comment").setup()
            end
        }

        -- Lsp
        use {
            "neovim/nvim-lspconfig",
            opt = true,
            event = "BufReadPre",
            config = compl.nvim_lsp
        }
        use {
            "creativenull/efmls-configs-nvim",
            opt = false,
            requires = "neovim/nvim-lspconfig",
        }
        use {
            "williamboman/nvim-lsp-installer",
            opt = false,
        }
        use {
            "kevinhwang91/nvim-bqf",
            opt = true,
            ft = "qf",
            config = compl.bqf
        }
        use {
            "tami5/lspsaga.nvim",
            opt = true,
            after = "nvim-lspconfig"
        }
        use {
            "stevearc/aerial.nvim",
            opt = true,
            after = "nvim-lspconfig",
            config = compl.aerial
        }
        use {
            "kosayoda/nvim-lightbulb",
            opt = true,
            after = "nvim-lspconfig",
            config = compl.lightbulb,
        }
        use {
            "ray-x/lsp_signature.nvim",
            opt = true,
            after = "nvim-lspconfig",
        }
        use {
            "hrsh7th/nvim-cmp",
            config = compl.cmp,
            event = "InsertEnter",
            requires = {
                { "lukas-reineke/cmp-under-comparator" },
                { "saadparwaiz1/cmp_luasnip", after = "LuaSnip" },
                { "hrsh7th/cmp-nvim-lsp", after = "cmp_luasnip" },
                { "hrsh7th/cmp-nvim-lua", after = "cmp-nvim-lsp" },
                { "andersevenrud/cmp-tmux", after = "cmp-nvim-lua" },
                { "hrsh7th/cmp-path", after = "cmp-tmux" },
                { "f3fora/cmp-spell", after = "cmp-path" },
                { "hrsh7th/cmp-buffer", after = "cmp-spell" },
                { "kdheepak/cmp-latex-symbols", after = "cmp-buffer" },
                -- {
                -- 	"tzachar/cmp-tabnine",
                -- 	run = "./install.sh",
                -- 	after = "cmp-latex-symbols",
                -- 	config = conf.tabnine,
                -- },
            },
        }
        use {
            "L3MON4D3/LuaSnip",
            after = "nvim-cmp",
            config = compl.luasnip,
            requires = "rafamadriz/friendly-snippets"
        }
        use {
            "RRethy/vim-illuminate",
            event = "BufRead",
            config = function()
                vim.g.Illuminate_highlightUnderCursor = 0
                vim.g.Illuminate_ftblacklist = {
                    "help",
                    "dashboard",
                    "alpha",
                    "packer",
                    "norg",
                    "DoomInfo",
                    "NvimTree",
                    "Outline",
                    "toggleterm",
                }
            end
        }
        use {
            "terrortylor/nvim-comment",
            opt = false,
            config = function()
                require("nvim_comment").setup({
                    hook = function()
                        require("ts_context_commentstring.internal").update_commentstring()
                    end
                })
            end
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
