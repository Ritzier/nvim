require("ritzier.options")
require("ritzier.plugins").setup()
require("ritzier.mappings")

local configuration = {}
function configuration.colorscheme()
    local ok, catppuccin = pcall(require, "catppuccin")
    if ok then
        vim.cmd "colorscheme catppuccin"
    end
end

function configuration.setup()
    configuration.colorscheme()
end

configuration.setup()
