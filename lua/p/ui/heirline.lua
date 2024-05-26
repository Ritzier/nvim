-- LOL, lazy to configuration this. Pending...

return function()
    local heirline = require("heirline")
    local condition = require("heirline.conditions")
    local utils = require("heirline.utils")

    local Statusline = {}
    local Winbar = {}
    local Tabline = {}
    local Statuscolumn = {}

    local Diagnostics = {
    }

    require("heirline").setup({
        statusline = Statusline,
        winbar = Winbar,
        tabline = Tabline,
        statuscolumn = Statuscolumn,
    })

end
