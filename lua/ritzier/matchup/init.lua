local M = {}
local Script = require("ritzier.Script")

function M.setup()
    if Script.check("colorizer") then
        M.config()
    end
end

function M.config()
    vim.cmd([[let g:matchup_matchparen_offscreen = {'method': 'popup'}]])
end

M.config()
