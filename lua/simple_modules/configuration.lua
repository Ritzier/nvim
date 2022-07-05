local function req(name)
    require("simple_modules." .. name)
end

req("bufferline")
req("nvim_tree")
req("autopairs")
req("gitsigns")
req("notify")
req("lualine")
req("keymaps")
req("alpha")
