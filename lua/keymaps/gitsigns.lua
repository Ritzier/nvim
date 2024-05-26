local mapping

function mapping:gitsigns(buf)
    require("wk").register({
    }, {mode= "n", prefix = "<leader>", silent = true, buffer = buf})
end

return mapping
