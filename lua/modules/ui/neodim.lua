return function()

	require("neodim").setup({
		alpha = 0.45,
		blend_color = "#000000",
		refresh_delay = 75, -- time in ms to wait after typing before refreshing diagnostics
		hide = {
			virtual_text = true,
			signs = false,
			underline = false,
		},
		priority = 80,
		disable = { "big_file_disabled_ft" },
	})
end
