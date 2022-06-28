local M = {}
local script = require("core.script")

function M.setup()
    if script.check("nvim-dap-virtual-text") then
        M.config()
    end
end

function M.config()
    require("nvim-dap-virtual-text").setup()
end

M.setup()
