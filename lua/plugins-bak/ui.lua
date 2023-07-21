return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        -- branch = "refactor/syntax-highlighting",
        config = require("modules.ui.catppuccin"),
        lazy = false,
    },
    {
        "nvim-tree/nvim-web-devicons",
        config = require("modules.ui.devicons"),
        lazy = false,
    },
    {
        "rebelot/kanagawa.nvim",
        lazy = false,
        config = require("modules.ui.kanagawa")
    },
    {
        "nvim-tree/nvim-tree.lua",
        lazy = true,
        cmd = {
            "NvimTreeToggle",
            "NvimTreeOpen",
            "NvimTreeFindFile",
            "NvimTreeFindFileToggle",
            "NvimTreeRefresh",
        },
        config = require("modules.ui.nvim-tree")
    },
    {
        "akinsho/bufferline.nvim",
        lazy = true,
        event = { "BufReadPost", "BufAdd", "BufNewFile" },
        config = require("modules.ui.bufferline")
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        lazy = true,
        event = "BufReadPost",
        config = require("modules.ui.indent-blankline")
    },
    {
        "nvim-lualine/lualine.nvim",
        lazy = true,
        event = { "BufReadPost", "BufAdd", "BufNewFile" },
        config = require("modules.ui.lualine")
    },

    {
        "zbirenbaum/neodim",
        lazy = true,
        event = "LspAttach",
        config = require("modules.ui.neodim")
    },

    {
        "karb94/neoscroll.nvim",
        lazy = true,
        event = "BufReadPost",
        config = require("modules.ui.neoscroll")
    },

    {
        "rcarriga/nvim-notify",
        lazy = true,
        event = "VeryLazy",
        config = require("modules.ui.notify")
    },

    {
        "folke/paint.nvim",
        lazy = true,
        event = { "CursorHold", "CursorHoldI" },
        config = require("modules.ui.paint")
    },

    {
        "dstein64/nvim-scrollview",
        lazy = true,
        event = "BufReadPost",
        config = require("modules.ui.scrollview")
    },

    {
        "edluffy/specs.nvim",
        lazy = true,
        event = "CursorMoved",
        config = require("modules.ui.specs")
    },

    {
        "gelguy/wilder.nvim",
        lazy = true,
        event = "CmdlineEnter",
        config = require("modules.tools.wilder"),
        dependencies = { "romgrk/fzy-lua-native" },
    },

}
