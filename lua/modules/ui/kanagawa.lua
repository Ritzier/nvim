return function()
	require("kanagawa").setup({
        commentStyle = { italic = false },
        functionStyle = { bold = true, italic = true },
        keywordStyle = { italic=true },
        statementStyle = {},
        typeStyle = {},

        dimInactive = false,
        globalStatus = true,
        -- overrides = {
        -- }
	})
end
