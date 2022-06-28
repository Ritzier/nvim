local M = {}
local script = require("core.script")

function M.setup()
    if script.check("neoclip") then
        M.config()
    end
end

function M.config()
    require('neoclip').setup()
end

M.setup()
