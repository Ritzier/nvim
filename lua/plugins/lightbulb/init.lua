local M = {}
local script = require("core.script")

function M.setup()
    if script.check("nvim-lightbulb") then
        M.config()
    end
end

function M.config()
    vim.cmd([[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]])
end

M.setup()
