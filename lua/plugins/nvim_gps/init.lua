local M = {}
local script = require("core.script")

function M.setup()
    if script.check("nvim-gps") then
        M.config()
    end
end

function M.config()
    require("nvim-gps").setup({
        icons = {
            ["class-name"] = " ", -- Classes and class-like objects
            ["function-name"] = " ", -- Functions
            ["method-name"] = " ", -- Methods (functions inside class-like objects)
            ["container-name"] = '⛶ ',  -- Containers (example: lua tables)
            ["tag-name"] = '炙'         -- Tags (example: html tags)

        },
        languages = {
            -- You can disable any language individually here
            ["bash"] = true,
            ["c"] = true,
            ["c_sharp"] = true,
            ["cpp"] = true,
            ["go"] = true,
            ["haskell"] = true,
            ["html"] = true,
            ["java"] = true,
            ["javascript"] = true,
            ["json"] = true,
            ["lua"] = true,
            ["php"] = true,
            ["python"] = true,
            ["ruby"] = true,
            ["rust"] = true,
            ["typescript"] = true,
            ["yaml"] = true,
        },
        separator = " > ",
    })
end

M.setup()
