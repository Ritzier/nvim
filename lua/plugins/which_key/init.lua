local M = {}
local script = require("core.script")

function M.setup()
    if script.check("which-key") then
        M.config()
    end
end

function M.config()
    require("which-key").setup({
        plugins = {
            presets = {
                operators = false,
                motions = false,
                text_objects = false,
                windows = false,
                nav = false,
                z = true,
                g = true,
            },
        },

        icons = {
            breadcrumb = "»",
            separator = "│",
            group = "+",
        },

        window = {
            border = "none",
            position = "bottom",
            margin = { 1, 0, 1, 0 },
            padding = { 1, 1, 1, 1 },
            winblend = 0,
        },
    })
end

M.config()
--M.setup()
