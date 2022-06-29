local M = {}

function M.theme()
    local present, nightfox = pcall(require, "nightfox")
    if present then
        vim.cmd "colorscheme duskfox"
    end
end

function M.init()
    require("core.options")
    require("core.mappings")
    require("keymap")
    require("plugins")
    M.theme()
end

return M
