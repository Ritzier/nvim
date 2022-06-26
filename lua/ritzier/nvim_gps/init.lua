local M = {}
local Script = require("ritzier.Script")

function M.setup()
    if Script.check("nvim-gps") then
        M.config()
    end
end

function M.config()
	require("nvim-gps").setup({
		icons = {
			["class-name"] = " ", -- Classes and class-like objects
			["function-name"] = " ", -- Functions
			["method-name"] = " ", -- Methods (functions inside class-like objects)
		},
		languages = {
            ["bash"] = true,
			["c"] = true,
            ["c_sharp"] = true,
			["cpp"] = true,
			["go"] = true,
			["java"] = true,
			["javascript"] = true,
            ["json"] = true,
			["lua"] = true,
            ["php"] = true,
			["python"] = true,
            ["ruby"] = true,
			["rust"] = true,
            ["tom"] = true,
            ["typescript"] = true,
            ["yaml"] = true,
		},
		separator = " > ",
	})
end

M.setup()
