return function()
	require("tokyonight").setup({
		style = "storm",
		light_style = "day",
		transparent = "false",
		terminal_colors = true,
		styles = {
			comments = { italic = true },
			keywords = { italic = true },
			functions = { bold = true },
			variables = {},
			sidebars = "dark",
			floats = "dark",
		},
		on_highlights = function(highlights, color)
			highlights.IblIndent = { fg = "#ffffff" }
			highlights.IblScope = { fg = "#a92dff" }
			highlights.IblWhitespace = { fg = "#50feef" }
		end,
	})
end
