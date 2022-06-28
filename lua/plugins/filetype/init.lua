local M = {}
local script = require("core.script")

function M.setup()
    if script.check("filetype") then
        M.config()
    end
end

function M.config()
    require("filetype").setup({
        overrides = {
            shebang = {
                -- Set the filetype of files with a dash shebang to sh
                dash = "sh",
            },
        },
    })
end

M.setup()
