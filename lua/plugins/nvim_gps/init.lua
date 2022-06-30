local present, nvim_gps = pcall(require, "nvim-gps")

if present then
    require("nvim-gps").setup({
        icons = {
            ["class-name"] = " ", -- Classes and class-like objects
            ["function-name"] = " ", -- Functions
            ["method-name"] = " ", -- Methods (functions inside class-like objects)
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
            ["jsx"] = true,
            ["lua"] = true,
            ["ruby"] = true,
            ["php"] = true,
            ["python"] = true,
            ["rust"] = true,
            ["scss"] = true,
            ["toml"] = true,
            ["typescript"] = true,
            ["yaml"] = true,
        },
        separator = " > ",
    })
end
