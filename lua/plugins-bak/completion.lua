return {
    {
        "neovim/nvim-lspconfig",
        lazy = true,
        event = { "BufReadPost", "BufAdd", "BufNewFile" },
        config = require("modules.completion.lsp"),
        dependencies = {
            { "ray-x/lsp_signature.nvim" },
            {
                "williamboman/mason.nvim",
                config = require("modules.completion.mason"),
            },
            {
                "nvimdev/lspsaga.nvim",
                config = require("modules.completion.lspsaga"),
            },
            { "folke/neodev.nvim" },
        },
    },
    -- Uncomplete
    {
        "jose-elias-alvarez/null-ls.nvim",
        lazy = true,
        event = { "CursorHOld", "CursorHoldI" },
        config = require("modules.completion.null-ls"),
        dependencies = {
            "nvim-lua/plenary.nvim",
            "jay-babu/mason-null-ls.nvim",
        }
    },
    {
        "hrsh7th/nvim-cmp",
        lazy = true,
        event = "InsertEnter",
        config = require("modules.completion.cmp"),
        dependencies = {
            {
                "L3MON4D3/LuaSnip",
                dependencies = { "rafamadriz/friendly-snippets" },
                config = require("modules.completion.luasnip"),
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
            { "ray-x/cmp-treesitter", commit = "c8e3a74" },
            {"onsails/lspkind.nvim"},
        },
    },

    {
        "j-hui/fidget.nvim",
        branch = "legacy",
        lazy = true,
        event = "LspAttach",
        config = require("modules.completion.fidget")
    }
}
