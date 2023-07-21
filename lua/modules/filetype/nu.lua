return function()
    require("nu").setup({
        use_lsp_features = true,
        all_cmd_names = [[nu -c 'help commands | get name | str join "\n"']]
    })
end
