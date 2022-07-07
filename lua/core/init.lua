require("core.options")
require("core.autocmd")
require("core.mappings")

if pcall(require, "nightfox") then
    vim.cmd "colorscheme duskfox"
end
