return {
    {
        "folke/which-key.nvim",
        lazy = true,
        event = "CmdlineEnter",
        config = require("modules.tools.which-key")
    },
    {
        "ibhagwan/smartyank.nvim",
        lazy = true,
        event = "BufReadPost",
        config = require("modules.tools.smartyank")
    },
    {
        "michaelb/sniprun",
        lazy = true,
        build = "bash ./install.sh",
        cmd = { "SnipRun" },
        config = require("modules.tools.sniprun")
    },
    {
        "akinsho/toggleterm.nvim",
        lazy = true,
        cmd = {
            "ToggleTerm",
            "ToggleTermSetName",
            "ToggleTermToggleAll",
            "ToggleTermSendVisualLines",
            "ToggleTermSendCurrentLine",
            "ToggleTermSendVisualSelection",
        },
        config = require("modules.tools.toggleterm")

    },
    {
        "gelguy/wilder.nvim",
        lazy = true,
        event = "CmdlineEnter",
        config = require("modules.tools.wilder"),
        dependencies = { "romgrk/fzy-lua-native" },
    },

    {
        "tpope/vim-fugitive",
        lazy = true,
        cmd  = { "Git", "G" }
    },

    {
        "stevearc/overseer.nvim",
        lazy = true,
        event = "BufWinEnter",
        config = require("modules.tools.overseer")
    },

    -- Draw on neovim
    {
        "jbyuki/venn.nvim",
        lazy = true,
        event = "BufWinEnter",
        config = require("modules.tools.venn")
    },

    {
        "stevearc/overseer.nvim",
        lazy = true,
        event = "BufWinEnter",
        config = require("modules.tools.overseer")
    },
}
