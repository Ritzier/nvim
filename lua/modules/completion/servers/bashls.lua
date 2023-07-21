return function(opts)
    require("lspconfig")["bashls"].setup({
        cd = { "bash-language-server", "start" },
        filetype = { "zsh", "bash", "sh" }
    })
end
