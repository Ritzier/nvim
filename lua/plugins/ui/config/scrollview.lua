return function()
	require("scrollview").setup({
		mode = "virtual",
		excluded_filetypes = { "NvimTree", "terminal", "nofile", "aerial" },
		winblend = 0,
		signs_on_startup = { "diagnostics", "folds", "marks", "search", "spell" },
		diagnostics_error_symbol = "",
		diagnostics_warn_symbol = "",
		diagnostics_info_symbol = "",
		diagnostics_hint_symbol = "󰌵",
	})
end
