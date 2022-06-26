local M = {}
local Script = require("ritzier.Script")

function M.setup()
    if Script.check("nvim-ts-autotag") then
        M.config()
    end
end

function M.config()
	require("nvim-ts-autotag").setup({
		filetypes = {
			"html",
			"xml",
			"javascript",
			"typescriptreact",
			"javascriptreact",
			"vue",
		},
	})
end

M.setup()
