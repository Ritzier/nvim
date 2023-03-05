return function()
    require("illuminate").configure({
        providers = {
            "lsp",
            "treesitter",
            "regex",
        },
        delay = 100,
        filetypes_denylist = {
            "DoomInfo",
            "DressingSelect",
            "NvimTree",
            "Outline",
            "TelescopePrompt",
            "Trouble",
            "alpha",
            "dashboard",
            "dirvish",
            "fugitive",
            "help",
            "lir",
            "neogitstatus",
            "norg",
            "packer",
            "spectre_panel",
            "toggleterm",
        },
        under_cursor = false,
    })
end
