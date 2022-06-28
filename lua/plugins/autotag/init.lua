local M = {}
local script = require("core.script")

function M.setup()
    if script.check("nvim-ts-autotag") then
        M.config()
    end
end

function M.config()
    require("nvim-ts-autotag").setup({
        filetypes = {
            "html",
            "xml",
            "javascript",
            "typescriptreact",
            "javascriptreact",
            "vue",
        },
    })
end

--M.config()

M.setup()
