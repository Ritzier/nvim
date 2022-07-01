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
    require("plugins").setup()
    require("core.autocmd")
    M.theme()
end

return M
