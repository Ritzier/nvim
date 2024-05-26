vim.opt.list = true
return {
    {
        "nvim-treesitter/nvim-treesitter",
        dependencies = {
            "RRethy/nvim-treesitter-endwise",
            "windwp/nvim-ts-autotag",
            "nvim-treesitter/playground",
            {
                -- Weried settings
                "lukas-reineke/indent-blankline.nvim",
                -- enabled = true,
                enabled = false,
                main = "ibl",
                config = require("plugins.treesitter.ibl"),
            },
            {
                "shellRaining/hlchunk.nvim",
                -- enabled = false,
                event = { "UIEnter" },
                config = function()
                    require("hlchunk").setup({
                        chunk = {
                            enable = true,
                            notify = true,
                            use_treesitter = false,
                        },
                        indent = {
                            use_treesitter = false,
                            chars = { "┆" },
                        },
                        blank = {
                            enable = true,
                        },
                    })
                end,
            },
            {
                "HiPhish/rainbow-delimiters.nvim",
                config = function()
                    -- This module contains a number of default definitions
                    local rainbow_delimiters = require("rainbow-delimiters")

                    vim.g.rainbow_delimiters = {
                        strategy = {
                            [""] = rainbow_delimiters.strategy["global"],
                            vim = rainbow_delimiters.strategy["local"],
                        },
                        query = {
                            [""] = "rainbow-delimiters",
                            lua = "rainbow-blocks",
                        },
                        priority = {
                            [""] = 110,
                            lua = 210,
                        },
                        highlight = {
                            "RainbowDelimiterRed",
                            "RainbowDelimiterYellow",
                            "RainbowDelimiterBlue",
                            "RainbowDelimiterOrange",
                            "RainbowDelimiterGreen",
                            "RainbowDelimiterViolet",
                            "RainbowDelimiterCyan",
                        },
                    }
                end,
            },
        },
        build = ":TSUpdate",
        event = { "BufReadPost", "BufNewFile" },
        config = require("plugins.treesitter.config"),
    },
}
