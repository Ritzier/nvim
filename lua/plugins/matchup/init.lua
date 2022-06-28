local M = {}
local script = require("core.script")

function M.setup()
    if script.check("vim-mathcup") then
        M.config()
    end
end

function M.config()
    vim.cmd([[let g:matchup_matchparen_offscreen = {'method': 'popup'}]])
end

M.setup()
