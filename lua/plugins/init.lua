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

        -- Icons
        use({
            "kyazdani42/nvim-web-devicons",
            module = "nvim-web-devicons",
            config = function()
                require("nvim-web-devicons").setup({ default = true })
            end,
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
        use({
            "akinsho/bufferline.nvim",
            opt = true,
            tag = "*",
            event = "BufRead",
            config = req("nvim_bufferline"),
        })

        -- File
        use({
            "kyazdani42/nvim-tree.lua",
            config = req("nvim_tree"),
        })

        -- Startup Screen
        use({
            "goolord/alpha-nvim",
            opt = true,
            event = "BufWinEnter",
            config = req("alpha"),
        })

        -- Pairs
        use({
            "windwp/nvim-autopairs",
            config = req("autopairs"),
        })

        -- Treesitter
        use({
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
        })

        use({
            "windwp/nvim-ts-autotag",
            opt = true,
            wants = "nvim-treesitter",
            event = "InsertEnter",
            config = function()
                require("nvim-ts-autotag").setup({ enable = true })
            end,
        })
        use({
            "RRethy/nvim-treesitter-endwise",
            opt = true,
            wants = "nvim-treesitter",
            event = "InsertEnter",
            disable = false,
        })

        -- Blankline
        use({
            --"lukas-reineke/indent-blankline.nvim",
            event = "BufReadPre",
            config = req("indent_blankline"),
        })

        -- Git
        use({
            "lewis6991/gitsigns.nvim",
            event = "BufReadPre",
            wants = "plenary.nvim",
            requires = { "nvim-lua/plenary.nvim" },
            config = req("gitsigns"),
        })

        -- Notification
        use({
            "rcarriga/nvim-notify",
            event = "BufReadPre",
            config = req("notify"),
        })

        -- Commnet
        use({
            "numToStr/Comment.nvim",
            keys = { "gc", "gcc", "gbc" },
            config = req("comment"),
        })

        -- GPS
        use({
            "SmiteshP/nvim-gps",
            after = "nvim-treesitter",
            config = req("nvim_gps"),
        })

        -- IDE
        use({
            "antoinemadec/FixCursorHold.nvim",
            event = "BufReadPre",
            config = function()
                vim.g.cursorhold_updatetime = 100
            end,
        })
        use({
            "google/vim-searchindex",
            event = "BufReadPre",
        })

        -- User interface
        use({
            "stevearc/dressing.nvim",
            event = "BufReadPre",
            config = function()
                require("dressing").setup({
                    input = { relative = "editor" },
                    select = {
                        backend = { "telescope", "fzf", "builtin" },
                    },
                })
            end,
            disable = false,
        })
        use({
            "ray-x/guihua.lua",
            run = "cd lua/fzy && make",
            disable = true,
        })

        -- Trouble
        use({
            "folke/trouble.nvim",
            wants = "nvim-web-devicons",
            cmd = { "TroubleToggle", "Trouble" },
            config = function()
                require("trouble").setup({
                    use_diagnostic_signs = true,
                })
            end,
        })

        -- rename
        use({
            "filipdutescu/renamer.nvim",
            module = { "renamer" },
            config = function()
                require("renamer").setup({})
            end,
        })

        --
        use({
            "b0o/SchemaStore.nvim",
        })
        use({
            "hrsh7th/cmp-nvim-lsp",
        })

        -- Code documentation
        use({
            "danymat/neogen",
            cmd = { "Neogen" },
            module = "neogen",
            disable = false,
            config = req("neogen"),
        })

        -- Lsp
        use({
            "neovim/nvim-lspconfig",
            opt = true,
            event = { "BufReadPre" },
            wants = {
                "nvim-lsp-installer",
                "cmp-nvim-lsp",
                "lua-dev.nvim",
                "vim-illuminate",
                "null-ls.nvim",
                "schemastore.nvim",
                "typescript.nvim",
                "nvim-navic",
            },
            requires = {
                "williamboman/nvim-lsp-installer",
                "folke/lua-dev.nvim",
                "RRethy/vim-illuminate",
                "jose-elias-alvarez/null-ls.nvim",
                {
                    "j-hui/fidget.nvim",
                    config = function()
                        require("fidget").setup({})
                    end,
                },
                "b0o/schemastore.nvim",
                "jose-elias-alvarez/typescript.nvim",
                {
                    "SmiteshP/nvim-navic",
                    config = function()
                        require("nvim-navic").setup({})
                    end,
                },
            },
            config = req("lsp"),
        })
        use({
            "glepnir/lspsaga.nvim",
            cmd = { "Lspsaga" },
            config = function()
                require("lspsaga").init_lsp_saga()
            end,
        })

        -- Completion
        use({
            "hrsh7th/nvim-cmp",
            event = "InsertEnter",
            opt = true,
            wants = { "LuaSnip" },
            requires = {
                "hrsh7th/cmp-buffer",
                "hrsh7th/cmp-path",
                "hrsh7th/cmp-nvim-lua",
                "ray-x/cmp-treesitter",
                "hrsh7th/cmp-cmdline",
                "saadparwaiz1/cmp_luasnip",
                "hrsh7th/cmp-nvim-lsp",
                "hrsh7th/cmp-nvim-lsp-signature-help",
                -- "onsails/lspkind-nvim",
                -- "hrsh7th/cmp-calc",
                -- "f3fora/cmp-spell",
                -- "hrsh7th/cmp-emoji",
                {
                    "L3MON4D3/LuaSnip",
                    wants = { "friendly-snippets", "vim-snippets" },
                    config = req("snip"),
                },
                "rafamadriz/friendly-snippets",
                "honza/vim-snippets",
            },
            config = req("cmp"),
        })

        -- Flutter
        use({
            "akinsho/flutter-tools.nvim",
            requires = { "nvim-lua/plenary.nvim" },
            config = req("flutter"),
            disable = true,
        })

        -- Language
        -- Markdown

        --Rust
        use({
            "simrat39/rust-tools.nvim",
            requires = { "nvim-lua/plenary.nvim", "rust-lang/rust.vim" },
            opt = true,
            module = "rust-tools",
            ft = { "rust" },
            config = req("rust"),
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

        -- Go
        use({
            "ray-x/go.nvim",
            ft = { "go" },
            config = function()
                require("go").setup()
            end,
            disable = true,
        })

        -- Java
        use({ "mfussenegger/nvim-jdtls", ft = { "java" } })

        -- Terminal
        use({
            "akinsho/toggleterm.nvim",
            keys = { [[<C-\>]] },
            cmd = { "ToggleTerm", "TermExec" },
            module = { "toggleterm", "toggleterm.terminal" },
            config = function()
                local present, module = pcall(require, "toggleterm")
                if present then
                    require("toggleterm").setup({
                        size = 20,
                        hide_numbers = true,
                        open_mapping = [[<C-\>]],
                        shade_filetypes = {},
                        shade_terminals = false,
                        shading_factor = 0.3,
                        start_in_insert = true,
                        persist_size = true,
                        direction = "horizontal",
                    })
                end
            end
        })

        -- Vimspector
        use({
            "puremourning/vimspector",
            cmd = { "VimspectorInstall", "VimspectorUpdate" },
            fn = { "vimspector#Launch()", "vimspector#ToggleBreakpoint", "vimspector#Continue" },
            config = req("vimspector"),
            disable = true,
        })

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
