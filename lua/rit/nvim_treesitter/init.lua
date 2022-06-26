local M = {}
local Script = require("ritzier.Script")

function M.setup()
    if Script.check("nvim-treesitter") then
        M.config()
    end
end

function M.config()
	vim.api.nvim_command("set foldmethod=expr")
	vim.api.nvim_command("set foldexpr=nvim_treesitter#foldexpr()")

	require("nvim-treesitter.configs").setup({
        ensure_installed = "all",
    })
end


require("nvim-treesitter.configs").setup({
    ensure_installed = "all",
    sync_install = false,
    highlight = {
        enable = true,
    },
})
