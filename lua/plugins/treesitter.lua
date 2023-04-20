return {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = true,
        build = function()
            if #vim.api.nvim_list_uis() ~= 0 then
                vim.api.nvim_command("TSUpdate")
            end
        end,
        event = { "CursorHold", "CursorHoldI" },
        dependencies = {
            { "windwp/nvim-ts-autotag" },
            { "RRethy/nvim-treesitter-endwise" },
            { "p00f/nvim-ts-rainbow" },
            {
                "lukas-reineke/indent-blankline.nvim",
                config = function()
                    require("modules.tree_sitter.indent_blankline")
                end,
            },
            { "JoosepAlviste/nvim-ts-context-commentstring" },
            { "nvim-treesitter/playground" },
            { "andymass/vim-matchup" },
            { "nvim-treesitter/nvim-treesitter-textobjects" },
        },
        keys = {
            { "<c-space>", desc = "Increment selection" },
            { "<bs>", desc = "Schrink selection", mode = "x" },
        },
        config = require("modules.tree_sitter.treesitter"),
    },
}
