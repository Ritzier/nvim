return function()
    require("nightfox").setup({
        options = {
            compile_path = vim.fn.stdpath("cache") .. "/nightfox",
            compile_file_suffix = "_compiled",
            transparent = false,
            terminal_colors = true,
            dim_inactive = false,
            module_default = true,
            colorbind = {
                enbale = false,
                simulate_only = false,
                severity = {
                    protan = 0,
                    deutan = 0,
                    tritan = 0,
                },
            },
            styles = {
                comments = "NONE", -- Value is any valid attr-list value `:help attr-list`
                conditionals = "NONE",
                constants = "NONE",
                functions = "NONE",
                keywords = "NONE",
                numbers = "NONE",
                operators = "NONE",
                strings = "NONE",
                types = "NONE",
                variables = "NONE",
            },
            inverse = {
                match_paren = false,
                visual = false,
                search = false,
            },
            modules = {},
            palettes = {},
            specs = {},
            groups = {
                all = {

                }
            },
        }
    })
end
