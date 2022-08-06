require("lsp_lines").setup()
vim.keymap.set( "", "<C-l>", require("lsp_lines").toggle, { desc = "Toggle lsp_lines" })
