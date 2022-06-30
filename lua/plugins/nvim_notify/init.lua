local present, notify = pcall(require, "notify")

if present then
    notify.setup({
        stages = "slide",
        background_colour = "Normal",
        icons = {
            ERROR = "",
            WARN = "",
            INFO = "",
            DEBUG = "",
            TRACE = "✎",
        },
        minimum_Width = 50,
        timeout = 2000,
    })

    vim.notify = notify
end
