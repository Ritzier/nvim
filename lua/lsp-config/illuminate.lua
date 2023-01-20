require("illuminate").configure({
  providers = {
    "lsp",
    "treesitter",
    "regex",
  },
  delay = 100,
  filetypes_denylist = {
    "alpha",
    "dashboard",
    "DoomInfo",
    "fugitive",
    "help",
    "norg",
    "NvimTree",
    "Outline",
    "packer",
    "toggleterm",
  },
  under_cursor = false,
})

-- illuminate setting
-- vim.api.nvim_command([[ hi def link LspReferenceText CursorLine ]])
-- vim.api.nvim_command([[ hi def link LspReferenceWrite CursorLine ]])
-- vim.api.nvim_command([[ hi def link LspReferenceRead CursorLine ]])
