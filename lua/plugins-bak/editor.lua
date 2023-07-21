return {
    {
        "lambdalisue/suda.vim",
        lazy = true,
        cmd = { "SudaRead", "SudaWrite" },
        config = require("modules.editor.suda"),
    },
    {
		"jiangmiao/auto-pairs",
		config = require("modules.editor.autopairs"),
        event = "BufReadPost",
	},

    {
        "ojroques/nvim-bufdel",
        lazy = true,
        event = "BufReadPost",
    },
    {
        "LunarVim/bigfile.nvim",
        lazy = false,
        config = require("modules.editor.bigfile"),
        cond = true,
    },
    {
        "terrortylor/nvim-comment",
        lazy = true,
        event = { "CursorHold", "CursorHoldI" },
        config = require("modules.editor.comment"),
    },
    {
        "junegunn/vim-easy-align",
        lazy = true,
        cmd = "EasyAlign",
    },
    {
        "phaazon/hop.nvim",
        lazy = true,
        branch = "v2",
        event = "BufReadPost",
        config = require("modules.editor.hop"),
    },
    {
        "RRethy/vim-illuminate",
        lazy = true,
        event = { "CursorHold", "CursorHoldI" },
        config = require("modules.editor.vim-illuminate"),
    },

    ----- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = true,
        build = function()
            if #vim.api.nvim_list_uis() ~= 0 then
                vim.api.nvim_command("TSUpdate")
            end
        end,
        event = { "CursorHold", "CursorHoldI" },
        config = require("modules.editor.treesitter"),
        dependencies = {
            { "RRethy/nvim-treesitter-endwise" },
            { "nvim-treesitter/nvim-treesitter-textobjects" },
            { "nvim-treesitter/nvim-treesitter-context" },
            { "mrjones2014/nvim-ts-rainbow" },
            { "JoosepAlviste/nvim-ts-context-commentstring" },
            { "mfussenegger/nvim-treehopper" },
            { "andymass/vim-matchup" },
            {
                "windwp/nvim-ts-autotag",
                config = require("modules.editor.autotag"),
            },
            {
                "NvChad/nvim-colorizer.lua",
                config = require("modules.editor.colorizer"),
            },
            {
                "abecodes/tabout.nvim",
                config = require("modules.editor.tabout"),
            },
        },
    }
}
