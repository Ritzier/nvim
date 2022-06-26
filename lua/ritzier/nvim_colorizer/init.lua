local M = {}
local Script = require("ritzier.Script")

function M.setup()
    if Script.check("colorizer") then
        M.config()
    end
end

function M.config()
    require("colorizer").setup()
end

M.setup()
