local M = {}
local script = require("core.script")

function M.setup()
    if script.check("luasnip") then
        M.config()
    end
end

function M.config()
    vim.o.runtimepath = vim.o.runtimepath .. "," .. os.getenv("HOME") .. "/.config/nvim/my-snippets/,"
    require("luasnip").config.set_config({
        history = true,
        updateevents = "TextChanged,TextChangedI",
    })
    require("luasnip.loaders.from_lua").lazy_load()
    require("luasnip.loaders.from_vscode").lazy_load()
    require("luasnip.loaders.from_snipmate").lazy_load()
end

M.setup()
