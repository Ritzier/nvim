local M = {}
local script = require("core.script")

function M.setup()
    if script.check("colorizer") then
        M.config()
    end
end

function M.config()
    require("colorizer").setup()
end

M.setup()
