local present, module = pcall(require, "notify")
if present then
    local notify = require("notify")
    notify.setup({
        stages = "slide",
        on_open = nil,
        on_close = nil,
        timeout = 2000,
        render = "default",
        background_colour = "Normal",
        minimum_width = 50,
        icons = {
            ERROR = "",
            WARN = "",
            INFO = "",
            DEBUG = "",
            TRACE = "✎",
        },
    })

    vim.notify = notify
end
