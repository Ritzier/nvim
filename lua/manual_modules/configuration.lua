local function req(name)
    require("manual_modules." .. name)
end

req("impatient")
req("bufferline")
req("nvim_tree")
req("autopairs")
req("gitsigns")

-- Completion
req("lsp")

req("notify")
req("keymaps")
req("alpha")

req("treesitter")
req("indentline")
req("nvim_gps")
req("lualine")
req("toggleterm")
req("which_key")
req("symbols_outline")
