return {
    {
        "folke/edgy.nvim",
        event = "VeryLazy",
        opts = {
        }
    },

    -- {
    --     "nvim-lualine/lualine.nvim",
    --     event = { "BufReadPost", "BufAdd", "BufNewFile" },
    --     config = require("plugins.ui.lualine")
    -- },

    {
        "rebelot/heirline.nvim",
        event = { "BufreadPost", "BufAdd", "BufNewFile" },
        config = require("plugins.ui.heirline")
    },

    {
        "gelguy/wilder.nvim",
        event = "CmdlineEnter",
        config = require("plugins.ui.wilder"),
        dependencies = {
            "romgrk/fzy-lua-native"
        }
    },
}
