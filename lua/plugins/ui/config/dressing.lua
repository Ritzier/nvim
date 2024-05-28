return function()
    require("dressing").setup({
        input = {
            relative = "editor",
            border = "rounded",
            win_options = {
                winhighlight = 'NormalFloat:DiagnosticError'
            }
        }
    })
end
