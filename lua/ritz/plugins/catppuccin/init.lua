local M = {}
local Script = require("ritz.core.script")

function M.setup()
    if Script.check("catppuccin") then
        M.config()
    end
end

function M.config()
    require("catppuccin").setup({
        transparent_background = false,
        term_colors = true,
        styles = {
            comments = "italic",
            functions = "italic,bold",
            keywords = "italic",
            strings = "NONE",
            variables = "NONE",
        },
        integrations = {
            treesitter = true,
            native_lsp = {
                enabled = true,
                virtual_text = {
                    errors = "italic",
                    hints = "italic",
                    warnings = "italic",
                    information = "italic",
                },
                underlines = {
                    errors = "underline",
                    hints = "underline",
                    warnings = "underline",
                    information = "underline",
                },
            },
            lsp_trouble = true,
            lsp_saga = true,
            gitgutter = false,
            gitsigns = true,
            telescope = true,
            nvimtree = { enabled = true, show_root = true },
            which_key = true,
            indent_blankline = { enabled = true, colored_indent_levels = false },
            dashboard = true,
            neogit = false,
            vim_sneak = false,
            fern = false,
            barbar = false,
            bufferline = true,
            markdown = true,
            lightspeed = false,
            ts_rainbow = true,
            hop = true,
        },
    })
end

M.setup()
