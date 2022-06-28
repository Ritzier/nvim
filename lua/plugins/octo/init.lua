local M = {}
local script = require("core.script")

function M.setup()
    if script.check("octo") then
        M.config()
    end
end

function M.config()
    require"octo".setup()
end

M.setup()
