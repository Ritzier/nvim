require("core.options")
require("core.autocmd")

if pcall(require, "nightfox") then
    vim.cmd "colorscheme duskfox"
end
