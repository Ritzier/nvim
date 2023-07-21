return function()
    local ft = require("guard.filetype")

    ft('lua'):fmt("stylua")

    ft('rust'):fmt("rustfmt")

    require("guard").setup({
        fmt_on_save = false
    })
end
