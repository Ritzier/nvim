return {
    "sQVe/sort.nvim",
    event = "CmdlineEnter",
    config = function()
        require("sort").setup()
    end
}
