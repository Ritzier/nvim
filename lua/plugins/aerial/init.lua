local M = {}
local script = require("core.script")

function M.setup()
    if script.check("aerial") then
        M.config()
    end
end

function M.config()
    require("aerial").setup()
end

M.setup()
