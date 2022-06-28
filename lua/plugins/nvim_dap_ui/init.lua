local M = {}
local script = require("core.script")

function M.setup()
    if script.check("dapui") then
        M.config()
    end
end

function M.config()
    require("dapui").setup()
end

M.setup()
